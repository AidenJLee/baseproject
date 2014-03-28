//
//  SideGestureDelegate.m
//  motelApp
//
//  Created by AidenLee on 2014. 3. 21..
//  Copyright (c) 2014년 yanolja. All rights reserved.
//

#import "SideGestureDelegate.h"

@interface SideGestureDelegate () {
    
    UIPanGestureRecognizer *_panGestureRecognizer;
    
    NSTimeInterval _defaultDuration;
    
    NSLayoutConstraint *_constraintLead;
    NSLayoutConstraint *_constraintTrail;
    
    __weak UIView *_viewTarget;     // pan gesture를 받는 view (여기에서는 window)
    __weak UIView *_viewAction;    // pan gesture에 의해 움직이는 view
    __weak UIView *_viewBlock;
    NSArray *_arrFollowingView;
    
    /* 액션을 하기 위한 기준값 */
    CGFloat _openX;           // 열리는 x좌표 값(대부분 +값)
    CGFloat _closeX;          // 닫히는 x좌표 값(대부분 -값)
    
    /* 상태 추적 */
    CGPoint _panStartingPoint;      // pan gesture가 시작되는 위치(변화값으로 화면들을 이동 시킨다.)
    CGRect  _rectFloatingViewFrame;
    CGFloat _fltMoveableViewsLastX; // 마지막 moveable View들의 x좌표
    
}

@end

@implementation SideGestureDelegate

#pragma mark -
#pragma mark Init

- (id)init
{
    self = [super init];
    
    if (self) {
        _enabled = YES;
        _defaultDuration = 0.25;
        _sideState = SideClose;
    }
    
    return self;
}

- (id)initWithUserInfo:(id)userInfo
{
    self = [self init];
    
    if (self) {
        _constraintLead     = userInfo[@"constraints"][@"leading"];
        _constraintTrail    = userInfo[@"constraints"][@"trailing"];
        
        _viewTarget         = userInfo[@"targetView"];
        _viewAction         = userInfo[@"actionView"];
        
        _openX              = [userInfo[@"openX"] floatValue];
        _closeX             = [userInfo[@"closeX"] floatValue];
        
        _panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(viewDidPanGesture:)];
        _panGestureRecognizer.delegate = self;
        [_viewTarget addGestureRecognizer:_panGestureRecognizer];
        
        _enabled = YES;
    }
    
    return self;
}

- (void)didMoveSideViewForDirection:(SideState)direction
{
    CGFloat contentOrigin = 0.0f;
    
    if ([_delegate respondsToSelector:@selector(didSlidingWithDirection:)]) {
        [_delegate didSlidingWithDirection:direction];
    }
    
    if (direction == SideClose) {
        contentOrigin = _closeX;
        self.sideState = SideClose;
    } else if (direction == SideOpen) {
        contentOrigin = _openX;
        self.sideState = SideOpen;
    } else {
        if (_constraintLead.constant <= contentOrigin) {
            contentOrigin = _openX;
            self.sideState = SideOpen;
        }
    }
    
    [UIView animateWithDuration:0.5f
                          delay:0.0f
         usingSpringWithDamping:0.8f
          initialSpringVelocity:1.0f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         
                         _constraintLead.constant = contentOrigin;
                         _constraintTrail.constant = -_constraintLead.constant;
                         
                         [_viewAction layoutIfNeeded];
                         
                     } completion:^(BOOL finished) {
                         
                     }];
    
}

#pragma mark -
#pragma mark UIGestureRecognizerDelegate Method Implement

- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)panGestureRecognizer {
    CGPoint translation = [panGestureRecognizer translationInView:_viewTarget];
    return fabs(translation.x) > fabs(translation.y);
}

#pragma mark -
#pragma mark Callback Method

- (void)viewDidPanGesture:(UIPanGestureRecognizer *)gestureRecognizer
{
    if (!self.enabled) {
        return;
    }
    [self panGestureRecognizer:gestureRecognizer targetView:_viewTarget floatingView:_viewAction userInfo:nil];
}

#pragma mark -
#pragma mark Private Method

// 제스쳐에 대한 액션
// !주의 panGestureRecognizer가 nil인 경우엔 제스쳐에 대한 액션이 아닌 버튼 등에 의한 호출로 판단.
//      이때는 반드시 userInfo에 direction이 들어와야 함.
- (void)panGestureRecognizer:(UIPanGestureRecognizer *)panGestureRecognizer
                  targetView:(UIView *)targetView
                floatingView:(UIView *)floatingView
                    userInfo:(id)userInfo
{
    
    // 제스쳐에 의한 호출이 아닌 경우
    if (!panGestureRecognizer) {
        return;
    }
    
    CGPoint pntLocationInView = [panGestureRecognizer locationInView:targetView];
    //    CGPoint pntVelocityInView = [panGestureRecognizer velocityInView:targetView];
    
    switch (panGestureRecognizer.state) {
            
            // 1. 터치가 시작된 경우
            //   - 시작 좌표를 저장해 둠.(단, 상단 일정부분의 영역이 아닌 경우 블럭팅 한다.)
        case UIGestureRecognizerStateBegan: {
            
            // 시작 좌표를 저장, 시작 floatingView의 frame 저장
            _panStartingPoint      = pntLocationInView;
            _rectFloatingViewFrame = floatingView.frame;
            
        } break;
            
            // 2. 터치가 변경된 경우 (드래깅 중)
            //   - 좌표가 변경된 값에 따라 floatingView를 움직여준다.
        case UIGestureRecognizerStateChanged: {
            
            CGFloat contentOrigin = _rectFloatingViewFrame.origin.x + pntLocationInView.x - _panStartingPoint.x;
            
            if (contentOrigin > 0) {
                _constraintLead.constant = contentOrigin;
                _constraintTrail.constant = -_constraintLead.constant;
                
                [_viewAction layoutIfNeeded];
            } else {
                _constraintLead.constant = 0.0f;
                _constraintTrail.constant = -_constraintLead.constant;
                
                [_viewAction layoutIfNeeded];
            }
            
            
        } break;
            
            // 3. 터치가 완료된 경우 (손가락을 땐 경우)
            //   - 임의의 x좌표로 floatingView를 이동시킨다.
        case UIGestureRecognizerStateEnded: {
            
            // 오른쪽 이동 중으로 판단.
            if (floatingView.frame.origin.x - _rectFloatingViewFrame.origin.x > 0) {
                [self didMoveSideViewForDirection:SideOpen];
            } else if (floatingView.frame.origin.x - _rectFloatingViewFrame.origin.x < 0) {    // 왼쪽 이동 중으로 판단.
                [self didMoveSideViewForDirection:SideClose];
            }
            
        } break;
            
        default:
            break;
    }
    
}

@end

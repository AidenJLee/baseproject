//
//  UIImageView+Masking.m
//  WishPick
//
//  Created by CHK on 2013. 11. 8..
//  Copyright (c) 2013년 CHK. All rights reserved.
//

#import "UIImageView+Masking.h"

@implementation UIImageView (Masking)

- (void)setMaskWithMaskingImage:(UIImage *)image
{
    CALayer *mask = [CALayer layer];
    mask.contents = (id)[image CGImage];
    mask.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    self.layer.mask = mask;
    self.layer.masksToBounds = YES;
}

@end

//
//  UIImage+Crop.m
//  Wish
//
//  Created by CHK on 2013. 11. 6..
//  Copyright (c) 2013년 CHK. All rights reserved.
//

#import "UIImage+Crop.h"

@implementation UIImage (Crop)

- (UIImage *)cropFromRect:(CGRect)fromRect
{
    fromRect = CGRectMake(fromRect.origin.x * self.scale,
                          fromRect.origin.y * self.scale,
                          fromRect.size.width * self.scale,
                          fromRect.size.height * self.scale);
    CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, fromRect);
    UIImage* crop = [UIImage imageWithCGImage:imageRef scale:self.scale orientation:self.imageOrientation];
    CGImageRelease(imageRef);
    return crop;
}

@end

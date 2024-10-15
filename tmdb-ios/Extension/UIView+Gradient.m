//
//  UIViewGradient.m
//  tmdb-ios
//
//  Created by Paola Miranda on 10/14/24.
//

#import "UIView+Gradient.h"

@implementation UIView (Gradient)

- (void)addBlackGradientToView {
    // 1. Create a gradient layer
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];

    // 2. Set the gradient's frame to the view's bounds
    gradientLayer.frame = self.bounds;

    // 3. Set the colors for the gradient (CGColor is required)
    gradientLayer.colors = @[(__bridge id)[UIColor clearColor].CGColor,
                             (__bridge id)[UIColor blackColor].CGColor];

    // 4. Optionally, set the locations of the gradient stops (0.0 to 1.0)
    gradientLayer.locations = @[@0.0, @0.6];

    // 5. Optionally, set the direction of the gradient
    gradientLayer.startPoint = CGPointMake(0.0, 0.0); // top-left
    gradientLayer.endPoint = CGPointMake(0.0, 1.0);   // bottom-left

    // 6. Add the gradient layer to the view's layer
    [self.layer insertSublayer:gradientLayer atIndex:0];
}

@end

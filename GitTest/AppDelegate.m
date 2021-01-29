//
//  AppDelegate.m
//  GitTest
//
//  Created by liangjian on 2021/1/13.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
//    UIView *view = self.window.rootViewController.view;
//    CALayer *logoLayer = [CALayer new];
//    logoLayer.bounds = CGRectMake(0, 0, 100, 100);
//    logoLayer.position = view.center;
//    logoLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"TwitterLogo_white"].CGImage);
//    view.layer.mask = logoLayer;
//    
//    UIView *shelterView = [[UIView alloc] initWithFrame:view.frame];
//    shelterView.backgroundColor = [UIColor whiteColor];
//    [view addSubview:shelterView];
//    
//    self.window.backgroundColor = [UIColor systemBlueColor];
//    CAKeyframeAnimation *logoAnimation = [CAKeyframeAnimation animationWithKeyPath:@"bounds"];
//    logoAnimation.beginTime = CACurrentMediaTime() + 1;
//    logoAnimation.duration = 1;
//    logoAnimation.keyTimes = @[@0, @0.4, @1];
//    logoAnimation.values = @[[NSValue valueWithCGRect:CGRectMake(0, 0, 100, 100)],
//                             [NSValue valueWithCGRect:CGRectMake(0, 0, 85, 85)],
//                             [NSValue valueWithCGRect:CGRectMake(0, 0, 4500, 4500)]];
//    logoAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
//                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
//    logoAnimation.removedOnCompletion = NO;
//    logoAnimation.fillMode = kCAFillModeForwards;
//    [logoLayer addAnimation:logoAnimation forKey:@"zoomAnimation"];
//    
//    CAKeyframeAnimation *mainViewAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
//    mainViewAnimation.beginTime = CACurrentMediaTime() + 1.1;
//    mainViewAnimation.duration = 0.6;
//    mainViewAnimation.keyTimes = @[@0, @0.5, @1];
//    mainViewAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DIdentity],
//                                  [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 1.1, 1.1, 1)],
//                                  [NSValue valueWithCATransform3D:CATransform3DIdentity]];
//    [view.layer addAnimation:mainViewAnimation forKey:@"transformAnimation"];
//    view.layer.transform = CATransform3DIdentity;
//    [UIView animateWithDuration:0.3 delay:1.4 options:UIViewAnimationOptionCurveLinear animations:^{
//            shelterView.alpha = 0;
//        } completion:^(BOOL finished) {
//            [shelterView removeFromSuperview];
//            view.layer.mask = nil;
//        }];
    
    
    return YES;
}





@end

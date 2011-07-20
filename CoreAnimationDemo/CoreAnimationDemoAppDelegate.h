//
//  CoreAnimationDemoAppDelegate.h
//  CoreAnimationDemo
//
//  Created by Joost on 7/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CoreAnimationDemoViewController;

@interface CoreAnimationDemoAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet CoreAnimationDemoViewController *viewController;

@end

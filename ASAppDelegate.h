//
//  ASAppDelegate.h
//  AnimalSounds
//
//  Created by Tim Novikoff on 9/21/13.
//  Copyright (c) 2013 Tim Novikoff. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ASViewController;

@interface ASAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ASViewController *viewController;

@end

//
//  QuizAppDelegate.h
//  Quiz
//
//  Created by hirocaster on 8/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QuizViewController;

@interface QuizAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet QuizViewController *viewController;

@end

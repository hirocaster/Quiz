//
//  QuizViewController.h
//  Quiz
//
//  Created by hirocaster on 8/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Quiz;

@interface QuizViewController : UIViewController
{
    Quiz *_quiz;
}

- (IBAction)startQuiz:(id)sender;

@end

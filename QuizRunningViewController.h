//
//  QuizRunningViewController.h
//  Quiz
//
//  Created by hirocaster on 8/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@class Quiz;

@interface QuizRunningViewController : UIViewController
{
    Quiz *_quiz;
    UITextView *_questionTextView;
    UIButton *_answerButton1;
    UIButton *_answerButton2;
    UIButton *_answerButton3;
    UIButton *_answerButton4;
    SystemSoundID _rightSound;
    SystemSoundID _notRightSound;
}

@property (retain, nonatomic) Quiz *quiz;
@property (retain, nonatomic) IBOutlet UITextView *questionTextView;
@property (retain, nonatomic) IBOutlet UIButton *answerButton1;
@property (retain, nonatomic) IBOutlet UIButton *answerButton2;
@property (retain, nonatomic) IBOutlet UIButton *answerButton3;
@property (retain, nonatomic) IBOutlet UIButton *answerButton4;

- (IBAction)answer:(id)sender;
- (void)showNextQuiz;

@end

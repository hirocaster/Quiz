//
//  QuizRunningViewController.m
//  Quiz
//
//  Created by hirocaster on 8/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "QuizRunningViewController.h"
#import "Quiz.h"
#import "QuizItem.h"
#import <AudioToolbox/AudioToolbox.h>

static const NSInteger kQuizCount = 5;
static const NSTimeInterval kNextQuizInterval = 2.0;

@implementation QuizRunningViewController

@synthesize quiz = _quiz;
@synthesize questionTextView = _questionTextView;
@synthesize answerButton1 = _answerButton1;
@synthesize answerButton2 = _answerButton2;
@synthesize answerButton3 = _answerButton3;
@synthesize answerButton4 = _answerButton4;

- (id)init
{
    self = [super initWithNibName:@"QuizRunningViewController" bundle:nil];
    if (self) {
        _quiz = nil;
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *path;
        NSURL *url;
        
        path = [bundle pathForResource:@"Right" ofType:@"aiff"];
        url = [NSURL fileURLWithPath:path];
        AudioServicesCreateSystemSoundID((CFURLRef)url, &_rightSound);
        
        path = [bundle pathForResource:@"NotRight" ofType:@"aiff"];
        url = [NSURL fileURLWithPath:path];
        AudioServicesCreateSystemSoundID((CFURLRef)url, &_notRightSound);
    }
    return self;
}

- (void)dealloc
{
    AudioServicesDisposeSystemSoundID(_rightSound);
    AudioServicesDisposeSystemSoundID(_notRightSound);
    [_quiz release];
    [_questionTextView release];
    [_answerButton1 release];
    [_answerButton2 release];
    [_answerButton3 release];
    [_answerButton4 release];
    [super dealloc];

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self showNextQuiz];
}

- (void)showNextQuiz
{
    QuizItem *item = [self.quiz nextQuiz];
    self.questionTextView.text = item.question;
    NSArray *choices = item.randomChoicesArray;
    
    NSArray *buttons = [NSArray arrayWithObjects:self.answerButton1,
                        self.answerButton2,
                        self.answerButton3,
                        self.answerButton4, nil];
    NSUInteger i;
    
    for (i = 0; i < [choices count] && i < [buttons count]; i++) {
        NSString *str = [choices objectAtIndex:i];
        UIButton *button = [buttons objectAtIndex:i];
        [button setTitle:str forState:UIControlStateNormal];
    }
    [self.view setNeedsLayout];
}

- (IBAction)answer:(id)sender
{
    self.answerButton1.enabled = NO;
    self.answerButton2.enabled = NO;
    self.answerButton3.enabled = NO;
    self.answerButton4.enabled = NO;
    
    NSString *str = [[sender titleLabel] text];
    QuizItem *item = [self.quiz.usedQuizItems lastObject];
    
    if ([item checkIsRightAnswer:str]) {
        [sender setTitle:[NSString stringWithFormat:@"○ %@", str]
                forState:UIControlStateNormal];
        AudioServicesPlaySystemSound(_rightSound);
    }
    else
    {
        [sender setTitle:[NSString stringWithFormat:@"× %@", str]
                forState:UIControlStateNormal];
        AudioServicesPlaySystemSound(_notRightSound);
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    }
    
    [self.view setNeedsLayout];
    
    [self performSelector:@selector(nextQuiz:)
               withObject:nil
               afterDelay:kNextQuizInterval];
}

- (void)nextQuiz:(id)sender
{
    if ([self.quiz.usedQuizItems count] == kQuizCount) {
        [self dismissModalViewControllerAnimated:YES];
    }
    else
    {
        self.answerButton1.enabled = YES;
        self.answerButton2.enabled = YES;
        self.answerButton3.enabled = YES;
        self.answerButton4.enabled = YES;        
        [self showNextQuiz];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

//
//  QuizItem.m
//  Quiz
//
//  Created by hirocaster on 8/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "QuizItem.h"

@implementation QuizItem

@synthesize question = _question;
@synthesize rightAnswer = _rightAnswer;
@synthesize choicesArray = _choicesArray;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        _question = nil;
        _rightAnswer = nil;
        _choicesArray = nil;
    }
    
    return self;
}

- (void)dealloc
{
    [_question release];
    [_rightAnswer release];
    [_choicesArray release];
    [super dealloc];
}

- (NSArray *)randomChoicesArray
{
    NSMutableArray *newArray = [NSMutableArray array];
    
    NSMutableArray *remainArray;
    remainArray = [NSMutableArray arrayWithArray:self.choicesArray];
    
    while ([remainArray count] > 0) {
        NSInteger ind;
        ind = random() % [remainArray count];
        [newArray addObject:[remainArray objectAtIndex:ind]];
        [remainArray removeObjectAtIndex:ind];
    }
    return newArray;
}

- (BOOL)checkIsRightAnswer:(NSString *)answer
{
    return [self.rightAnswer isEqualToString:answer];
}

@end

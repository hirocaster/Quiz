//
//  QuizItem.h
//  Quiz
//
//  Created by hirocaster on 8/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuizItem : NSObject
{
    NSString *_question;
    NSString *_rightAnswer;
    NSArray *_choicesArray;
}

@property (retain, nonatomic) NSString *question;
@property (retain, nonatomic) NSString *rightAnswer;
@property (retain, nonatomic) NSArray *choicesArray;
@property (readonly, nonatomic) NSArray *randomChoicesArray;

- (BOOL)checkIsRightAnswer:(NSString *)answer;

@end

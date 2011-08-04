//
//  Quiz.h
//  Quiz
//
//  Created by hirocaster on 8/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class QuizItem;

@interface Quiz : NSObject
{
    NSArray *_quizItemsArray;
    NSMutableArray *_usedQuizItems;
}

@property (retain, nonatomic) NSArray *quizItemsArray;
@property (readonly, nonatomic) NSMutableArray *usedQuizItems;

- (QuizItem *)nextQuiz;
- (void)clear;
- (BOOL)readFromFile:(NSString *)filePath;

@end

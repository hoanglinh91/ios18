//
//  sudoku.m
//  sudoku
//
//  Created by MAC on 10/9/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "sudoku.h"

@implementation sudoku

-(NSMutableArray *)getData{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"sudoku" ofType:@"txt"];
    
    NSString *data = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];

    NSMutableArray * array = [[NSMutableArray alloc] initWithCapacity:81];
    for (int i=0; i<[data length]; i++) {
        if ([data characterAtIndex:i] != ' ') {
            if ([data characterAtIndex:i] == 'x')
                [array addObject:@0];
            else
                [array addObject:[NSString stringWithFormat:@"%c",[data characterAtIndex:i]]];
        }
    }
    
    return array;
}

-(void)getResult:(NSArray *) arr{
    
}
@end

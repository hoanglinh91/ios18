//
//  Khi.m
//  DemoOOP
//
//  Created by techmaster on 10/4/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import "Gorilla.h"

@implementation Gorilla
-(id)initWithName:(NSString *)name
{
    self.name = name;
    self->_voices = [[NSMutableArray alloc] initWithObjects:@"hu..hu.uu", nil];
    return self;
}

@end

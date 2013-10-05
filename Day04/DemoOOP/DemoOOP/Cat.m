//
//  Cat.m
//  DemoOOP
//
//  Created by techmaster on 10/4/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import "Cat.h"

@implementation Cat
-(id) initWithName:(NSString *)name
{
    self.name = name;
    self->_voices = [[NSMutableArray alloc] initWithObjects:@"meo meo", nil];
    return self;
}
@end

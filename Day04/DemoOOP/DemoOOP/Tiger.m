//
//  Tiger.m
//  DemoOOP
//
//  Created by techmaster on 10/4/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import "Tiger.h"

@implementation Tiger
- (id) initWithName:(NSString *)name
{
    self = [super initWithName:name];
    self->_voices = [NSMutableArray arrayWithObjects:@"Oar", @"Krrr", nil];
    return self;
}


- (void) doSomethingMoveable
{
    self->_moveable = YES; //truy xuất biến thành phần
    NSLog(@"%d", _moveable); //Nếu hàm truy xuất biến trong cùng một đối tượng
    
}
@end

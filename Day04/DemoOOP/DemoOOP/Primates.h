//
//  Primates.h
//  DemoOOP
//
//  Created by techmaster on 10/4/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//  Bộ linh trưởng

#import "Animal.h"
#import "EatingLeaf.h"
#import "Sounding.h"

@interface Primates : Animal <EatingLeaf, Sounding>
-(void)sound;
@end

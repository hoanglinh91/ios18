//
//  Scene.m
//  DemoOOP
//
//  Created by techmaster on 10/4/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import "Scene.h"

@implementation Scene
-(id) initScene{
    
    self.level = 0;
    self.price = 0;
    self -> _animals = [[NSMutableArray alloc] initWithObjects:@"bunny",@"tiger",@"whale", nil];
    self -> _backgrounds = [[NSMutableArray alloc] initWithObjects:@"jungle",@"lake", nil];
    return self;
}

-(id) currentScene:(int)level
{
    self.level = level;
    
    if (self.level == 1) {
        self.currentBackground  = _backgrounds[0];
        self.currentPlayer = _animals[0];
        self.currentEnemy = _animals[1];
    }
    else if (self.level == 2){
        self.currentBackground  = _backgrounds[1];
        self.currentPlayer = _animals[1];
        self.currentEnemy = _animals[2];
    }
    return self;
}
@end

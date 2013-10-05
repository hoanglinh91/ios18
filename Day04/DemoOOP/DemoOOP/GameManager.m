//
//  GameManager.m
//  DemoOOP
//
//  Created by techmaster on 10/4/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import "GameManager.h"

@implementation GameManager
-(void) startGame{
    
}

-(void)resumeGame{
    
}

-(void) pauseGame{
    
}

-(void) endGame{
    
}

// khởi tạo coin ban đầu
- (id) initWithCoint: (int) startingCoins
{
    self.coinAmount = startingCoins;
    return self;
}

// mua coin
- (void) purchaseCoint: (int) numberOfCoins
{
    self.coinAmount += numberOfCoins;
}
@end

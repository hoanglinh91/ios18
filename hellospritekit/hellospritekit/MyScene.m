//
//  MyScene.m
//
//  author : kannabyz
//  project : tiep vien ban may bay
//
//  Created by MAC on 9/29/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "MyScene.h"

static const uint32_t rocketCategory     =  1;
static const uint32_t monsterCategory        =  2;

@interface MyScene() <SKPhysicsContactDelegate>
@property (nonatomic) SKSpriteNode * player;
@property (nonatomic) SKSpriteNode *bg;
@property (nonatomic) NSTimeInterval lastSpawnTimeInterval;
@property (nonatomic) NSTimeInterval lastUpdateTimeInterval;
@end

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        NSLog(@"%@",NSStringFromCGSize(size));
        
        self.backgroundColor = [SKColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
        
        // add background layer
        self.bg = [SKSpriteNode spriteNodeWithImageNamed:@"background.jpg"];
        self.bg.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        self.bg.size = self.frame.size;
        [self addChild:self.bg];
        // add tiepvien layer
        
        self.player = [SKSpriteNode spriteNodeWithImageNamed:@"herobansungcoi"];
        self.player.position = CGPointMake(30, 130);
        self.player.size = CGSizeMake(self.frame.size.width/7, self.frame.size.height/7);
        [self addChild:self.player];
        
        self.physicsWorld.gravity = CGVectorMake(0, 0);
        self.physicsWorld.contactDelegate = self;
    }
    return self;
}

#pragma calculation

static inline CGPoint rwAdd(CGPoint a, CGPoint b) {
    return CGPointMake(a.x + b.x, a.y + b.y);
}

static inline CGPoint rwSub(CGPoint a, CGPoint b) {
    return CGPointMake(a.x - b.x, a.y - b.y);
}

static inline CGPoint rwMult(CGPoint a, float b) {
    return CGPointMake(a.x * b, a.y * b);
}

static inline float rwLength(CGPoint a) {
    return sqrtf(a.x * a.x + a.y * a.y);
}

// Makes a vector have a length of 1
static inline CGPoint rwNormalize(CGPoint a) {
    float length = rwLength(a);
    return CGPointMake(a.x / length, a.y / length);
}

#pragma add fly and action

-(void)addFly{
    SKSpriteNode * fly = [SKSpriteNode spriteNodeWithImageNamed:@"maybay"];
    fly.size = CGSizeMake(self.frame.size.width / 6, self.frame.size.height/7);
    int minY = fly.size.height / 2;
    int actualY = arc4random() % minY + 240;
    
    fly.position = CGPointMake(self.frame.size.width - fly.size.width / 2, actualY);
    [self addChild:fly];
    int minD = 7.0;
    int maxD = 9.0;
    
    int rangeD = maxD - minD;
    int actualD = arc4random() % rangeD + minD;
    SKAction * flyMove = [SKAction moveTo:CGPointMake(-fly.size.width/2, actualY) duration:actualD];
    SKAction * flyDone = [SKAction removeFromParent];
    
    [fly runAction:[SKAction sequence:@[flyMove,flyDone]]];
    
    fly.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:fly.size];
    fly.physicsBody.dynamic = YES;
    fly.physicsBody.categoryBitMask = monsterCategory;
    fly.physicsBody.contactTestBitMask = rocketCategory;
    fly.physicsBody.collisionBitMask = 0;
}

- (void)updateWithTimeSinceLastUpdate:(CFTimeInterval)timeSinceLast {
    
    self.lastSpawnTimeInterval += timeSinceLast;
    if (self.lastSpawnTimeInterval > 2) {
        self.lastSpawnTimeInterval = 0;
        [self addFly];
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    // position touch
    UITouch * touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    
    // set up rocket position
    
    SKSpriteNode * rocket = [SKSpriteNode spriteNodeWithImageNamed:@"tenlua"];
    rocket.position = self.player.position;
    rocket.size = CGSizeMake(rocket.size.width/2, rocket.size.height/2);
    [rocket setZRotation:6.0];
    CGPoint offset = rwSub(location, rocket.position);
    
    if (offset.x < 0) {
        return;
    }
    
    [self addChild:rocket];
    
    
    CGPoint dir = rwNormalize(offset);
    
    // ban xa hon ca vi tri cham
    CGPoint shoot = rwMult(dir, 1000);
    
    CGPoint rD = rwAdd(shoot, rocket.position);
    
    float vantoc = 100 / 1.0;
    float flyDuration = self.size.width / vantoc;

    // ten lua bay
    SKAction * rocketMove = [SKAction moveTo:rD duration:flyDuration];
    SKAction * rocketDie = [SKAction removeFromParent];
    [rocket runAction:[SKAction sequence:@[rocketMove,rocketDie]]];
    
    rocket.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:rocket.size];
    rocket.physicsBody.dynamic = YES;
    rocket.physicsBody.categoryBitMask = rocketCategory;
    rocket.physicsBody.contactTestBitMask = monsterCategory;
    rocket.physicsBody.collisionBitMask = 0;
    rocket.physicsBody.usesPreciseCollisionDetection = YES;
}

-(void)banTenlua:(SKSpriteNode *)rocket chamVao:(SKSpriteNode *)fly{
    NSLog(@"touch!");
    [rocket removeFromParent];
    [fly removeFromParent];
}

-(void)didBeginContact:(SKPhysicsContact *)contact{
    
    SKPhysicsBody * obj1,* obj2;
    
    if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask) {
        obj1 = contact.bodyA;
        obj2 = contact.bodyB;
    }
    else
    {
        obj1 = contact.bodyB;
        obj2 = contact.bodyA;
    }
    
    if ((obj1.categoryBitMask & rocketCategory) != 0 && (obj2.categoryBitMask & monsterCategory) != 0) {
        [self banTenlua:(SKSpriteNode *)obj1.node chamVao:(SKSpriteNode *)obj2.node];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    
    CFTimeInterval timeSinceLast = currentTime - self.lastUpdateTimeInterval;
    self.lastUpdateTimeInterval = currentTime;
    if (timeSinceLast > 1) { // more than a second since last update
        timeSinceLast = 1.0 / 60.0;
        self.lastUpdateTimeInterval = currentTime;
    }
    
    [self updateWithTimeSinceLastUpdate:timeSinceLast];

}

@end

//
//  Scene.h
//  DemoOOP
//
//  Created by techmaster on 10/4/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Scene : NSObject
@property (nonatomic, assign) int level;
@property (nonatomic, assign) float price;
@property (nonatomic, strong) NSMutableArray *animals; //Chứa các con vật
@property (nonatomic, strong) NSMutableArray *backgrounds; //Chứa các ảnh nền nối tiếp nhau

@property (nonatomic, strong) NSString * currentBackground; // Background cảnh hiện tại
@property (nonatomic, strong) NSString * currentPlayer; // Nhân vật chơi hiện tại
@property (nonatomic, strong) NSString * currentEnemy; // Kẻ địch hiện tại
-(id) initScene; // khởi tạo cảnh , các con vật , background
-(id) currentScene:(int) level; // trả về cảnh với level tương ứng
@end

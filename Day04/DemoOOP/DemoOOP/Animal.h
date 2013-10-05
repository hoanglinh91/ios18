//
//  Animal.h
//  DemoOOP
//
//  Created by techmaster on 10/4/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject
{
    //Khai báo instant variable
    @public  //có thể nhìn thấy ở khắp nơi
    NSString * _id; //Mã số phân biệt trong cơ sở dữ liệu
    NSMutableArray *_voices; //Khai báo mảng thay đổi được
    NSMutableArray *_postures; //Ảnh của từng động tác
    @protected
    BOOL _moveable;
}
//Cách khai báo property ~ thuộc tính. Ánh xạ vào biến thành phần có các property attribute để thay đổi tính chất của thuộc tính.

//Thuộc tính sẽ sinh ra getter và setter function trong khi đó biến thành phần rất đơn giản
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *origin;

- (id) initWithName: (NSString*) name;
- (id) initWithName:(NSString *)name andOrigin: (NSString*) origin;
@end

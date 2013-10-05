//
//  ViewController.m
//  DemoOOP
//
//  Created by techmaster on 10/4/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import "ViewController.h"
#import "Tiger.h"
#import "Cat.h"
#import "Gorilla.h"

@interface ViewController ()
{
    
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	//Khởi tạo GameManager ở đây, bổ xung các Scene. Khi khởi tạo Scene thì phải tạo danh sách các Animal
    // Khởi tạo GameManager
    GameManager * gameManager = [[GameManager alloc] initWithCoint:200];

    // Khởi tạo Scene
    Scene *scene = [[Scene alloc] initScene];
    
    // Đặt cảnh 1
    [scene setLevel:1];
    
    // in ra background nhân vật trong cảnh 1
    NSLog(@"%@ %@ %@\n",scene.currentBackground,scene.currentEnemy,scene.currentPlayer);
    
    // lượng coin lúc đầu
    NSLog(@"%d",gameManager.coinAmount);
    // mua coin
    [gameManager purchaseCoint:100];
    
    NSLog(@"%d",gameManager.coinAmount);
    
    // Đặt cảnh 2
    [scene setLevel:2];
    
    // in ra background nhân vật trong cảnh 1
    NSLog(@"%@ %@ %@\n",scene.currentBackground,scene.currentEnemy,scene.currentPlayer);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)demoInit:(id)sender {
    Tiger *siberian_Tiger = [[Tiger alloc] initWithName:@"Siberian Tiger"];
    siberian_Tiger.origin = @"Siberia, Russia";    //Sử dụng dot notation thực khi biên dịch sẽ chuyển thành getter function
    [siberian_Tiger setOrigin:@"Siberia, Russia"]; //Sử dụng hàm setter
    
    siberian_Tiger->_id = @"012445";  //Dùng mũi tên truy xuất biến public của đối tượng có kiểu khác
    [siberian_Tiger sound]; //Cho con hổ kêu
    //NSLog(@"Origin is %@", [siberian_Tiger origin]); //Sử dụng hàm getter
    Cat * meo = [[Cat alloc] initWithName:@"meo mun"];
    [meo sound];
    
    Gorilla * tinhTinh = [[Gorilla alloc] initWithName:@"linh truong"];
    [tinhTinh sound];
    
}

@end

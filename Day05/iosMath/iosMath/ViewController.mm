//
//  ViewController.m
//  iosMath
//
//  Created by MAC on 10/11/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    // C ViewController.m
    
    /*
    NSLog(@"%d",iAdd(3,5)); // Cộng
    NSLog(@"%d",iSub(10,7)); // Trừ
    NSLog(@"%d",iMul(5,3)); // Nhân
    NSLog(@"%d",iDiv(15,3)); // Chia
    NSLog(@"%d",iPow(2,3));  // Lũy thừa
    NSLog(@"%2.1f",iSqrt(15)); // Khai căn
    */
    
    // C++ ViewController.mm

    iMath *cpp = new iMath;
    cpp->setValue(5, 7); // Đặt giá trị
    NSLog(@"%d", cpp->add());
    NSLog(@"%d", cpp->sub());
    NSLog(@"%d", cpp->mul());
    NSLog(@"%d", cpp->div());
    NSLog(@"%d", cpp->pow());
    
    cpp->setValue(16); // overload
    
    NSLog(@"%2.1f", cpp->sqrt());
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

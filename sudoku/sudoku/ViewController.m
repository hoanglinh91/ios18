//
//  ViewController.m
//  sudoku
//
//  Created by MAC on 10/8/13.
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
    
    int x = 100,y = 50,space = 5, height = 20,width = 20;
    
    for (int i=0; i<9; i++) {
        for (int j=0; j<9; j++) {
            UIButton *myButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            [myButton setTitle:@"x" forState:UIControlStateNormal];
            [myButton setFrame:CGRectMake(y, x, width , height)];
            myButton.tag = i * 9 + j + 1;
            y += height;
            y += space;
            [self.view addSubview:myButton];
            [myButton addTarget:self action:@selector(myButtonIsPressed:) forControlEvents:UIControlEventTouchUpInside];
        }
        x += height;
        x += space;
        y = 50;
    }
}

-(void)myButtonIsPressed:(UIButton *) button{
    NSLog(@"%d",button.tag);
    [button setTitle:[[NSString alloc] initWithFormat:@"%d",button.tag]  forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

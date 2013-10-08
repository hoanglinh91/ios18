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
    
    int x = 100,y = 50,space = 5, height = 20,width = 20, buttonPerRow = 9;
    
    for (int i=0; i<9; i++) {
        for (int j=0; j<9; j++) {
            
            // creat a button
            UIButton *myButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            
            // init button
            [myButton setTitle:@"x" forState:UIControlStateNormal];
            [myButton setFrame:CGRectMake(y, x, width , height)];
            
            // add tag for button
            myButton.tag = i * buttonPerRow + j + 1;
            
            // new y
            y += height;
            y += space;
            // add button to view
            [self.view addSubview:myButton];
            // event for button
            [myButton addTarget:self action:@selector(myButtonIsPressed:) forControlEvents:UIControlEventTouchUpInside];
        }
        // new x
        x += height;
        x += space;
        // init y
        y = 50;
    }
}

-(void)myButtonIsPressed:(UIButton *) button{
    
    // test button pressed
    NSLog(@"%d",button.tag);
    
    [button setTitle:[[NSString alloc] initWithFormat:@"%d",button.tag]  forState:UIControlStateNormal];

    // test tag detect
    if (button.tag == 81) {
        for (UIButton * myButton in self.view.subviews) {
            if ([myButton isKindOfClass:[UIButton class]]) {
                NSLog(@"%@",myButton.titleLabel.text);
            }
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

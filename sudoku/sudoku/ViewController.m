//
//  ViewController.m
//  sudoku
//
//  Created by MAC on 10/8/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "ViewController.h"
#import "sudoku.h"

@interface ViewController ()
{
    @public
    int _id; // instant variable add button.tag to use
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self creatView];
}

-(void)creatView{
    
    // add button by coding
    
    // get data
    
    sudoku *tmp = [[sudoku alloc] init];
    NSArray * array = [[NSArray alloc] initWithArray:[tmp getData]];
    
    int x = 100,y = 50,space = 5, height = 20,width = 20, buttonPerRow = 9, index = 0;
    
    for (int i=0; i<9; i++) {
        for (int j=0; j<9; j++) {
            
            // creat a button
            UIButton *myButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            
            // init button
            [myButton setTitle:[NSString stringWithFormat:@"%@",[array objectAtIndex:index]] forState:UIControlStateNormal];
            
            [myButton setFrame:CGRectMake(y, x, width , height)];
            // add tag for button
            myButton.tag = i * buttonPerRow + j + 1;
            // if it has value - > disable
            
            if ([[array objectAtIndex:index] integerValue] != 0)
                myButton.enabled = NO;
            
            // new y
            y += height;
            y += space;
            // add button to view
            [self.view addSubview:myButton];
            // event for button
            [myButton addTarget:self action:@selector(myButtonIsPressed:) forControlEvents:UIControlEventTouchUpInside];
            index++;
        }
        // new x
        x += height;
        x += space;
        // init y
        y = 50;
    }
    
    x += 20;
    // add 9 button picker value
    for (int i=1; i<10; i++) {
        UIButton *myButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [myButton setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
        [myButton setFrame:CGRectMake(y, x, width, height)];
        myButton.enabled = NO;
        myButton.tag = 100 + i;
        y += height;
        y += space;
        [self.view addSubview:myButton];
        [myButton addTarget:self action:@selector(pickNumber:) forControlEvents:UIControlEventTouchUpInside];
    }
    _id = 0;
}

-(void)pickNumber:(UIButton *)button{
    
    // find button clicked & change value
    for (UIButton * mybutton in self.view.subviews) {
        if ([mybutton isKindOfClass:[UIButton class]] && mybutton.tag == _id) {
            [mybutton setTitle:[NSString stringWithString:button.titleLabel.text] forState:UIControlStateNormal];
            break;
        }
    }
    _id = 0;
    
    for (UIButton * mybutton in self.view.subviews) {
        if ([mybutton isKindOfClass:[UIButton class]] && mybutton.tag > 100) {
            mybutton.enabled = NO;
        }
    }
}

// check number already to use
-(void)checkNumber:(int) pos{
    int arr[10][10];
    BOOL mark[10];
    int row, col;
    
    // get value current array
    for (UIButton * button in self.view.subviews) {
        if ([button isKindOfClass:[UIButton class]] && button.tag < 100) {

            col = button.tag % 9;
            if (!col)
            {
                col = 9;
                row = button.tag / 9;
            }
            else
                row = button.tag / 9 + 1;
            arr[row][col] = [button.titleLabel.text intValue];
            //NSLog(@"%d %d",row,col);
        }
    }
    
    // get position when touch up inside button
    col = pos % 9;
    if (!col)
    {
        col = 9;
        row = pos / 9;
    }
    else
        row = pos / 9 + 1;
    
    // reset mark array
    for (int i=0; i < 10; i++)
        mark[i] = 0;
    
    // mark number horizal & vertical
    for (int i = 1; i < 10; i++) {
        mark[arr[row][i]] = 1;
        mark[arr[i][col]] = 1;
    }
    
    
    for (int i=1; i<9; i+=3)
        if (row >= i && row < i + 3) {
            for (int j=1; j<9; j+=3) {
                if (col >= j && col < j+3) {
                    for (int r=i; r<i+3; r++) {
                        for (int c=j; c<j+3; c++) {
                            mark[arr[r][c]] = 1;
                        }
                    }
                    for (UIButton *button in self.view.subviews) {
                        if ([button isKindOfClass:[UIButton class]] && button.tag > 100) {
                            if (!mark[button.tag-100]) {
                                button.enabled = YES;
                            }
                        }
                    }
                    return;
                }
            }
        }
}

-(void)myButtonIsPressed:(UIButton *) button{

    for (UIButton * mybutton in self.view.subviews) {
        if ([mybutton isKindOfClass:[UIButton class]] && mybutton.tag > 100) {
            mybutton.enabled = NO;
        }
    }
    
    _id = button.tag;
    [self checkNumber:button.tag];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

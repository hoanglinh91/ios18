//
//  ViewController.m
//  Day06
//
//  Created by MAC on 10/14/13.
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
    
    
    // zic zac#
    int n = 5 , space1 = 0 , space2 = n*2-3;
    
    for (int i=0; i<n; i++) {
        for (int j=0; j<n-i; j++) {
            printf(" ");
        }
        
        for (int j=0; j<n; j++) {
            printf(".");
            if (space1 && i < n-1) {
                for (int k=0; k<space1; k++) {
                    printf(" ");
                }
                printf(".");
            }
            else if (space1){
                for (int k=0; k<space1; k++) {
                    printf(" ");
                }
            }
                
            for (int k=0; k<space2; k++) {
                printf(" ");
            }
        }
        
        if (space1)
            space1 += 2;
        else
            space1 = 1;
        
        space2 -= 2;
        printf("\n");
    }
    printf("\n");
    
    // car
    printf("                  ______________                \n");
    printf("                 /             /\\              \n");
    printf("                /             /  \\             \n");
    printf("               .-------------     \\            \n");
    printf("   .----------.  ___    ___  .    .---------.   \n");
    printf("  .          .  |___|  |___|  .  .           .  \n");
    printf(" .__________.   |___|  |___|    ._____________. \n");
    printf(" /__________________________________________\\/ \n");
    printf(" \\======== ... =================== ... =====/  \n");
    printf("  \\-----  . . . ----------------- . . . ---/   \n");
    printf("           ...                     ...         \n");

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

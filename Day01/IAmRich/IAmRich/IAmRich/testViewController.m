//
//  testViewController.m
//  IAmRich
//
//  Created by MAC on 9/23/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "testViewController.h"

@interface testViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *diamond;
@property (weak, nonatomic) IBOutlet UILabel *IAmRich;
@property (strong , nonatomic) AVAudioPlayer *audioPlayer;

@end

@implementation testViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // declare variable !!!
    //NSString *path = [[NSBundle mainBundle]pathForResource:@"loaa" ofType:@"mp3"];
    //NSError *error;
    
    // way _1 :
    //self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
    //[self.audioPlayer play];
    
    // way _2 :
    //NSURL *url = [NSURL fileURLWithPath:path];
	//self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
	//self.audioPlayer.numberOfLoops = -1;
	
	//if (self.audioPlayer == nil)
	//	NSLog(@"%@",error);
	//else
	//	[self.audioPlayer play];
    
    self.diamond.alpha = 0;
    self.IAmRich.alpha = 0;
    //int i;
    
    [UIImageView animateWithDuration:4 animations:^{
        self.diamond.alpha = 1;
        self.IAmRich.alpha = 1;
    } completion:^(BOOL finished) {
        [UILabel animateWithDuration:3 animations:^{
            self.IAmRich.alpha = 0;
            self.diamond.alpha = 0;
            self.IAmRich.center = CGPointMake(self.IAmRich.center.x, 250);
        } completion:^(BOOL finished) {
            
            NSString *path = [[NSBundle mainBundle]pathForResource:@"loaa" ofType:@"mp3"];
            self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
            [self.audioPlayer play];
            
            self.IAmRich.center = CGPointMake(self.IAmRich.center.x, 370);
            
            self.IAmRich.alpha = 1;
            self.IAmRich.text = @"Thanks for playing !";
        }];
    }];
    
    
}

/*-(void) viewWillAppear:(BOOL)animated
{
    [UIView animateWithDuration:4 animations:^{
        self.diamond.alpha = 0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:3 animations:^{
            self.IAmRich.alpha = 0;
            self.IAmRich.center = CGPointMake(self.IAmRich.center.x, 250);
        } completion:^(BOOL finished) {
            
            NSString *path = [[NSBundle mainBundle]pathForResource:@"loaa" ofType:@"mp3"];
            self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
            [self.audioPlayer play];
            
            self.IAmRich.center = CGPointMake(self.IAmRich.center.x, 370);
            
            self.IAmRich.alpha = 1;
            self.IAmRich.text = @"Thanks for playing !";
        }];
    }];
}*/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

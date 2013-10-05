//
//  ViewController.m
//  giai_pt_bac2
//
//  Created by MAC on 9/28/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *_tit;
@property (strong, nonatomic) IBOutlet UILabel *_titlea;
@property (strong, nonatomic) IBOutlet UILabel *_titleb;
@property (strong, nonatomic) IBOutlet UILabel *_titlec;
@property (strong, nonatomic) IBOutlet UITextField *_a;
@property (strong, nonatomic) IBOutlet UITextField *_b;
@property (strong, nonatomic) IBOutlet UITextField *_c;
@property (strong, nonatomic) IBOutlet UILabel *_noti;
@property (strong, nonatomic) IBOutlet UILabel *_result;
@property (strong, nonatomic) IBOutlet UIButton *_pButton;
- (IBAction)_done:(id)sender;

- (IBAction)_cchange:(id)sender;
- (IBAction)_bchange:(id)sender;
- (IBAction)_achange:(id)sender;
- (IBAction)_process:(id)sender;
@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self._pButton.enabled = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)chkNum:(NSString*)string{
    
    // hàm kiểm tra text chỉ được phép nhập số !
    
    for (int i=0; i<[string length]; i++) {
        if (!([string characterAtIndex:i] >= '0' && [string characterAtIndex:i] <= '9')) {
            return NO;
        }
    }
    return YES;
}

-(BOOL)chkInput{
    
    // hàm check xem nhập đủ dữ liệu chưa !
        NSLog(@"a = %@ b = %@ c = %@",self._a.text,self._b.text,self._c.text);
    // nếu độ dài text = 0 => chưa nhập dữ liệu
    
    if (![self._a.text length] || ![self._b.text length] || ![self._c.text length]) {
        return NO;
    }
    return YES;
}

-(void)giaiPT{
    int _delta;
    _delta = [self._b.text intValue] * [self._b.text intValue] - 4 * [self._a.text intValue] * [self._c.text intValue];
    
    if (_delta < 0) {
        @throw [[NSException alloc] initWithName:@"Delta < 0" reason:@"Nghiệm Phức" userInfo:nil];
    }
    if (_delta == 0) {
        self._result.text = [[NSString alloc] initWithFormat:@"Phương trình có một nghiệm\nx1 = x2 = %0.2f",[self._b.text intValue] / [self._a.text intValue] * -0.5];
    }
    else{
        self._result.text = [[NSString alloc] initWithFormat:@"Phương trình có hai nghiệm\nx1 = %0.2f    x2 = %0.2f",([self._b.text intValue] * -1 + pow(_delta, 0.5)) / 2 * [self._a.text intValue],([self._b.text intValue] * -1 - pow(_delta, 0.5)) / 2 * [self._a.text intValue]];
    }
    self._a.text = nil;
    self._b.text = nil;
    self._c.text = nil;
    self._noti.text = nil;
}

- (IBAction)_process:(id)sender {
    
    @try {
        [self giaiPT];
    }
    @catch (NSException *exception) {
        self._result.text = [[NSString alloc] initWithFormat:@"%@\n%@",exception.name,exception.reason];
    }
    @finally {
        NSLog(@"Done !");
    }
    
    self._pButton.enabled = NO;
}

- (IBAction)_done:(id)sender {
    
    if ([self chkInput]) {
        self._pButton.enabled = YES;
        self._noti.text = @"Hoàn Thành Nhập Dữ Liệu !";
        return;
    }
    self._noti.text = @"Thiếu Dữ Liệu !";
}

- (IBAction)_bchange:(id)sender {
    if (![self chkNum:self._b.text]) {
        self._b.text = nil;
        self._pButton.enabled = NO;
        self._noti.text = @"Dữ liệu không hợp lệ !";
        NSLog(@"Invalid data !");
        return;
    }
    self._noti.text = @"Dữ liệu hợp lệ !";
}

- (IBAction)_achange:(id)sender {
    if (![self chkNum:self._a.text]) {
        self._a.text = nil;
        self._pButton.enabled = NO;
        self._noti.text = @"Dữ liệu không hợp lệ !";
        NSLog(@"Invalid data !");
        return;
    }
    self._noti.text = @"Dữ liệu hợp lệ !";
}

- (IBAction)_cchange:(id)sender {
    if (![self chkNum:self._c.text]) {
        self._c.text = nil;
        self._pButton.enabled = NO;
        self._noti.text = @"Dữ liệu không hợp lệ !";
        NSLog(@"Invalid data !");
        return;
    }
    self._noti.text = @"Dữ liệu hợp lệ !";
}
@end

//
//  JSS_CreateQRCodeViewController.m
//  Demo-QRcode
//
//  Created by Daniel on 16/6/17.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "JSS_CreateQRCodeViewController.h"
#import "CreateQRCode.h"

@interface JSS_CreateQRCodeViewController ()

@property (weak, nonatomic) IBOutlet UITextField *inputInfoTextField;
@property (weak, nonatomic) IBOutlet UIImageView *QRCodeImageView;
@end

@implementation JSS_CreateQRCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationItem.title = @"生成二维码";
    
    self.QRCodeImageView.layer.borderColor = [UIColor grayColor].CGColor;
    self.QRCodeImageView.layer.borderWidth = 1.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)startCreating:(UIButton *)sender {
    [self.inputInfoTextField resignFirstResponder];
    self.QRCodeImageView.image = [CreateQRCode createQRCodeWithString:self.inputInfoTextField.text ViewCibtroller:self];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end

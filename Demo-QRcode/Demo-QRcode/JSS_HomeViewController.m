//
//  JSS_HomeViewController.m
//  Demo-QRcode
//
//  Created by Daniel on 16/6/17.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "JSS_HomeViewController.h"
#import "ScanQRCodeViewController.h"

@interface JSS_HomeViewController ()

@property (weak, nonatomic) IBOutlet UILabel *QRCodeInfoLabel;

@end

@implementation JSS_HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    ScanQRCodeViewController *scanVC = [[ScanQRCodeViewController alloc]init];
    scanVC.showQRCodeInfo = YES;
    [scanVC successfulGetQRCodeInfo:^(NSString *QRCodeInfo) {
        self.QRCodeInfoLabel.text = QRCodeInfo;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

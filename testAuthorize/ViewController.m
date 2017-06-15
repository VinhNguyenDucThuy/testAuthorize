//
//  ViewController.m
//  testAuthorize
//
//  Created by Vịnh Nguyễn Đức Thuỷ on 6/15/17.
//  Copyright © 2017 TruePlus. All rights reserved.
//

#import "ViewController.h"
//#import <AcceptSDK/AcceptSDK-Swift.h>
@import AcceptSDK;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    AcceptSDKHandler *handler = [[AcceptSDKHandler alloc] initWithEnvironment:AcceptSDKEnvironmentENV_TEST];
    AcceptSDKRequest *request = [[AcceptSDKRequest alloc] init];
    request.merchantAuthentication.name = @"6AB64hcB"; //name
    request.merchantAuthentication.clientKey = @"6gSuV295YD86Mq4d86zEsx8C839uMVVjfXm9N4wr6DRuhTHpDU97NFyKtfZncUq8"; //clientkey
    
    request.securePaymentContainerRequest.webCheckOutDataType.token.cardNumber = @"4111111111111111"; //cardnumber
    request.securePaymentContainerRequest.webCheckOutDataType.token.expirationMonth = @"11";
    request.securePaymentContainerRequest.webCheckOutDataType.token.expirationYear = @"2017";
    request.securePaymentContainerRequest.webCheckOutDataType.token.cardCode = @"256";
    
    
    @try {
        [handler getTokenWithRequest:request successHandler:^(AcceptSDKTokenResponse * _Nonnull token) {
            NSLog(@"success %@", token.getOpaqueData.getDataValue);
        } failureHandler:^(AcceptSDKErrorResponse * _Nonnull error) {
            NSLog(@"failed... ");
        }];
    } @catch (NSException *exception) {
        
    } @finally {
        
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

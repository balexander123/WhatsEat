//
//  FBViewController.m
//  WhatsEat
//
//  Created by Barry Alexander on 5/24/15.
//  Copyright (c) 2015 Barry Alexander. All rights reserved.
//

#import "FBViewController.h"

@interface FBViewController ()

@end

@implementation FBViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    if ([FBSDKAccessToken currentAccessToken] != nil) {
        [self performSegueWithIdentifier:@"WeeklyMenuSegue" sender:self];
    } else {
        FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
        loginButton.center = self.view.center;
        loginButton.delegate = self;
        [self.view addSubview:loginButton];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error {
    if (error) {
        // Process error
    }
    else if (result.isCancelled) {
        // Handle cancellations
    }
    else {
        [self performSegueWithIdentifier:@"WeeklyMenuSegue" sender:self];
    }
}

- (void) loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {

}



@end

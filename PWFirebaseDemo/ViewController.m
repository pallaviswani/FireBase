//
//  ViewController.m
//  PWFirebaseDemo
//
//  Created by Felix ITs 04 on 06/03/17.
//  Copyright © 2017 Pallavi Wani. All rights reserved.
//

#import "ViewController.h"
@import GoogleSignIn;
@import FirebaseAuth;

@interface ViewController ()<GIDSignInDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [GIDSignIn sharedInstance].uiDelegate = self;
    [[GIDSignIn sharedInstance] signInSilently];
    
    [[FIRAuth auth] addAuthStateDidChangeListener:^(FIRAuth *_Nonnull auth, FIRUser *_Nullable user)
     {
         
         if (user) {
             NSLog(@"%@",user.displayName);
             NSLog(@"%@",user.photoURL);
             NSLog(@"%@",user.providerID);
             NSLog(@"%@",user.uid);
             NSLog(@"%@",user.refreshToken);
             NSLog(@"%@",user.email);
             
         }
         
         
     }];

    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)SignOut:(id)sender {
    FIRAuth *firebaseAuth = [FIRAuth auth];
    NSError *signOutError;
    BOOL status = [firebaseAuth signOut:&signOutError];
    if (!status) {
        NSLog(@"Error signing out: %@", signOutError);
        return;
    }

}
@end

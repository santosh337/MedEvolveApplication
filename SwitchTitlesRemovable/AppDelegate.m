//
//  DMAppDelegate.m
//  DMPasscode
//
//  Created by CocoaPods on 09/20/2014.
//  Copyright (c) 2014 Dylan Marriott. All rights reserved.
//

#import "AppDelegate.h"
//#import <DMPasscode/DMPasscode.h>
#import "DMPasscode.h"

@implementation AppDelegate {
    UIViewController* _rootViewController;
    UIButton* _setupButton;
    UIButton* _checkButton;
    UIButton* _removeButton;
    BOOL _showingPasscode;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    return YES;
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    //_showingPasscode = NO;
    
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
//    if ([DMPasscode isPasscodeSet] && !_showingPasscode) {
//        _showingPasscode = YES;
//        [DMPasscode showPasscodeInViewController:self.window.rootViewController completion:^(BOOL success, NSError *error) {
//            if (success) {
//                NSLog(@"Win");
//            }else{
//                
//                NSLog(@"Loss");
//            }
//        }];
//    }
}

@end

//
//  ParseLogin.m
//  igram
//
//  Created by xcode on 12/17/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

// Crappy Directions
// MUST #import <ParseUI/ParseUI.h>
// which is in the ParseUI.Framework (can just drag framework into the proj and will be automatically added)
// also import Social, AdSupport, Accounts (not listed explicitly in directions)

#import "ParseLoginManager.h"
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>
#import <QuartzCore/QuartzCore.h>


@interface ParseLoginManager() <PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>

  @property UIViewController *vc;

@end


@implementation ParseLoginManager

#pragma mark Setup Parse

+(void)setupParseInAppDelegateWithAppID:(NSString *)appId clientKey:(NSString *)key forApplication:(UIApplication *)application{

    [Parse setApplicationId:appId clientKey:key];

    // Register for Push Notitications
    UIUserNotificationType userNotificationTypes = (UIUserNotificationTypeAlert |
                                                    UIUserNotificationTypeBadge |
                                                    UIUserNotificationTypeSound);
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:userNotificationTypes
                                                                             categories:nil];
    [application registerUserNotificationSettings:settings];
    [application registerForRemoteNotifications];

}


#pragma mark Login To Parse

- (void)presentLoginScreenFromRootVCsViewDidAppear:(UIViewController *)vc
{

    self.vc = vc;

    if (![PFUser currentUser]) // No user logged in
    {
        // Create the log in view controller
        PFLogInViewController *logInViewController = [[PFLogInViewController alloc]init];
        [logInViewController setDelegate:self]; // Set ourselves as the delegate

        // Create the sign up view controller
        PFSignUpViewController *signUpViewController = [[PFSignUpViewController alloc]init];
        [signUpViewController setDelegate:self]; // Set ourselves as the delegate

        // Assign our sign up controller to be displayed from the login controller
        [logInViewController setSignUpController:signUpViewController];

        //Present the log in view controller
        [vc presentViewController:logInViewController animated:YES completion:NULL];

    }
}

// CHECK FIELDS AND LOG IN
- (BOOL)logInViewController:(PFLogInViewController *)logInController shouldBeginLogInWithUsername:(NSString *)username password:(NSString *)password {

    if (username && password && username.length != 0 && password.length != 0) {
        return YES;
    }

    [[[UIAlertView alloc] initWithTitle:@"Missing Information"
                                message:@"Make sure you fill out all of the information!"
                               delegate:nil
                      cancelButtonTitle:@"ok"
                      otherButtonTitles:nil] show];
    return NO;
}


// Did LogIn or SignUp
- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user
{
    [self.vc dismissViewControllerAnimated:YES completion:NULL];
}

- (void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user
{
    [self.vc dismissViewControllerAnimated:YES completion:NULL];
}


// LogIn Failed / Canceled
- (void)logInViewController:(PFLogInViewController *)logInController didFailToLogInWithError:(NSError *)error {
    NSLog(@"Failed to log in...");
}

- (void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController {
    [self.vc.navigationController popViewControllerAnimated:YES];
}


#pragma mark SIGN UP

// Sent to the delegate to determine whether the sign up request should be submitted to the server.
- (BOOL)signUpViewController:(PFSignUpViewController *)signUpController shouldBeginSignUp:(NSDictionary *)info {

    BOOL informationComplete = YES;

    // loop through all of the submitted data
    for (id key in info) {
        NSString *field = [info objectForKey:key];
        if (!field || field.length == 0) { // check completion
            informationComplete = NO;
            break;
        }
    }

    // Display an alert if a field wasn't completed
    if (!informationComplete) {
        [[[UIAlertView alloc] initWithTitle:@"Missing Information"
                                    message:@"Make sure you fill out all of the information!"
                                   delegate:nil
                          cancelButtonTitle:@"ok"
                          otherButtonTitles:nil] show];
    }

    return informationComplete;
}


- (void)signUpViewController:(PFSignUpViewController *)signUpController didFailToSignUpWithError:(NSError *)error {
    NSLog(@"Failed to sign up...");
}

- (void)signUpViewControllerDidCancelSignUp:(PFSignUpViewController *)signUpController {
    NSLog(@"User dismissed the signUpViewController");
}

@end

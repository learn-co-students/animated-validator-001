//
//  ValidatorViewController.h
//  AnimatedValidator
//
//  Created by Al Tyus on 5/12/14.
//  Copyright (c) 2014 al-tyus.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ValidatorViewController : UIViewController

-(BOOL)isValidEmail:(NSString *)text;
-(BOOL)isConfirmedEmail:(NSString *)text;
-(BOOL)isValidPassword:(NSString *)password;
-(BOOL)isPhoneNumberValid:(NSString *)phoneNumber;
-(BOOL)isConfirmedPassword:(NSString *)text;
-(BOOL)allFieldsValid;
-(void)changeMade:(UITextField *)textField;

@end

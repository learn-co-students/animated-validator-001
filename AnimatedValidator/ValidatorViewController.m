//
//  ValidatorViewController.m
//  AnimatedValidator
//
//  Created by Al Tyus on 5/12/14.
//  Copyright (c) 2014 al-tyus.com. All rights reserved.
//

#import "ValidatorViewController.h"
#import "Constants.h"

@interface ValidatorViewController ()<UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *emailTextField;
@property (nonatomic, weak) IBOutlet UITextField *emailConfirmTextField;
@property (nonatomic, weak) IBOutlet UITextField *phoneTextField;
@property (nonatomic, weak) IBOutlet UITextField *passwordTextField;
@property (nonatomic, weak) IBOutlet UITextField *passwordConfirmTextField;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;

@end

@implementation ValidatorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.submitButton.accessibilityLabel = SUBMITBUTTON;
    self.emailTextField.accessibilityLabel = EMAILTEXTFIELD;
    self.emailConfirmTextField.accessibilityLabel = EMAILCONFIRMTEXTFIELD;
    self.phoneTextField.accessibilityLabel = PHONETEXTFIELD;
    self.passwordTextField.accessibilityLabel = PASSWORDTEXTFIELD;
    self.passwordConfirmTextField.accessibilityLabel = PASSWORDCONFIRMTEXTFIELD;
    
    for (UITextField *textField in self.view.subviews)
    {
        if ([textField isKindOfClass:[UITextField class]])
        {
            textField.delegate = self;
            [textField addTarget:self action:@selector(textChanged:) forControlEvents:UIControlEventEditingChanged];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textChanged:(UITextField *)textField
{
    NSLog(@"Text Changed");
    if ([self allFieldsValid])
    {
        self.submitButton.userInteractionEnabled = YES;
    }
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    BOOL valid = YES;
    
    if ([textField.text length] == 0)
    {
        return valid; 
    }
    
    if ([textField isEqual:self.emailTextField] || [textField isEqual:self.emailConfirmTextField])
    {
        valid = [self validateEmail:textField.text];
        if (!valid)
        {
            [self alertWithInvalidField:@"Email"];
        }
    }
    else if ([textField isEqual:self.phoneTextField])
    {
        valid = [self validatePhone:textField.text];
        if (!valid)
        {
            [self alertWithInvalidField:@"Phone"];
        }
    }
    else if ([textField isEqual:self.passwordTextField] || [textField isEqual:self.passwordConfirmTextField])
    {
        valid = [self validatePassword:textField.text];
        if (!valid)
        {
            [self alertWithInvalidField:@"Password"];
        }
    }
    
    return valid;
}

//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    NSLog(@"Should change");
//
//    if ([self allFieldsValid])
//    {
//        self.submitButton.userInteractionEnabled = YES;
//    }
//    return YES;
//}

- (BOOL)allFieldsValid
{
    if ([self validateEmail:self.emailTextField.text] && [self validatePassword:self.passwordTextField.text] && [self validatePassword:self.passwordConfirmTextField.text] && [self validatePhone:self.phoneTextField.text])
    {
        return YES;
    }
    return NO;
}

- (void)alertWithInvalidField:(NSString *)field
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"Please Enter a valid %@", field] message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    alertView.accessibilityLabel = alertView.title;
    
    [alertView show];
}

- (BOOL)validateEmail:(NSString *)email
{
    if ([email length] < 3){ return NO;}
    if ([email rangeOfString:@"@"].location == NSNotFound){return NO;}
    
    NSString *regExPattern = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSRegularExpression *regEx = [[NSRegularExpression alloc] initWithPattern:regExPattern options:NSRegularExpressionCaseInsensitive error:nil];
    NSUInteger regExMatches = [regEx numberOfMatchesInString:email options:0 range:NSMakeRange(0, [email length])];
    
    if (regExMatches == 0)
    {
        return NO;
    }
    
    return YES;
}

- (BOOL)validatePhone:(NSString *)phone
{
    NSString *phoneRegex = @"^((\\+)|(00))[0-9]{6,14}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:phone];
}

- (BOOL)validatePassword:(NSString *)password
{
    NSCharacterSet *upperCaseChars = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLKMNOPQRSTUVWXYZ"];
    NSCharacterSet *lowerCaseChars = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyz"];
    
    if ( [password length]<6 || [password length]>20 )
        return NO;  // too long or too short
    NSRange rang;
    rang = [password rangeOfCharacterFromSet:[NSCharacterSet letterCharacterSet]];
    if ( !rang.length )
        return NO;  // no letter
    rang = [password rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]];
    if ( !rang.length )
        return NO;  // no number;
    rang = [password rangeOfCharacterFromSet:upperCaseChars];
    if ( !rang.length )
        return NO;  // no uppercase letter;
    rang = [password rangeOfCharacterFromSet:lowerCaseChars];
    if ( !rang.length )
        return NO;  // no lowerCase Chars;
    return YES;
}

- (IBAction)submitButtonPressed:(id)sender
{
    
}

@end

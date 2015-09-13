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
- (IBAction)submitPressed:(id)sender;




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
    self.view.accessibilityLabel = @"email";
    
    for (UITextField *textField in self.view.subviews)
    {
        if ([textField isKindOfClass:[UITextField class]])
        {
            textField.delegate = self;
            [textField addTarget:self action:@selector(changeMade:) forControlEvents:UIControlEventEditingChanged];
          
        }
    }


}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
   
    
    if ([textField isEqual:self.emailTextField]) {
        
    
        if(![self isValidEmail:textField.text]){
            
            textField.textColor = [UIColor redColor];
            return NO;
        }}
    
    if([textField isEqual:self.emailConfirmTextField]){
        
        if(![self isConfirmedEmail:self.emailConfirmTextField.text]){
            textField.textColor = [UIColor redColor];
            
            return NO;
        }}
    
    if([textField isEqual:self.passwordTextField]){
        
        if(![self isValidPassword:textField.text]){
            textField.textColor = [UIColor redColor];
            return NO;
        }
    }
    
    if([textField isEqual:self.passwordConfirmTextField]){
        if (![self isConfirmedPassword:self.passwordConfirmTextField.text]) {
            textField.textColor = [UIColor redColor];
            return NO;
        }
        
    }
     
    if ([textField isEqual:self.phoneTextField]) {
        if (![self isPhoneNumberValid:textField.text]) {
            textField.textColor = [UIColor redColor];
            return NO;
        }
    }
    textField.textColor = [UIColor blackColor];
 
        return YES;
    
  
}


-(BOOL)isValidEmail:(NSString *)text{
    
    if ([text containsString:@".com"] && [text containsString:@"@"]
        && [text length]>4) {
        return YES;
    }else{
        return NO;
    }
}

-(BOOL)isConfirmedEmail:(NSString *)text{
    
    if ([text isEqualToString:self.emailTextField.text]) {
        return YES;
    }else{
        return NO;
    }
}

- (void)alertWithInvalidField:(NSString *)field
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"Please Enter a valid %@", field] message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    alertView.accessibilityLabel = alertView.title;
    
    [alertView show];
}

-(BOOL)isValidPassword:(NSString *)password{
    
    
    if([password length]<6){
        return NO;
    }
    
    return YES;
}

-(BOOL)isConfirmedPassword:(NSString *)text{
    
    if ([text isEqualToString:self.passwordTextField.text]) {
        return YES;
    }
    return NO;
    
}

-(BOOL)isPhoneNumberValid:(NSString *)phoneNumber{
    
    NSCharacterSet *digits = [NSCharacterSet characterSetWithCharactersInString:@"1234567890+"];
    
    digits = [digits invertedSet];
    NSRange range = [phoneNumber rangeOfCharacterFromSet:digits];
    
    if(range.location != NSNotFound){
        return NO;
    }
    
    if([phoneNumber length]<7){
        return NO;
    }
    
    return YES;
}

-(BOOL)allFieldsValid{
    
    if ([self isValidEmail:self.emailTextField.text] && [self isConfirmedEmail:self.emailConfirmTextField.text] && [self isValidPassword:self.passwordTextField.text] && [self isConfirmedPassword:self.passwordConfirmTextField.text] && [self isPhoneNumberValid:self.phoneTextField.text]) {
        
        return YES;
        
    }
    return NO;
}

-(void)changeMade:(UITextField *)textField{
    NSLog(@"Change Made!");
    if([self allFieldsValid]){
        self.submitButton.userInteractionEnabled = YES;
        self.submitButton.hidden = NO;
    }else{
        self.submitButton.userInteractionEnabled = NO;
        self.submitButton.hidden = YES;
    }
    
}

-(void)submitPressed:(id)sender{
    NSLog(@"Pressed the submit button!");
}

@end

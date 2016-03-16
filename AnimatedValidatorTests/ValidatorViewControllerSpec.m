//
//  ValidatorViewControllerSpec.m
//  AnimatedValidator
//
//  Created by Al Tyus on 5/12/14.
//  Copyright (c) 2014 al-tyus.com. All rights reserved.
//

#import "Specta.h"
#define EXP_SHORTHAND
#import "Expecta.h"
#import "KIF.h"
#define MOCKITO_SHORTHAND
#import <OCMockito/OCMockito.h>
#import "Constants.h"


SpecBegin(ValidatorViewController)


describe(@"ValidatorViewController", ^{
    
    beforeAll(^{
        //[tester tapViewWithAccessibilityLabel:@"email"];
    });
    
    beforeEach(^{
        
    });
    
    
    it(@"Should allow user to move from field to field given valid text and to press the submit button", ^{
        
        UIButton *submitButton = (UIButton *)[tester waitForViewWithAccessibilityLabel:SUBMITBUTTON];
        
        [tester waitForTappableViewWithAccessibilityLabel:EMAILTEXTFIELD];
        
        [tester tapViewWithAccessibilityLabel:EMAILTEXTFIELD];
        [tester enterText:@"al@flatironschool.com" intoViewWithAccessibilityLabel:EMAILTEXTFIELD];
        
        expect(submitButton.enabled).to.beFalsy();
        
        [tester tapViewWithAccessibilityLabel:EMAILCONFIRMTEXTFIELD];
        [tester enterText:@"al@flatironschool.com" intoViewWithAccessibilityLabel:EMAILCONFIRMTEXTFIELD];
        
        expect(submitButton.enabled).to.beFalsy();
        
        [tester tapViewWithAccessibilityLabel:PHONETEXTFIELD];
        [tester enterText:@"6466440584" intoViewWithAccessibilityLabel:PHONETEXTFIELD];
        
        expect(submitButton.enabled).to.beFalsy();
        
        [tester tapViewWithAccessibilityLabel:PASSWORDTEXTFIELD];
        [tester enterText:@"myPassword1" intoViewWithAccessibilityLabel:PASSWORDTEXTFIELD];
        
        expect(submitButton.enabled).to.beFalsy();
        
        [tester tapViewWithAccessibilityLabel:PASSWORDCONFIRMTEXTFIELD];
        [tester enterText:@"myPassword1\n" intoViewWithAccessibilityLabel:PASSWORDCONFIRMTEXTFIELD];
        
        [tester tapViewWithAccessibilityLabel:EMAILTEXTFIELD];

        expect(submitButton.enabled).to.beTruthy();
        
    });
    
    it (@"Should present an alert view when attempting to change text fields if the user enters an invalid value", ^{
        
        [tester waitForTappableViewWithAccessibilityLabel:EMAILTEXTFIELD];
        [tester enterText:@"myemailaddress" intoViewWithAccessibilityLabel:EMAILTEXTFIELD];
//        [tester tapViewWithAccessibilityLabel:EMAILCONFIRMTEXTFIELD];
//        UIAlertView *alertView = (UIAlertView *)[tester waitForViewWithAccessibilityLabel:@"Please Enter a valid Email"];
        
        
//        expect(alertView.title).to.equal(@"Please Enter a valid Email");
        
    });
    
    
    
    afterAll(^{
        
    });
    
    afterEach(^{
        
        [tester clearTextFromViewWithAccessibilityLabel:EMAILTEXTFIELD];
        [tester clearTextFromViewWithAccessibilityLabel:EMAILCONFIRMTEXTFIELD];
        [tester clearTextFromViewWithAccessibilityLabel:PASSWORDTEXTFIELD];
        [tester clearTextFromViewWithAccessibilityLabel:PASSWORDCONFIRMTEXTFIELD];
        [tester clearTextFromViewWithAccessibilityLabel:PHONETEXTFIELD];
        
    });
});

SpecEnd

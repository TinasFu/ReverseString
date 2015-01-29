//
//  ViewController.m
//  ReverseString
//
//  Created by Shiquan Fu on 1/28/15.
//  Copyright (c) 2015 Tina Fu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (retain, nonatomic) IBOutlet UILabel *textLabel;

-(NSString *)reverseStr:(NSString*)str;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textField.delegate = self;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
}

-(void)dismissKeyboard {
    [self.view endEditing:YES];
}



-(void)textFieldDidEndEditing:(UITextField *)textField{
    self.textLabel.text = self.textField.text;
    NSLog(@"%@", self.textField.text);
}


- (IBAction)reverseStringPressed:(id)sender {

    [self.view endEditing:YES];
    NSString *errorMessage = nil;
    if (self.textField.text.length == 0) {
        errorMessage = @"You must provide a string to reverse.";
        self.textLabel.text = errorMessage;
    }
    
    else {
        NSString *inputString = self.textField.text;
        
        self.textLabel.text = [self reverseStr:inputString];
    }
    
}

-(NSString *)reverseStr:(NSString*)str {
    int length = [str length];
    NSMutableString *reversedString;
    
    reversedString = [[NSMutableString alloc] initWithCapacity: length];
    
    while (length > 0) {
        [reversedString appendString:[NSString stringWithFormat:@"%C", [str characterAtIndex:--length]]];
    }
    
    return reversedString;
}



@end

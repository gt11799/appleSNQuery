//
//  ViewController.m
//  appleSNQuery
//
//  Created by bruce on 15/4/11.
//  Copyright (c) 2015年 bruce. All rights reserved.
//

#import "ViewController.h"
#import "QuerySnViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *SNInput;

@end

@implementation ViewController

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"querySN"]) {
        if ([segue.destinationViewController isKindOfClass:[QuerySnViewController class]]) {
            QuerySnViewController *tsvc = (QuerySnViewController *)segue.destinationViewController;
            tsvc.SNToQuery = self.SNInput.text;
        }
    }
}
- (IBAction)hideKeyboard:(id)sender {
    [self.SNInput resignFirstResponder];
}

-(void)alertWithView
{
    UIAlertView *alertDialog;
    alertDialog = [[UIAlertView alloc]
                   initWithTitle:@"Alert Button Selected"
                   message:@"I need your attention NOW"
                   delegate:nil
                   cancelButtonTitle:@"OK"
                   otherButtonTitles:@"Maybe Later", @"Never", nil];
    [alertDialog show];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

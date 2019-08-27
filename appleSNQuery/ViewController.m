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
@property (weak, nonatomic) IBOutlet UIButton *queryButton;

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

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if ([self.SNInput.text length] <= 0){
        [self alertWithView];
        return false;
    }
    return true;
}

- (IBAction)hideKeyboard:(id)sender {
    [self.SNInput resignFirstResponder];
}

-(void)alertWithView
{
    UIAlertView *alertDialog;
    alertDialog = [[UIAlertView alloc]
                   initWithTitle:@"请输入要查询的车牌号"
                   message:@""
                   delegate:nil
                   cancelButtonTitle:@"好"
                   otherButtonTitles:nil];
    [alertDialog show];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"car_paper_1.jpg"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.view setBackgroundColor:[UIColor colorWithPatternImage: image]];
    [self.queryButton setFrame:CGRectMake(173, 269, 1130, 144)];
//    self.queryButton.frame.size = CGSizeMake(width, height);
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  QuerySnViewController.m
//  appleSNQuery
//
//  Created by bruce on 15/4/11.
//  Copyright (c) 2015年 bruce. All rights reserved.
//

#import "QuerySnViewController.h"
#import "JHAPISDK.h"
#import "JHOpenidSupplier.h"

@interface QuerySnViewController ()
@property (weak, nonatomic) IBOutlet UITextView *resultDisplay;

@end

@implementation QuerySnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[JHOpenidSupplier shareSupplier] registerJuheAPIByOpenId:@"JHd1f3381f2bd72fe420b35f7142ce2237"];
    self.resultDisplay.text = self.SNToQuery;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

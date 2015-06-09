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
@property (weak, nonatomic) IBOutlet UILabel *serialNo;
@property (weak, nonatomic) IBOutlet UILabel *equipModel;
@property (weak, nonatomic) IBOutlet UILabel *activeDate;
@property (weak, nonatomic) IBOutlet UILabel *activeState;
@property (weak, nonatomic) IBOutlet UILabel *imei;
@property (weak, nonatomic) IBOutlet UILabel *warrantyState;
@property (weak, nonatomic) IBOutlet UILabel *madeArea;

@end

@implementation QuerySnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[JHOpenidSupplier shareSupplier] registerJuheAPIByOpenId:@"JHd1f3381f2bd72fe420b35f7142ce2237"];
    [self querySN];
}


- (void)querySN
{
    NSString *path = @"http://apis.juhe.cn/appleinfo/index";
    NSString *api_id = @"37";
    NSString *method = @"GET";
    NSDictionary *param = @{@"sn":self.SNToQuery, @"dtype":@"json"};
    JHAPISDK *juheapi = [JHAPISDK shareJHAPISDK];
    
    [juheapi executeWorkWithAPI:path
                          APIID:api_id
                     Parameters:param
                         Method:method
                        Success:^(id responseObject){
                            if ([[param objectForKey:@"dtype"] isEqualToString:@"json"]) {
                                NSLog(@"***xml*** \n %@", responseObject);
                                NSString *errorCode = [[responseObject objectForKey: @"error_code"] stringValue];
                                NSLog(@"error code: %@", errorCode);
                                if ([errorCode isEqualToString:@"0"]) {
                                    NSDictionary *result = [responseObject objectForKey:@"result"];
                                    NSLog(@"%@", result[@"active"]);
                                    [self updateViewController:result];
                                } else {
                                    NSLog(@"1111111");
                                    [self alertWithView];
                                }
                            }else{
                                NSLog(@"111111");
                                int error_code = [[responseObject objectForKey:@"error_code"] intValue];
                                if (!error_code) {
                                    NSLog(@" %@", responseObject);
                                }else{
                                    NSLog(@" %@", responseObject);
                                }
                            }
                        } Failure:^(NSError *error) {
                            //NSLog(@"error:   %@",error.description);
                            [self alertWithView];
                        }];
}

-(void)updateViewController: (NSDictionary *)result
{
    self.serialNo.text = result[@"serial_number"];
    self.equipModel.text = result[@"phone_model"];
    self.activeDate.text = result[@"start_date"];
    self.activeState.text = result[@"active"];
    self.imei.text = result[@"imei_number"];
    self.warrantyState.text = result[@"warranty_status"];
    self.madeArea.text = result[@"made_area"];
}

-(void)alertWithView
{
    UIAlertView *alertDialog;
    alertDialog = [[UIAlertView alloc]
                   initWithTitle:@"查询失败"
                   message:@"请检查你的输入"
                   delegate:nil
                   cancelButtonTitle:@"OK"
                   otherButtonTitles:@"Maybe Later", @"Never", nil];
    [alertDialog show];
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

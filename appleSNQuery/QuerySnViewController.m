//
//  QuerySnViewController.m
//  appleSNQuery
//
//  Created by bruce on 15/4/11.
//  Copyright (c) 2015年 bruce. All rights reserved.
//

#import "QuerySnViewController.h"

@interface QuerySnViewController ()
@property (weak, nonatomic) IBOutlet UILabel *license;
@property (weak, nonatomic) IBOutlet UILabel *province;
@property (weak, nonatomic) IBOutlet UILabel *city;

@end

@implementation QuerySnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed: @"car_paper_1.jpg"]]];
    [self queryLicense];
}


//- (void)queryLicense
//{
//    NSString *path = @"http://apis.juhe.cn/appleinfo/index";
//    NSString *api_id = @"37";
//    NSString *method = @"GET";
//    NSDictionary *param = @{@"sn":self.SNToQuery, @"dtype":@"json"};
//    JHAPISDK *juheapi = [JHAPISDK shareJHAPISDK];
//
//    [juheapi executeWorkWithAPI:path
//                          APIID:api_id
//                     Parameters:param
//                         Method:method
//                        Success:^(id responseObject){
//                            if ([[param objectForKey:@"dtype"] isEqualToString:@"json"]) {
//                                NSLog(@"***xml*** \n %@", responseObject);
//                                NSString *errorCode = [[responseObject objectForKey: @"error_code"] stringValue];
//                                NSLog(@"error code: %@", errorCode);
//                                if ([errorCode isEqualToString:@"0"]) {
//                                    NSDictionary *result = [responseObject objectForKey:@"result"];
//                                    NSLog(@"%@", result[@"active"]);
//                                    [self updateViewController:result];
//                                } else {
//                                    NSLog(@"1111111");
//                                    [self alertWithView];
//                                }
//                            }else{
//                                NSLog(@"111111");
//                                int error_code = [[responseObject objectForKey:@"error_code"] intValue];
//                                if (!error_code) {
//                                    NSLog(@" %@", responseObject);
//                                }else{
//                                    NSLog(@" %@", responseObject);
//                                }
//                            }
//                        } Failure:^(NSError *error) {
//                            //NSLog(@"error:   %@",error.description);
//                            [self alertWithView];
//                        }];
//}

- (void)queryLicense
{
    NSDictionary *licenseData = @{
                                  @"京A": @{@"province": @"北京市", @"city": @"北京市"},@"京B": @{@"province": @"北京市", @"city": @"北京市"},@"京C": @{@"province": @"北京市", @"city": @"北京市"},@"京D": @{@"province": @"北京市", @"city": @"北京市"},@"京E": @{@"province": @"北京市", @"city": @"北京市"},@"京J": @{@"province": @"北京市", @"city": @"北京市"},@"京K": @{@"province": @"北京市", @"city": @"北京市"},@"京L": @{@"province": @"北京市", @"city": @"北京市"},@"京M": @{@"province": @"北京市", @"city": @"北京市"},@"京Y": @{@"province": @"北京市", @"city": @"北京市"},@"沪A": @{@"province": @"上海市", @"city": @"上海市"},@"沪B": @{@"province": @"上海市", @"city": @"上海市"},@"沪C": @{@"province": @"上海市", @"city": @"上海市"},@"沪D": @{@"province": @"上海市", @"city": @"上海市"},@"沪R": @{@"province": @"上海市", @"city": @"崇明区"},@"津A": @{@"province": @"天津市", @"city": @"天津市"},@"津B": @{@"province": @"天津市", @"city": @"天津市"},@"津C": @{@"province": @"天津市", @"city": @"天津市"},@"津D": @{@"province": @"天津市", @"city": @"天津市"},@"津E": @{@"province": @"天津市", @"city": @"天津市"},@"渝A": @{@"province": @"重庆市", @"city": @"重庆市"},@"渝B": @{@"province": @"重庆市", @"city": @"重庆市"},@"渝C": @{@"province": @"重庆市", @"city": @"永川区"},@"渝F": @{@"province": @"重庆市", @"city": @"万州区"},@"渝G": @{@"province": @"重庆市", @"city": @"涪陵区"},@"渝H": @{@"province": @"重庆市", @"city": @"黔江区"},@"冀A": @{@"province": @"河北省", @"city": @"石家庄市"},@"冀B": @{@"province": @"河北省", @"city": @"唐山市"},@"冀C": @{@"province": @"河北省", @"city": @"秦皇岛市"},@"冀D": @{@"province": @"河北省", @"city": @"邯郸市"},@"冀E": @{@"province": @"河北省", @"city": @"邢台市"},@"冀F": @{@"province": @"河北省", @"city": @"保定市"},@"冀G": @{@"province": @"河北省", @"city": @"张家口市"},@"冀H": @{@"province": @"河北省", @"city": @"承德市"},@"冀J": @{@"province": @"河北省", @"city": @"沧州市"},@"冀R": @{@"province": @"河北省", @"city": @"廊坊市"},@"冀S": @{@"province": @"河北省", @"city": @"沧州市"},@"冀T": @{@"province": @"河北省", @"city": @"衡水市"},@"豫A": @{@"province": @"河南省", @"city": @"郑州市"},@"豫B": @{@"province": @"河南省", @"city": @"开封市"},@"豫C": @{@"province": @"河南省", @"city": @"洛阳市"},@"豫D": @{@"province": @"河南省", @"city": @"平顶山市"},@"豫E": @{@"province": @"河南省", @"city": @"安阳市"},@"豫F": @{@"province": @"河南省", @"city": @"鹤壁市"},@"豫G": @{@"province": @"河南省", @"city": @"新乡市"},@"豫H": @{@"province": @"河南省", @"city": @"焦作市"},@"豫J": @{@"province": @"河南省", @"city": @"濮阳市"},@"豫K": @{@"province": @"河南省", @"city": @"许昌市"},@"豫L": @{@"province": @"河南省", @"city": @"漯河市"},@"豫M": @{@"province": @"河南省", @"city": @"三门峡市"},@"豫N": @{@"province": @"河南省", @"city": @"商丘市"},@"豫P": @{@"province": @"河南省", @"city": @"周口市"},@"豫Q": @{@"province": @"河南省", @"city": @"驻马店市"},@"豫R": @{@"province": @"河南省", @"city": @"南阳市"},@"豫S": @{@"province": @"河南省", @"city": @"信阳市"},@"豫U": @{@"province": @"河南省", @"city": @"济源市"},@"云A": @{@"province": @"云南省", @"city": @"昆明市"},@"云A-V": @{@"province": @"云南省", @"city": @"东川区"},@"云C": @{@"province": @"云南省", @"city": @"昭通市"},@"云D": @{@"province": @"云南省", @"city": @"曲靖市"},@"云E": @{@"province": @"云南省", @"city": @"楚雄彝族自治州"},@"云F": @{@"province": @"云南省", @"city": @"玉溪市"},@"云G": @{@"province": @"云南省", @"city": @"红河哈尼族彝族自治州"},@"云H": @{@"province": @"云南省", @"city": @"文山壮族苗族自治州"},@"云J": @{@"province": @"云南省", @"city": @"思茅区"},@"云K": @{@"province": @"云南省", @"city": @"西双版纳傣族自治州"},@"云L": @{@"province": @"云南省", @"city": @"大理白族自治州"},@"云M": @{@"province": @"云南省", @"city": @"保山市"},@"云N": @{@"province": @"云南省", @"city": @"德宏傣族景颇族自治州"},@"云P": @{@"province": @"云南省", @"city": @"丽江市"},@"云Q": @{@"province": @"云南省", @"city": @"怒江傈僳族自治州"},@"云R": @{@"province": @"云南省", @"city": @"迪庆藏族自治州"},@"云S": @{@"province": @"云南省", @"city": @"临沧市"},@"辽A": @{@"province": @"辽宁省", @"city": @"沈阳市"},@"辽B": @{@"province": @"辽宁省", @"city": @"大连市"},@"辽C": @{@"province": @"辽宁省", @"city": @"鞍山市"},@"辽D": @{@"province": @"辽宁省", @"city": @"抚顺市"},@"辽E": @{@"province": @"辽宁省", @"city": @"本溪市"},@"辽F": @{@"province": @"辽宁省", @"city": @"丹东市"},@"辽G": @{@"province": @"辽宁省", @"city": @"锦州市"},@"辽H": @{@"province": @"辽宁省", @"city": @"营口市"},@"辽J": @{@"province": @"辽宁省", @"city": @"阜新市"},@"辽K": @{@"province": @"辽宁省", @"city": @"辽阳市"},@"辽L": @{@"province": @"辽宁省", @"city": @"盘锦市"},@"辽M": @{@"province": @"辽宁省", @"city": @"铁岭市"},@"辽N": @{@"province": @"辽宁省", @"city": @"朝阳市"},@"辽P": @{@"province": @"辽宁省", @"city": @"葫芦岛市"},@"黑A": @{@"province": @"黑龙江省", @"city": @"哈尔滨市"},@"黑B": @{@"province": @"黑龙江省", @"city": @"齐齐哈尔市"},@"黑C": @{@"province": @"黑龙江省", @"city": @"牡丹江市"},@"黑D": @{@"province": @"黑龙江省", @"city": @"佳木斯市"},@"黑E": @{@"province": @"黑龙江省", @"city": @"大庆市"},@"黑F": @{@"province": @"黑龙江省", @"city": @"伊春市"},@"黑G": @{@"province": @"黑龙江省", @"city": @"鸡西市"},@"黑H": @{@"province": @"黑龙江省", @"city": @"鹤岗市"},@"黑J": @{@"province": @"黑龙江省", @"city": @"双鸭山市"},@"黑K": @{@"province": @"黑龙江省", @"city": @"七台河市"},@"黑L": @{@"province": @"黑龙江省", @"city": @"松花江地区（并入哈尔滨市）"},@"黑M": @{@"province": @"黑龙江省", @"city": @"绥化市"},@"黑N": @{@"province": @"黑龙江省", @"city": @"黑河市"},@"黑P": @{@"province": @"黑龙江省", @"city": @"大兴安岭地区"},@"黑R": @{@"province": @"黑龙江省", @"city": @"农垦系统"},@"湘A ": @{@"province": @"湖南省", @"city": @"长沙市"},@"湘B": @{@"province": @"湖南省", @"city": @"株洲市"},@"湘C": @{@"province": @"湖南省", @"city": @"湘潭市"},@"湘D": @{@"province": @"湖南省", @"city": @"衡阳市"},@"湘E": @{@"province": @"湖南省", @"city": @"邵阳市"},@"湘F": @{@"province": @"湖南省", @"city": @"岳阳市"},@"湘G": @{@"province": @"湖南省", @"city": @"张家界市"},@"湘H": @{@"province": @"湖南省", @"city": @"益阳市"},@"湘J": @{@"province": @"湖南省", @"city": @"常德市"},@"湘K": @{@"province": @"湖南省", @"city": @"娄底市"},@"湘L": @{@"province": @"湖南省", @"city": @"郴州市"},@"湘M": @{@"province": @"湖南省", @"city": @"永州市"},@"湘N": @{@"province": @"湖南省", @"city": @"怀化市"},@"湘U": @{@"province": @"湖南省", @"city": @"湘西土家族苗族自治州"},@"皖A": @{@"province": @"安徽省", @"city": @"合肥市"},@"皖B": @{@"province": @"安徽省", @"city": @"芜湖市"},@"皖C": @{@"province": @"安徽省", @"city": @"蚌埠市"},@"皖D": @{@"province": @"安徽省", @"city": @"淮南市"},@"皖E": @{@"province": @"安徽省", @"city": @"马鞍山市"},@"皖F": @{@"province": @"安徽省", @"city": @"淮北市"},@"皖G": @{@"province": @"安徽省", @"city": @"铜陵市"},@"皖H": @{@"province": @"安徽省", @"city": @"安庆市"},@"皖J": @{@"province": @"安徽省", @"city": @"黄山市"},@"皖K": @{@"province": @"安徽省", @"city": @"阜阳市"},@"皖L": @{@"province": @"安徽省", @"city": @"宿州市"},@"皖M": @{@"province": @"安徽省", @"city": @"滁州市"},@"皖N": @{@"province": @"安徽省", @"city": @"六安市"},@"皖P": @{@"province": @"安徽省", @"city": @"宣城市"},@"皖Q": @{@"province": @"安徽省", @"city": @"巢湖市"},@"皖R": @{@"province": @"安徽省", @"city": @"池州市"},@"皖S": @{@"province": @"安徽省", @"city": @"亳州市"},@"鲁A ": @{@"province": @"山东省", @"city": @"济南市"},@"鲁B": @{@"province": @"山东省", @"city": @"青岛市"},@"鲁C": @{@"province": @"山东省", @"city": @"淄博市"},@"鲁D": @{@"province": @"山东省", @"city": @"枣庄市"},@"鲁E": @{@"province": @"山东省", @"city": @"东营市"},@"鲁F": @{@"province": @"山东省", @"city": @"烟台市"},@"鲁G": @{@"province": @"山东省", @"city": @"潍坊市"},@"鲁H": @{@"province": @"山东省", @"city": @"济宁市"},@"鲁J": @{@"province": @"山东省", @"city": @"泰安市"},@"鲁K": @{@"province": @"山东省", @"city": @"威海市"},@"鲁L": @{@"province": @"山东省", @"city": @"日照市"},@"鲁M": @{@"province": @"山东省", @"city": @"滨州市"},@"鲁N": @{@"province": @"山东省", @"city": @"德州市"},@"鲁P": @{@"province": @"山东省", @"city": @"聊城市"},@"鲁Q": @{@"province": @"山东省", @"city": @"临沂市"},@"鲁R": @{@"province": @"山东省", @"city": @"菏泽市"},@"鲁S": @{@"province": @"山东省", @"city": @"莱芜市"},@"鲁U": @{@"province": @"山东省", @"city": @"青岛市"},@"鲁V": @{@"province": @"山东省", @"city": @"潍坊市"},@"鲁Y": @{@"province": @"山东省", @"city": @"烟台市"},@"新A": @{@"province": @"新疆维吾尔自治区", @"city": @"乌鲁木齐市"},@"新B": @{@"province": @"新疆维吾尔自治区", @"city": @"昌吉回族自治州"},@"新C": @{@"province": @"新疆维吾尔自治区", @"city": @"石河子市"},@"新D": @{@"province": @"新疆维吾尔自治区", @"city": @"奎屯市"},@"新E": @{@"province": @"新疆维吾尔自治区", @"city": @"博尔塔拉蒙古自治州"},@"新F": @{@"province": @"新疆维吾尔自治区", @"city": @"伊犁哈萨克自治州"},@"新G": @{@"province": @"新疆维吾尔自治区", @"city": @"塔城地区"},@"新H": @{@"province": @"新疆维吾尔自治区", @"city": @"阿勒泰地区"},@"新J": @{@"province": @"新疆维吾尔自治区", @"city": @"克拉玛依市"},@"新K": @{@"province": @"新疆维吾尔自治区", @"city": @"吐鲁番市"},@"新L": @{@"province": @"新疆维吾尔自治区", @"city": @"哈密市"},@"新M": @{@"province": @"新疆维吾尔自治区", @"city": @"巴音郭愣蒙古自治州"},@"新N": @{@"province": @"新疆维吾尔自治区", @"city": @"阿克苏地区"},@"新P": @{@"province": @"新疆维吾尔自治区", @"city": @"克孜勒苏柯尔克孜自治州"},@"新Q": @{@"province": @"新疆维吾尔自治区", @"city": @"喀什地区"},@"新R": @{@"province": @"新疆维吾尔自治区", @"city": @"和田地区"},@"苏A": @{@"province": @"江苏省", @"city": @"南京市"},@"苏B": @{@"province": @"江苏省", @"city": @"无锡市"},@"苏C": @{@"province": @"江苏省", @"city": @"徐州市"},@"苏D": @{@"province": @"江苏省", @"city": @"常州市"},@"苏E": @{@"province": @"江苏省", @"city": @"苏州市"},@"苏F": @{@"province": @"江苏省", @"city": @"南通市"},@"苏G": @{@"province": @"江苏省", @"city": @"连云港市"},@"苏H": @{@"province": @"江苏省", @"city": @"淮安市"},@"苏J": @{@"province": @"江苏省", @"city": @"盐城市"},@"苏K": @{@"province": @"江苏省", @"city": @"扬州市"},@"苏L": @{@"province": @"江苏省", @"city": @"镇江市"},@"苏M": @{@"province": @"江苏省", @"city": @"泰州市"},@"苏N": @{@"province": @"江苏省", @"city": @"宿迁市"},@"浙A": @{@"province": @"浙江省", @"city": @"杭州市"},@"浙B": @{@"province": @"浙江省", @"city": @"宁波市"},@"浙C": @{@"province": @"浙江省", @"city": @"温州市"},@"浙D": @{@"province": @"浙江省", @"city": @"绍兴市"},@"浙E": @{@"province": @"浙江省", @"city": @"湖州市"},@"浙F": @{@"province": @"浙江省", @"city": @"嘉兴市"},@"浙G": @{@"province": @"浙江省", @"city": @"金华市"},@"浙H": @{@"province": @"浙江省", @"city": @"衢州市"},@"浙J": @{@"province": @"浙江省", @"city": @"台州市"},@"浙K": @{@"province": @"浙江省", @"city": @"丽水市"},@"浙L": @{@"province": @"浙江省", @"city": @"舟山市"},@"赣A": @{@"province": @"江西省", @"city": @"南昌市"},@"赣B": @{@"province": @"江西省", @"city": @"赣州市"},@"赣C": @{@"province": @"江西省", @"city": @"宜春市"},@"赣D": @{@"province": @"江西省", @"city": @"吉安市"},@"赣E": @{@"province": @"江西省", @"city": @"上饶市"},@"赣F": @{@"province": @"江西省", @"city": @"抚州市"},@"赣G": @{@"province": @"江西省", @"city": @"九江市"},@"赣H": @{@"province": @"江西省", @"city": @"景德镇市"},@"赣J": @{@"province": @"江西省", @"city": @"萍乡市"},@"赣K": @{@"province": @"江西省", @"city": @"新余市"},@"赣L": @{@"province": @"江西省", @"city": @"鹰潭市"},@"赣M": @{@"province": @"江西省", @"city": @"南昌市"},@"鄂A": @{@"province": @"湖北省", @"city": @"武汉市"},@"鄂B": @{@"province": @"湖北省", @"city": @"黄石市"},@"鄂C": @{@"province": @"湖北省", @"city": @"十堰市"},@"鄂D": @{@"province": @"湖北省", @"city": @"荆州市"},@"鄂E": @{@"province": @"湖北省", @"city": @"宜昌市"},@"鄂F": @{@"province": @"湖北省", @"city": @"襄樊市"},@"鄂G": @{@"province": @"湖北省", @"city": @"鄂州市"},@"鄂H": @{@"province": @"湖北省", @"city": @"荆门市"},@"鄂J": @{@"province": @"湖北省", @"city": @"黄冈市"},@"鄂K": @{@"province": @"湖北省", @"city": @"孝感市"},@"鄂L": @{@"province": @"湖北省", @"city": @"咸宁市"},@"鄂M": @{@"province": @"湖北省", @"city": @"仙桃市"},@"鄂N": @{@"province": @"湖北省", @"city": @"潜江市"},@"鄂P": @{@"province": @"湖北省", @"city": @"神农架林区"},@"鄂Q": @{@"province": @"湖北省", @"city": @"恩施土家族苗族自治州"},@"鄂R": @{@"province": @"湖北省", @"city": @"天门市"},@"鄂S": @{@"province": @"湖北省", @"city": @"随州市"},@"桂A": @{@"province": @"广西壮族自治区", @"city": @"南宁市"},@"桂B": @{@"province": @"广西壮族自治区", @"city": @"柳州市"},@"桂C": @{@"province": @"广西壮族自治区", @"city": @"桂林市"},@"桂D": @{@"province": @"广西壮族自治区", @"city": @"梧州市"},@"桂E": @{@"province": @"广西壮族自治区", @"city": @"北海市"},@"桂F": @{@"province": @"广西壮族自治区", @"city": @"崇左市"},@"桂G": @{@"province": @"广西壮族自治区", @"city": @"来宾市"},@"桂H": @{@"province": @"广西壮族自治区", @"city": @"桂林市"},@"桂J": @{@"province": @"广西壮族自治区", @"city": @"贺州市"},@"桂K": @{@"province": @"广西壮族自治区", @"city": @"玉林市"},@"桂L": @{@"province": @"广西壮族自治区", @"city": @"百色市"},@"桂M": @{@"province": @"广西壮族自治区", @"city": @"河池市"},@"桂N": @{@"province": @"广西壮族自治区", @"city": @"钦州市"},@"桂P": @{@"province": @"广西壮族自治区", @"city": @"防城港市"},@"桂R": @{@"province": @"广西壮族自治区", @"city": @"贵港市"},@"甘A": @{@"province": @"甘肃省", @"city": @"兰州市"},@"甘B": @{@"province": @"甘肃省", @"city": @"嘉峪关市"},@"甘C": @{@"province": @"甘肃省", @"city": @"金昌市"},@"甘D": @{@"province": @"甘肃省", @"city": @"白银市"},@"甘E": @{@"province": @"甘肃省", @"city": @"天水市"},@"甘F": @{@"province": @"甘肃省", @"city": @"酒泉市"},@"甘G": @{@"province": @"甘肃省", @"city": @"张掖市"},@"甘H": @{@"province": @"甘肃省", @"city": @"武威市"},@"甘J": @{@"province": @"甘肃省", @"city": @"定西市"},@"甘K": @{@"province": @"甘肃省", @"city": @"陇南市"},@"甘L": @{@"province": @"甘肃省", @"city": @"平凉市"},@"甘M": @{@"province": @"甘肃省", @"city": @"庆阳市"},@"甘N": @{@"province": @"甘肃省", @"city": @"临夏回族自治州"},@"甘P": @{@"province": @"甘肃省", @"city": @"甘南藏族自治州"},@"晋A": @{@"province": @"山西省", @"city": @"太原市"},@"晋B": @{@"province": @"山西省", @"city": @"大同市"},@"晋C": @{@"province": @"山西省", @"city": @"阳泉市"},@"晋D": @{@"province": @"山西省", @"city": @"长治市"},@"晋E": @{@"province": @"山西省", @"city": @"晋城市"},@"晋F": @{@"province": @"山西省", @"city": @"朔州市"},@"晋H": @{@"province": @"山西省", @"city": @"忻州市"},@"晋J": @{@"province": @"山西省", @"city": @"吕梁市"},@"晋K": @{@"province": @"山西省", @"city": @"晋中市"},@"晋L": @{@"province": @"山西省", @"city": @"临汾市"},@"晋M": @{@"province": @"山西省", @"city": @"运城市"},@"蒙A": @{@"province": @"内蒙古自治区", @"city": @"呼和浩特市"},@"蒙B": @{@"province": @"内蒙古自治区", @"city": @"包头市"},@"蒙C": @{@"province": @"内蒙古自治区", @"city": @"乌海市"},@"蒙D": @{@"province": @"内蒙古自治区", @"city": @"赤峰市"},@"蒙E": @{@"province": @"内蒙古自治区", @"city": @"呼伦贝尔市"},@"蒙F": @{@"province": @"内蒙古自治区", @"city": @"兴安盟"},@"蒙G": @{@"province": @"内蒙古自治区", @"city": @"通辽市"},@"蒙H": @{@"province": @"内蒙古自治区", @"city": @"锡林郭勒盟"},@"蒙J": @{@"province": @"内蒙古自治区", @"city": @"乌兰察布市"},@"蒙K": @{@"province": @"内蒙古自治区", @"city": @"鄂尔多斯市"},@"蒙L": @{@"province": @"内蒙古自治区", @"city": @"巴彦淖尔市"},@"蒙M": @{@"province": @"内蒙古自治区", @"city": @"阿拉善盟"},@"陕A": @{@"province": @"陕西省", @"city": @"西安市"},@"陕B": @{@"province": @"陕西省", @"city": @"铜川市"},@"陕C": @{@"province": @"陕西省", @"city": @"宝鸡市"},@"陕D": @{@"province": @"陕西省", @"city": @"咸阳市"},@"陕E": @{@"province": @"陕西省", @"city": @"渭南市"},@"陕F": @{@"province": @"陕西省", @"city": @"汉中市"},@"陕G": @{@"province": @"陕西省", @"city": @"安康市"},@"陕H": @{@"province": @"陕西省", @"city": @"商洛市"},@"陕J": @{@"province": @"陕西省", @"city": @"延安市"},@"陕K": @{@"province": @"陕西省", @"city": @"榆林市"},@"陕V": @{@"province": @"陕西省", @"city": @"杨凌区"},@"吉A": @{@"province": @"吉林省", @"city": @"长春市"},@"吉B": @{@"province": @"吉林省", @"city": @"吉林市"},@"吉C": @{@"province": @"吉林省", @"city": @"四平市"},@"吉D": @{@"province": @"吉林省", @"city": @"辽源市"},@"吉E": @{@"province": @"吉林省", @"city": @"通化市"},@"吉F": @{@"province": @"吉林省", @"city": @"白山市"},@"吉G": @{@"province": @"吉林省", @"city": @"白城市"},@"吉H": @{@"province": @"吉林省", @"city": @"延边朝鲜族自治州"},@"吉J": @{@"province": @"吉林省", @"city": @"松原市"},@"吉K": @{@"province": @"吉林省", @"city": @"长白朝鲜族自治县"},@"闽A": @{@"province": @"福建省", @"city": @"福州市"},@"闽B": @{@"province": @"福建省", @"city": @"莆田市"},@"闽C": @{@"province": @"福建省", @"city": @"泉州市"},@"闽D": @{@"province": @"福建省", @"city": @"厦门市"},@"闽E": @{@"province": @"福建省", @"city": @"漳州市"},@"闽F": @{@"province": @"福建省", @"city": @"龙岩市"},@"闽G": @{@"province": @"福建省", @"city": @"三明市"},@"闽H": @{@"province": @"福建省", @"city": @"南平市"},@"闽J": @{@"province": @"福建省", @"city": @"宁德市"},@"闽K": @{@"province": @"福建省", @"city": @"省直系统"},@"贵A": @{@"province": @"贵州省", @"city": @"贵阳市"},@"贵B": @{@"province": @"贵州省", @"city": @"六盘水市"},@"贵C": @{@"province": @"贵州省", @"city": @"遵义市"},@"贵D": @{@"province": @"贵州省", @"city": @"铜仁地区"},@"贵E": @{@"province": @"贵州省", @"city": @"黔西南布依族苗族自治州"},@"贵F": @{@"province": @"贵州省", @"city": @"毕节地区"},@"贵G": @{@"province": @"贵州省", @"city": @"安顺市"},@"贵H": @{@"province": @"贵州省", @"city": @"黔东南苗族侗族自治州"},@"贵J": @{@"province": @"贵州省", @"city": @"黔南布依族苗族自治州"},@"粤A": @{@"province": @"广东省", @"city": @"广州市"},@"粤B": @{@"province": @"广东省", @"city": @"深圳市"},@"粤C": @{@"province": @"广东省", @"city": @"珠海市"},@"粤D": @{@"province": @"广东省", @"city": @"汕头市"},@"粤E": @{@"province": @"广东省", @"city": @"佛山市"},@"粤F": @{@"province": @"广东省", @"city": @"韶关市"},@"粤G": @{@"province": @"广东省", @"city": @"湛江市"},@"粤H": @{@"province": @"广东省", @"city": @"肇庆市"},@"粤J": @{@"province": @"广东省", @"city": @"江门市"},@"粤K": @{@"province": @"广东省", @"city": @"茂名市"},@"粤L": @{@"province": @"广东省", @"city": @"惠州市"},@"粤M": @{@"province": @"广东省", @"city": @"梅州市"},@"粤N": @{@"province": @"广东省", @"city": @"汕尾市"},@"粤P": @{@"province": @"广东省", @"city": @"河源市"},@"粤Q": @{@"province": @"广东省", @"city": @"阳江市"},@"粤R": @{@"province": @"广东省", @"city": @"清远市"},@"粤S": @{@"province": @"广东省", @"city": @"东莞市"},@"粤T": @{@"province": @"广东省", @"city": @"中山市"},@"粤U": @{@"province": @"广东省", @"city": @"潮州市"},@"粤V": @{@"province": @"广东省", @"city": @"揭阳市"},@"粤W": @{@"province": @"广东省", @"city": @"云浮市"},@"粤X": @{@"province": @"广东省", @"city": @"顺德区"},@"粤Y": @{@"province": @"广东省", @"city": @"南海区"},@"粤Z": @{@"province": @"广东省", @"city": @"港澳进入内地车辆"},@"川A": @{@"province": @"四川省", @"city": @"成都市"},@"川B": @{@"province": @"四川省", @"city": @"绵阳市"},@"川C": @{@"province": @"四川省", @"city": @"自贡市"},@"川D": @{@"province": @"四川省", @"city": @"攀枝花市"},@"川E": @{@"province": @"四川省", @"city": @"泸州市"},@"川F": @{@"province": @"四川省", @"city": @"德阳市"},@"川G": @{@"province": @"四川省", @"city": @"成都市"},@"川H": @{@"province": @"四川省", @"city": @"广元市"},@"川J": @{@"province": @"四川省", @"city": @"遂宁市"},@"川K": @{@"province": @"四川省", @"city": @"内江市"},@"川L": @{@"province": @"四川省", @"city": @"乐山市"},@"川M": @{@"province": @"四川省", @"city": @"资阳市"},@"川Q": @{@"province": @"四川省", @"city": @"宜宾市"},@"川R": @{@"province": @"四川省", @"city": @"南充市"},@"川S": @{@"province": @"四川省", @"city": @"达州市"},@"川T": @{@"province": @"四川省", @"city": @"雅安市"},@"川U": @{@"province": @"四川省", @"city": @"阿坝藏族羌族自治州"},@"川V": @{@"province": @"四川省", @"city": @"甘孜藏族自治州"},@"川W": @{@"province": @"四川省", @"city": @"凉山彝族自治州"},@"川X": @{@"province": @"四川省", @"city": @"广安市"},@"川Y": @{@"province": @"四川省", @"city": @"巴中市"},@"川Z": @{@"province": @"四川省", @"city": @"眉山市"},@"青A": @{@"province": @"青海省", @"city": @"西宁市"},@"青B": @{@"province": @"青海省", @"city": @"海东地区"},@"青C": @{@"province": @"青海省", @"city": @"海北藏族自治州"},@"青D": @{@"province": @"青海省", @"city": @"黄南藏族自治州"},@"青E": @{@"province": @"青海省", @"city": @"海南藏族自治州"},@"青F": @{@"province": @"青海省", @"city": @"果洛藏族自治州"},@"青G": @{@"province": @"青海省", @"city": @"玉树藏族自治州"},@"青H": @{@"province": @"青海省", @"city": @"海西蒙古族藏族自治州"},@"藏A": @{@"province": @"西藏自治区", @"city": @"拉萨市"},@"藏B": @{@"province": @"西藏自治区", @"city": @"昌都地区"},@"藏C": @{@"province": @"西藏自治区", @"city": @"山南市"},@"藏D": @{@"province": @"西藏自治区", @"city": @"日喀则市"},@"藏E": @{@"province": @"西藏自治区", @"city": @"那曲地区"},@"藏F": @{@"province": @"西藏自治区", @"city": @"阿里地区"},@"藏G": @{@"province": @"西藏自治区", @"city": @"林芝市"},@"藏H": @{@"province": @"西藏自治区", @"city": @"驻四川省天全县车辆管理所"},@"藏J": @{@"province": @"西藏自治区", @"city": @"驻青海省格尔木市车辆管理所"},@"琼A": @{@"province": @"海南省", @"city": @"海口市"},@"琼B": @{@"province": @"海南省", @"city": @"三亚市"},@"琼C": @{@"province": @"海南省", @"city": @"琼海市"},@"琼D": @{@"province": @"海南省", @"city": @"五指山市"},@"琼E": @{@"province": @"海南省", @"city": @"洋浦开发区"},@"宁A": @{@"province": @"宁夏回族自治区", @"city": @"银川市"},@"宁B": @{@"province": @"宁夏回族自治区", @"city": @"石嘴山市"},@"宁C": @{@"province": @"宁夏回族自治区", @"city": @"银南市"},@"宁D": @{@"province": @"宁夏回族自治区", @"city": @"固原市"},@"宁E": @{@"province": @"宁夏回族自治区", @"city": @"中卫市"}
                                  };
    NSLog(@"query words: %@, length: %lu", self.SNToQuery, [self.SNToQuery length]);
    if ([self.SNToQuery length] < 2) {
        [self alertWithView];
        return;
    };
    self.SNToQuery = [self.SNToQuery uppercaseString];
    NSString *subStr = [self.SNToQuery substringToIndex:2];
    NSDictionary *result = licenseData[subStr];
    if ([result count] <= 0) {
        [self alertWithView];
        return;
    }
    [self updateViewController:result];
}

-(void)updateViewController: (NSDictionary *)result
{
    self.license.text = self.SNToQuery;
    self.province.text = result[@"province"];
    self.city.text = result[@"city"];
}

-(void)alertWithView
{
    UIAlertView *alertDialog;
    alertDialog = [[UIAlertView alloc]
                   initWithTitle:@"查询失败"
                   message:@"请输入正确的车牌号，比如京BAT996"
                   delegate:nil
                   cancelButtonTitle:@"好"
                   otherButtonTitles:nil];
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

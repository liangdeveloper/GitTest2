//
//  ViewController.m
//  GitTest
//
//  Created by liangjian on 2021/1/13.
//

#import "ViewController.h"

#import <YYCategories/YYCategories.h>

#import <SystemConfiguration/CaptiveNetwork.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#import <AppTrackingTransparency/AppTrackingTransparency.h>
#import <AdSupport/AdSupport.h>


#import<CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 这是在ww上添加的代码


    // Do any additional setup after loading the view.
    
//    NSLog(@"ww第二次修改");
//
//    NSLog(@"ww的第三次修改");
    // 电量信息
    [UIDevice currentDevice].batteryMonitoringEnabled = YES;
    double deviceLevel = [UIDevice currentDevice].batteryLevel;
    NSLog(@"bettery=  %f", deviceLevel);
    
    
    // iOS版本信息
    double systemVersion = [UIDevice systemVersion];
    NSLog(@"systemVersion= %f", systemVersion);
    
    UIDevice *device = [UIDevice currentDevice];
    // 系统名称
    NSString *systemName = [device systemName];
    // 手机型号
    NSString *model = [device machineModelName];
    // 系统启动时间
    NSDate *startDate = [device systemUptime];
    // 磁盘容量
    int64_t diskSpace = [device diskSpace];
    // 内存容量
    int64_t memoryTotal = [device memoryTotal];
    // 用户自定义设备名称
    NSString *name = [device name];
    // cpu核数
    NSUInteger cpuCount = [device cpuCount];
    // 屏幕分辨率
    CGRect bounds = [UIScreen mainScreen].bounds;
    CGFloat scale_screen = [UIScreen mainScreen].scale;
    CGFloat width = bounds.size.width * scale_screen;
    CGFloat hieght = bounds.size.height * scale_screen;
    
    // 运营商
    [self getSIMOperator];
    
    // 国家码
    CTTelephonyNetworkInfo *network_Info = [CTTelephonyNetworkInfo new];
    NSDictionary<NSString *, CTCarrier *> *carrier = network_Info.serviceSubscriberCellularProviders;
    
    
    for (NSString *key in carrier.allKeys) {
        CTCarrier *c = [carrier objectForKey:key];
        NSLog(@"country code is: %@", c.mobileCountryCode);
    
        //will return the actual country code
        NSLog(@"ISO country code is: %@", c.isoCountryCode);
    }
    
    [self countryCode];
    
    [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
            if (status == ATTrackingManagerAuthorizationStatusAuthorized) {
                // 已授权
                NSString *idfa = [[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString];
            } else {
                // 此时用户点击拒绝则无法读取
                NSString *idfa = [[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString];
            }
        }];
    
    NSString *updateTime = [self getSysU];
    
    NSLog(@"end");

}

//system update time
- (NSString *)getSysU {
    NSString *result = nil;
    NSString *information = @"L3Zhci9tb2JpbGUvTGlicmFyeS9Vc2VyQ29uZmlndXJhdGlvblByb2ZpbGVzL1B1YmxpY0luZm8vTUNNZXRhLnBsaXN0";
    NSData *data=[[NSData alloc]initWithBase64EncodedString:information options:0];
    NSString *dataString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSDictionary *fileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:dataString error:&error];
    if (fileAttributes) {
        id singleAttibute = [fileAttributes objectForKey:NSFileCreationDate];
        if ([singleAttibute isKindOfClass:[NSDate class]]) {
            NSDate *dataDate = singleAttibute;
            result = [NSString stringWithFormat:@"%f",[dataDate timeIntervalSince1970]];
        }
    }
    return result;
}

- (void)countryCode {
    CTTelephonyNetworkInfo *network_Info = [CTTelephonyNetworkInfo new];
    NSDictionary<NSString *, CTCarrier *> *carrier = network_Info.serviceSubscriberCellularProviders;
    NSString *firstKey = carrier.allKeys.count ? carrier.allKeys.firstObject : nil;
    if (firstKey) {
        CTCarrier *c = [carrier objectForKey:firstKey];
        NSLog(@"country code is: %@", c.mobileCountryCode);
        NSLog(@"ISO country code is: %@", c.mobileNetworkCode);
        NSLog(@"diling code == %@",[self getCountryCode:c.isoCountryCode]);
    }
    
}

- (NSString *)getCountryCode:(NSString *)countryISOCode{
    NSDictionary * code = @{@"AF": @"93", @"AE": @"971", @"AL": @"355", @"AN": @"599", @"AS":@"1", @"AD": @"376", @"AO": @"244", @"AI": @"1", @"AG":@"1", @"AR": @"54",@"AM": @"374", @"AW": @"297", @"AU":@"61", @"AT": @"43",@"AZ": @"994", @"BS": @"1", @"BH":@"973", @"BF": @"226",@"BI": @"257", @"BD": @"880", @"BB": @"1", @"BY": @"375", @"BE":@"32",@"BZ": @"501", @"BJ": @"229", @"BM": @"1", @"BT":@"975", @"BA": @"387", @"BW": @"267", @"BR": @"55", @"BG": @"359", @"BO": @"591", @"BL": @"590", @"BN": @"673", @"CC": @"61", @"CD":@"243",@"CI": @"225", @"KH":@"855", @"CM": @"237", @"CA": @"1", @"CV": @"238", @"KY":@"345", @"CF":@"236", @"CH": @"41", @"CL": @"56", @"CN":@"86",@"CX": @"61", @"CO": @"57", @"KM": @"269", @"CG":@"242", @"CK": @"682", @"CR": @"506", @"CU":@"53", @"CY":@"537",@"CZ": @"420", @"DE": @"49", @"DK": @"45", @"DJ":@"253", @"DM": @"1", @"DO": @"1", @"DZ": @"213", @"EC": @"593", @"EG":@"20", @"ER": @"291", @"EE":@"372",@"ES": @"34", @"ET": @"251", @"FM": @"691", @"FK": @"500", @"FO": @"298", @"FJ": @"679", @"FI":@"358", @"FR": @"33", @"GB":@"44", @"GF": @"594", @"GA":@"241", @"GS": @"500", @"GM":@"220", @"GE":@"995",@"GH":@"233", @"GI": @"350", @"GQ": @"240", @"GR": @"30", @"GG": @"44", @"GL": @"299", @"GD":@"1", @"GP": @"590", @"GU": @"1", @"GT": @"502", @"GN":@"224",@"GW": @"245", @"GY": @"595", @"HT": @"509", @"HR": @"385", @"HN":@"504", @"HU": @"36", @"HK": @"852", @"IR": @"98", @"IM": @"44", @"IL": @"972", @"IO":@"246", @"IS": @"354", @"IN": @"91", @"ID":@"62", @"IQ":@"964", @"IE": @"353",@"IT":@"39", @"JM":@"1", @"JP": @"81", @"JO": @"962", @"JE":@"44", @"KP": @"850", @"KR": @"82",@"KZ":@"77", @"KE": @"254", @"KI": @"686", @"KW": @"965", @"KG":@"996",@"KN":@"1", @"LC": @"1", @"LV": @"371", @"LB": @"961", @"LK":@"94", @"LS": @"266", @"LR":@"231", @"LI": @"423", @"LT": @"370", @"LU": @"352", @"LA": @"856", @"LY":@"218", @"MO": @"853", @"MK": @"389", @"MG":@"261", @"MW": @"265", @"MY": @"60",@"MV": @"960", @"ML":@"223", @"MT": @"356", @"MH": @"692", @"MQ": @"596", @"MR":@"222", @"MU": @"230", @"MX": @"52",@"MC": @"377", @"MN": @"976", @"ME": @"382", @"MP": @"1", @"MS": @"1", @"MA":@"212", @"MM": @"95", @"MF": @"590", @"MD":@"373", @"MZ": @"258", @"NA":@"264", @"NR":@"674", @"NP":@"977", @"NL": @"31",@"NC": @"687", @"NZ":@"64", @"NI": @"505", @"NE": @"227", @"NG": @"234", @"NU":@"683", @"NF": @"672", @"NO": @"47",@"OM": @"968", @"PK": @"92", @"PM": @"508", @"PW": @"680", @"PF": @"689", @"PA": @"507", @"PG":@"675", @"PY": @"595", @"PE": @"51", @"PH": @"63", @"PL":@"48", @"PN": @"872",@"PT": @"351", @"PR": @"1",@"PS": @"970", @"QA": @"974", @"RO":@"40", @"RE":@"262", @"RS": @"381", @"RU": @"7", @"RW": @"250", @"SM": @"378", @"SA":@"966", @"SN": @"221", @"SC": @"248", @"SL":@"232",@"SG": @"65", @"SK": @"421", @"SI": @"386", @"SB":@"677", @"SH": @"290", @"SD": @"249", @"SR": @"597",@"SZ": @"268", @"SE":@"46", @"SV": @"503", @"ST": @"239",@"SO": @"252", @"SJ": @"47", @"SY":@"963", @"TW": @"886", @"TZ": @"255", @"TL": @"670", @"TD": @"235", @"TJ": @"992", @"TH": @"66", @"TG":@"228", @"TK": @"690", @"TO": @"676", @"TT": @"1", @"TN":@"216",@"TR": @"90", @"TM": @"993", @"TC": @"1", @"TV":@"688", @"UG": @"256", @"UA": @"380", @"US": @"1", @"UY": @"598",@"UZ": @"998", @"VA":@"379", @"VE":@"58", @"VN": @"84", @"VG": @"1", @"VI": @"1",@"VC":@"1", @"VU":@"678", @"WS": @"685", @"WF": @"681", @"YE": @"967", @"YT": @"262",@"ZA": @"27" , @"ZM": @"260", @"ZW":@"263"};
    return [NSString stringWithFormat:@"+%@", [code objectForKey:[countryISOCode uppercaseString]]];
}



- (void)getSIMOperator {

    CTTelephonyNetworkInfo *networkInfo = [[CTTelephonyNetworkInfo alloc] init];
    
    NSDictionary<NSString *, CTCarrier *> *carriers = networkInfo.serviceSubscriberCellularProviders;
    
    for (NSString *key in carriers.allKeys) {
        CTCarrier *carrier = [carriers objectForKey:key];
        
        NSString *carrier_country_code = carrier.isoCountryCode;

        if (carrier_country_code == nil) {
            carrier_country_code = @"";
        }
        //国家编号
        NSString *CountryCode = carrier.mobileCountryCode;

        if (CountryCode == nil) {
            CountryCode = @"";
        }
        //网络供应商编码
        NSString *NetworkCode = carrier.mobileNetworkCode;

        if (NetworkCode == nil) {
            NetworkCode = @"";
        }

        NSString *mobile_country_code = [NSString stringWithFormat:@"%@%@",CountryCode,NetworkCode];

        if (mobile_country_code == nil) {
            mobile_country_code = @"";
        }

        NSString *carrier_name = nil;    //网络运营商的名字
        NSString *code = [carrier mobileNetworkCode];

        if ([code isEqualToString:@"00"] || [code isEqualToString:@"02"] || [code isEqualToString:@"07"]) {
            // ret = @"移动"
            carrier_name = @"CMCC";
          }
      
        if ([code isEqualToString:@"03"] || [code isEqualToString:@"05"]) {
            // ret = @"电信";
            carrier_name =  @"CTCC";
        }

        if ([code isEqualToString:@"01"] || [code isEqualToString:@"06"]) {
            // ret = @"联通";
            carrier_name =  @"CUCC";
        }
      
        if (code == nil) {
            carrier_name = @"";
        }

        carrier_name = [NSString stringWithFormat:@"%@-%@",carrier_name,[carrier.carrierName stringByRemovingPercentEncoding]];
        
        [carrier.carrierName stringByRemovingPercentEncoding];
        NSLog(@"运营商:%@", carrier_name);
    }
    
    
}


@end

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
    
    
    NSLog(@"end");

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

//
//  ViewController.m
//  PhotoPicker
//
//  Created by AlienJunX on 15/11/2.
//  Copyright © 2015年 com.alienjun.demo. All rights reserved.
//

#import "ViewController.h"
#import "AJLocationManager.h"
#import "BoPhotoPickerViewController.h"

@interface ViewController ()<BoPhotoPickerProtocol>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [[AJLocationManager shareLocation] getAddress:^(NSString *addressString) {
//        
//    } error:^(NSError *error) {
//        
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnAction:(id)sender {
//    [[UIApplication sharedApplication] openURL:[NSURL  URLWithString:UIApplicationOpenSettingsURLString]];
    
    BoPhotoPickerViewController *picker = [[BoPhotoPickerViewController alloc] init];
    picker.maximumNumberOfSelection = 10;
    picker.assetsFilter = [ALAssetsFilter allPhotos];
    picker.showEmptyGroups=NO;
    picker.delegate=self;
    picker.selectionFilter = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        if ([[(ALAsset*)evaluatedObject valueForProperty:ALAssetPropertyType] isEqual:ALAssetTypeVideo]) {
            NSTimeInterval duration = [[(ALAsset*)evaluatedObject valueForProperty:ALAssetPropertyDuration] doubleValue];
            return duration >= 5;
        } else {
            return YES;
        }
    }];
    
    [self presentViewController:picker animated:YES completion:nil];
}


- (IBAction)test:(id)sender {
    UIView *clickLayer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    clickLayer.backgroundColor = [UIColor redColor];
    clickLayer.clipsToBounds = YES;
    clickLayer.layer.cornerRadius = 10;
    clickLayer.center = self.view.center;
    [self.view addSubview:clickLayer];
    
//    clickLayer.affineTransform = CGAffineTransformIdentity;
        [UIView animateWithDuration:0.5 animations:^{
            clickLayer.transform = CGAffineTransformMakeScale(26.0, 26.0);
            clickLayer.alpha = 0.3;
        } completion:^(BOOL finished) {
            [clickLayer removeFromSuperview];
        }];
}

@end

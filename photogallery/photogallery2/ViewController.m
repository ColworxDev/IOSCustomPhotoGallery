//
//  ViewController.m
//  photogallery2
//
//  Created by shujat ali on 7/25/15.
//  Copyright (c) 2015 shujat ali. All rights reserved.
//

#import "ViewController.h"
#import "PhotoItem.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnpressed:(UIButton *)sender {
    
    NSArray *images = @[
                        @{@"TITLE" : @"asdas asdasd1",
                          @"DESCRIPTION" : @"asdas asdasd1",
                          @"URL" :@"http://www.planwallpaper.com/static/images/beach-cool-wallpaper-hd_1.jpg"},
                        @{@"TITLE" : @"asdas asdasd2",
                          @"DESCRIPTION" : @"asdas asdasd2",
                          @"URL" :@"http://www.planwallpaper.com/static/images/a601cb579cc9a289bc51cd41d8bcf478_large.jpg"},
                        @{@"TITLE" : @"asdas asdasd3",
                          @"DESCRIPTION" : @"asdas asdasd3",
                          @"URL" :@"http://www.planwallpaper.com/static/images/bicycle-1280x720.jpg"},
                        @{@"TITLE" : @"asdas asdasd4",
                          @"DESCRIPTION" : @"asdas asdasd4",
                          @"URL" :@"http://www.planwallpaper.com/static/images/lamborghini_murcielago_superveloce_2-2880x1800.jpg"}
                        ];
    
    NSMutableArray *arrImages = [[NSMutableArray alloc]init];
    
    for (NSDictionary *dict in images) {
        PhotoItem *item = [[PhotoItem alloc]init];
        item.urlString = dict[@"URL"];
        item.descriptiontext = dict[@"DESCRIPTION"];
        item.titletext = dict[@"TITLE"];
        
        [arrImages addObject:item];
    }
    
    PhotoPageViewController *vc =[[PhotoPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    vc.galleryItems = arrImages;
    vc.showpaginationlabel = YES;
    vc.photoControllerDelegate = self;
    

    [self presentViewController:vc animated:YES completion:nil];
}

-(void)onPhotoDidScroll:(int)index{
    NSLog(@"from controller %d",index);
}



@end

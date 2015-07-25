//
//  PhotoGalleryController.m
//  photogallery2
//
//  Created by shujat ali on 7/25/15.
//  Copyright (c) 2015 shujat ali. All rights reserved.
//

#import "PhotoGalleryController.h"
#import "UIImageView+WebCache.h"

@interface PhotoGalleryController ()

@end

@implementation PhotoGalleryController

@synthesize imageview,titleview,descriptionview,progressview,itemPhoto;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    titleview.text = @"";
    descriptionview.text = @"";
    imageview.image = nil;
    
    if(itemPhoto.titletext)
    self.titleview.text = itemPhoto.titletext;
    
    
    if(itemPhoto. descriptiontext){
        descriptionview.text =itemPhoto. descriptiontext;
    }
    
    if(itemPhoto. urlString){
    [imageview sd_setImageWithPreviousCachedImageWithURL:[NSURL URLWithString:itemPhoto. urlString] andPlaceholderImage:[UIImage imageNamed:@""] options:SDWebImageContinueInBackground progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        double progress = (receivedSize *1.0)/ (expectedSize *1.0);
        progressview.value =progress;
        NSString *progresstr =[NSString stringWithFormat:@"%.1f %%" ,progress *100];
        [self performSelectorOnMainThread:@selector(updateProgress:) withObject:progresstr  waitUntilDone:NO];
        
//        NSLog(@" %ld ,  %ld , %f" , (long)receivedSize,(long)expectedSize,progress);
        [progressview setHidden:NO];
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
  //      NSLog(@"error %@",error);
        [progressview setHidden:YES];
        [self.labelprogress setHidden:YES];
    }];
    }
    

    
    self.scrollview.minimumZoomScale=0.5;
    self.scrollview.maximumZoomScale=6.0;
    self.scrollview.contentSize=CGSizeMake(1280, 960);
    self.scrollview.delegate=self;
}


-(void)updateProgress :(NSString *)str{
    if(str){
    self.labelprogress.text = str;
    }
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageview;
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

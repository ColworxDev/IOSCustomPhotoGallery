//
//  PhotoGalleryController.h
//  photogallery2
//
//  Created by shujat ali on 7/25/15.
//  Copyright (c) 2015 shujat ali. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MACircleProgressIndicator.h"
#import "PhotoItem.h"

@interface PhotoGalleryController : UIViewController<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (weak, nonatomic) IBOutlet UITextView *descriptionview;
@property (weak, nonatomic) IBOutlet UILabel *titleview;
@property (weak, nonatomic)  PhotoItem *itemPhoto;

@property (weak, nonatomic) IBOutlet MACircleProgressIndicator *progressview;
@property (weak, nonatomic) IBOutlet UILabel *labelprogress;

@end

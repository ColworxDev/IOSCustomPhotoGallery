//
//  PhotoPageViewController.h
//  photogallery2
//
//  Created by shujat ali on 7/25/15.
//  Copyright (c) 2015 shujat ali. All rights reserved.
//

#import <UIKit/UIKit.h>


@class PhotoPageViewController;

@protocol PhotoPageViewControllerDelegate <NSObject>
@optional
- (void)onPhotoDidScroll : (int )index ;
//TODO: this function needs some implementations
- (void)onPhotoTapped : (int )index ;
@required

@end


@interface PhotoPageViewController : UIPageViewController<UIPageViewControllerDataSource,UIPageViewControllerDelegate>{
    id <PhotoPageViewControllerDelegate> contactsDelegate;
}
@property (nonatomic) id <PhotoPageViewControllerDelegate> photoControllerDelegate;

@property (nonatomic) NSArray *galleryItems;
@property (nonatomic) BOOL showtoptoolbar;
@property (nonatomic) BOOL showbottomtoolbar;
@property (nonatomic) BOOL showpaginationDots;
@property (nonatomic) BOOL showpaginationlabel;

@property (nonatomic) UIBarButtonItem *pageindexlabel;
@property (nonatomic) NSMutableArray *photosControllers;






@end

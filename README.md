# IOSCustomPhotoGallery


I have created this library while taking inspiration from https://github.com/mariohahn/MHVideoPhotoGallery 
but this library is much complex can do many thing but if i had to customize the view , its very complicated.
so i have created a very basic simpler version of MHVideoPhotoGallery that can be easily customizable view 
because i have create photogallery view from nib. so it can be easily customized.

hoping this project would help others....


here is sample line of code to present this gallery view

-->
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
    [self presentViewController:vc animated:YES completion:nil];
    
    <--


![alt tag](/dashboard.png )

![alt tag](/screen1.png )

![alt tag](/screen2.png )

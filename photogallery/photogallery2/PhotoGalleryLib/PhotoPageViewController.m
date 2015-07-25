//
//  PhotoPageViewController.m
//  photogallery2
//
//  Created by shujat ali on 7/25/15.
//  Copyright (c) 2015 shujat ali. All rights reserved.
//

#import "PhotoPageViewController.h"
#import "PhotoGalleryController.h"



@interface PhotoPageViewController ()

@end

@implementation PhotoPageViewController

@synthesize photoControllerDelegate,galleryItems,photosControllers,pageindexlabel;




- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    if(self.showpaginationDots == NO && self.showpaginationlabel == NO){
        self.showpaginationDots = YES;
    }
    else if(self.showpaginationDots){
        self.showpaginationlabel = NO;
    }
    else{
        self.showpaginationDots = NO;
    }
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    photosControllers = [[NSMutableArray alloc]init];
    
    for (int i=0;i<galleryItems.count;i++) {

        
        PhotoGalleryController *vc = [[PhotoGalleryController alloc]initWithNibName:@"PhotoController" bundle:[NSBundle mainBundle]];
        vc.itemPhoto = [galleryItems objectAtIndex:i];
        
        [photosControllers addObject:vc];
        
    }
    
    
    
    
    [self addTopToolBar];
    [self addbottomToolbar];
    [self updatePageIndex];
    
    

    [self setcurrentController:0];
    

    self.delegate = self;
    self.dataSource = self;

}

-(void)hideDotsPagination{
    NSArray *subviews = self.view.subviews;
    UIPageControl *thisControl = nil;
    for (int i=0; i<[subviews count]; i++) {
        if ([[subviews objectAtIndex:i] isKindOfClass:[UIPageControl class]]) {
            thisControl = (UIPageControl *)[subviews objectAtIndex:i];
        }
    }
    
    thisControl.hidden = !self.showpaginationDots;
}

-(void)addTopToolBar{

        
    
        UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem *donebutton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(donepressed:)];
        float toolbarheight = 40;
        float ypos  = 0;
        float screenwidth = self.view.frame.size.width;
        UIToolbar *toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, ypos, screenwidth, toolbarheight)];
        [toolbar setItems:@[ flexibleSpace, donebutton]];
        
        [self.view addSubview:toolbar];
    
}

-(void)donepressed : (id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)addbottomToolbar{
    
    UIBarButtonItem *leftbarbutton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(prevcontroller:)];
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    pageindexlabel = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    UIBarButtonItem *nextbarbutton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(nextcontroller:)];
    
    float toolbarheight = 40;
    float ypos  = self.view.frame.size.height - toolbarheight;
    float screenwidth = self.view.frame.size.width;
    UIToolbar *toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, ypos, screenwidth, toolbarheight)];
    [toolbar setItems:@[leftbarbutton, flexibleSpace,pageindexlabel,flexibleSpace, nextbarbutton]];
    
    [self.view addSubview:toolbar];
}

-(void)setcurrentController : (int)index{
    [self setViewControllers:[NSArray arrayWithObject:photosControllers[index]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
}

-(void)nextcontroller : (id)sender{
//    NSLog(@"nextcontroller");
    if([self currentIndex] +1< photosControllers.count ){
        [self setcurrentController:(int)[self currentIndex]+1];
    }
    else{
        
    }
    
}

-(void)prevcontroller : (id)sender{
//        NSLog(@"prevcontroller");
    if([self currentIndex] >0){
        [self setcurrentController:(int)[self currentIndex]-1];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(void)updatePageIndex{
    if(pageindexlabel){
        if(self.showpaginationlabel ){
            pageindexlabel.title = [NSString stringWithFormat:@"%ld of %lu",[self currentIndex] +1, (unsigned long)photosControllers.count];
            
            
        }
        else{
            pageindexlabel.title = @"";
        }
    }
    
    if (photoControllerDelegate != nil && [photoControllerDelegate respondsToSelector:@selector(onPhotoDidScroll:)]){
        [[self photoControllerDelegate] onPhotoDidScroll :(int) [self currentIndex]];
    }
    
    [self hideDotsPagination];
}

#pragma  - UIPageViewController Methods

#pragma  - UIPageViewController Methods
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [self currentIndex];
    
   
    
     [self updatePageIndex];    
    if (index == 0) {
        return nil;
    }
    
    index--;

    return [self viewControllerAtIndex:index];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    //    NSUInteger index = [(ViewController *)viewController indexNumber];
    
    NSUInteger index = [self currentIndex];
    
    
    index++;
         [self updatePageIndex];
    if (index == photosControllers.count) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
    
}

-(NSInteger )currentIndex{
    
    NSUInteger currentIndex = [photosControllers indexOfObject:[self.viewControllers lastObject]];
    if((int)currentIndex < 0 || currentIndex > photosControllers.count){
        return 0;
    }
    
    return currentIndex;
}


- (UIViewController *)viewControllerAtIndex:(NSUInteger)index {
    UIViewController *childViewController = [photosControllers objectAtIndex:index];
    
    
    return childViewController;
    
}

//TODO: show these methods to show paginationdots view
//TODO: hide these methods to hide paginationdots view

//- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
//    return photosControllers.count;
//}
//
//- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
//    return 0;
//}



@end

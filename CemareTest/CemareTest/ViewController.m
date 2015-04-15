//
//  ViewController.m
//  CemareTest
//
//  Created by ChrisFan on 15/1/6.
//  Copyright (c) 2015年 yisucn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIImageView *_bgView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"第二页";
    
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(cameraAction)];
}
-(void)cameraAction
{
     UIImagePickerController *picker=[[UIImagePickerController alloc]init];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
         picker.sourceType=UIImagePickerControllerSourceTypeCamera;
    }
    else
    {
         picker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    }
    picker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    picker.allowsEditing=YES;
    picker.delegate=self;
    [self presentViewController:picker animated:YES completion:nil];
    
    
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image=nil;
    if (picker.sourceType==UIImagePickerControllerSourceTypePhotoLibrary) {
        image=[info objectForKey:@"UIImagePickerControllerOriginalImage"];
        
        
    }
    else if(picker.sourceType==UIImagePickerControllerSourceTypeCamera)
    {
        image=[info objectForKey:@"UIImagePickerControllerOriginalImage"];
        
       
    }
    _bgView=[[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 50)];
    _bgView.image=[self imageWithImageSimple:image scaledToSize:CGSizeMake(100, 50)];
   
    [self.view addSubview:_bgView];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    //[picker dismissViewControllerAnimated:YES completion:nil];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

//压缩图片
-(UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    // Tell the old image to draw in this newcontext, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    // End the context
    UIGraphicsEndImageContext();
    // Return the new image.
    return newImage;
}




@end

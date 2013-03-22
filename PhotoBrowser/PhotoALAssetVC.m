//
//  PhotoALAssetVC.m
//  PhotoBrowser
//
//  Created by Daniela on 3/21/13.
//  Copyright (c) 2013 Pyrogusto. All rights reserved.
//

#import "PhotoALAssetVC.h"

@interface PhotoALAssetVC ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation PhotoALAssetVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%@",self.asset);
    if([self.asset valueForProperty:ALAssetPropertyType] ==  ALAssetTypePhoto){
        ALAssetRepresentation *assetRepresentation = [self.asset defaultRepresentation];
        self.imageView.image  = [UIImage imageWithCGImage:[assetRepresentation fullScreenImage] scale:[assetRepresentation scale] orientation:(UIImageOrientation)[assetRepresentation orientation]];
        NSLog(@"photo meta data:%@", assetRepresentation.metadata);
    }
}


@end

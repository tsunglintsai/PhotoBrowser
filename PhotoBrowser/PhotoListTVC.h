//
//  PhotoListTVC.h
//  PhotoBrowser
//
//  Created by Daniela on 3/21/13.
//  Copyright (c) 2013 Pyrogusto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface PhotoListTVC : UITableViewController
@property (strong,nonatomic) ALAssetsGroup *group;
@end

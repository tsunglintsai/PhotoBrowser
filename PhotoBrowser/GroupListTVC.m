//
//  GroupListTVC.m
//  PhotoBrowser
//
//  Created by Daniela on 3/21/13.
//  Copyright (c) 2013 Pyrogusto. All rights reserved.
//

#import "GroupListTVC.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "PhotoListTVC.h"

@interface GroupListTVC ()
@property (strong,nonatomic) ALAssetsLibrary *assetsLibrary;
@property (strong,nonatomic) NSMutableArray *groups; //
@end

@implementation GroupListTVC


- (void)viewDidLoad
{
    [super viewDidLoad];

    /*
     ALAssetsGroupLibrary
     ALAssetsGroupAlbum
     ALAssetsGroupEvent
     ALAssetsGroupFaces
     ALAssetsGroupSavedPhotos
     ALAssetsGroupPhotoStream
     ALAssetsGroupAll
     */
    //NSUInteger groupTypes = ALAssetsGroupAlbum | ALAssetsGroupEvent | ALAssetsGroupFaces | ALAssetsGroupSavedPhotos;
    //NSUInteger groupTypes = ALAssetsGroupAll;
    NSUInteger groupTypes = ALAssetsGroupAll;
    [self.assetsLibrary enumerateGroupsWithTypes:groupTypes usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        if(group){
            [self.groups addObject:group];
            [self.tableView reloadData];
        }
    } failureBlock:nil];
    
    
}

- (NSMutableArray*)groups{
    if(!_groups){
        _groups = [[NSMutableArray alloc]init];
    }
    return _groups;
}

- (ALAssetsLibrary*)assetsLibrary{
    if(!_assetsLibrary){
        _assetsLibrary = [[ALAssetsLibrary alloc]init];
    }
    return _assetsLibrary;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.groups count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"GroupCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    ALAssetsGroup *group = self.groups[indexPath.row];
    
    CGImageRef posterImageRef = [group posterImage];
    UIImage *posterImage = [UIImage imageWithCGImage:posterImageRef];
    cell.imageView.image = posterImage;
    cell.textLabel.text = [group description];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%i items", [group numberOfAssets]];
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"prepareForSegue");
    if([segue.identifier isEqualToString:@"ShowGroupContent"]){
         PhotoListTVC *newController = segue.destinationViewController;
        newController.group = self.groups[[self.tableView indexPathForCell:sender].row];
    }
}

@end

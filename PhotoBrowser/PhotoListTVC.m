//
//  PhotoListTVC.m
//  PhotoBrowser
//
//  Created by Daniela on 3/21/13.
//  Copyright (c) 2013 Pyrogusto. All rights reserved.
//

#import "PhotoListTVC.h"
#import "ALAssetVC.h"

@interface PhotoListTVC ()
@property (strong,nonatomic) NSMutableArray *contentList; // list of ALAsset
@end

@implementation PhotoListTVC

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
        if (result) {
            [self.contentList addObject:result];
        }
    }];
    
}

- (NSMutableArray*) contentList{
    if(!_contentList){
        _contentList = [[NSMutableArray alloc]init];
    }
    return  _contentList;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.contentList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ALAsset *asset = self.contentList[indexPath.row];
    static NSString *CellIdentifier;
    
    if([asset valueForProperty:ALAssetPropertyType] == ALAssetTypePhoto){
        CellIdentifier = @"PhotoCell";
    }else if([asset valueForProperty:ALAssetPropertyType] == ALAssetTypeVideo){
        CellIdentifier = @"VideoCell";
    }else{
        CellIdentifier = @"UnKnownCell";
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [asset description];
    cell.detailTextLabel.text = [asset valueForProperty:ALAssetPropertyType];
    CGImageRef thumbnailImageRef = [asset thumbnail];
    UIImage *image = [UIImage imageWithCGImage:thumbnailImageRef];
    cell.imageView.image = image;

    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"showVideoContent"] || [segue.identifier isEqualToString:@"showPhotoContent"]){
        NSLog(@"test");
        ALAssetVC *assetVC = segue.destinationViewController;
        assetVC.asset = self.contentList[[self.tableView indexPathForCell:sender].row];
    }
}

@end

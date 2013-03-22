//
//  VideoALAssetVC.m
//  PhotoBrowser
//
//  Created by Daniela on 3/21/13.
//  Copyright (c) 2013 Pyrogusto. All rights reserved.
//

#import "VideoALAssetVC.h"
#import "MediaPlayer/MediaPlayer.h"

@interface VideoALAssetVC ()
@property (strong, nonatomic) MPMoviePlayerController *moviePlayerController;
@end

@implementation VideoALAssetVC

- (void)viewDidLoad{
    [super viewDidLoad];
    NSLog(@"video detail view will appear");

    ALAssetRepresentation *assetRepresentation = [self.asset defaultRepresentation];
    NSLog(@"vidoe's meta data:%@", assetRepresentation.metadata);
    /*
    Byte *buffer = (Byte*)malloc(assetRepresentation.size);
    NSUInteger buffered = [assetRepresentation getBytes:buffer fromOffset:0.0 length:assetRepresentation.size error:nil];
    NSData *data = [NSData dataWithBytesNoCopy:buffer length:buffered freeWhenDone:YES];
    */
    /*
    NSString *url = [[NSBundle mainBundle] pathForResource:self.videoFileName ofType:@"mp4"];
    self.moviePlayerController = [[MPMoviePlayerController alloc]initWithContentURL:[NSURL fileURLWithPath:url]];
    self.moviePlayerController.view.frame = CGRectMake(0, 0, 320, 180);
    [self.view addSubview:self.moviePlayerController.view];
    [self.moviePlayerController play];
    self.videoTitleLabel.text = self.videoTitle;
    self.videoDescriptionTextView.text = self.videoDescription;
     */

    /*
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"myMove.mp4"];
    
    [data writeToFile:path atomically:YES];
    NSURL *moveUrl = [NSURL fileURLWithPath:path];
     */
    
    float ratio = self.view.bounds.size.width / 320;
    
    self.moviePlayerController = [[MPMoviePlayerController alloc]initWithContentURL:assetRepresentation.url];
    self.moviePlayerController.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, 180*ratio);
    [self.view addSubview:self.moviePlayerController.view];
    [self.moviePlayerController play];
    
    
}

@end

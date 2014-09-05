//
//  ASDetailViewController.m
//  AnimalSounds
//
//  Created by Tim Novikoff on 9/21/13.
//  Copyright (c) 2013 Tim Novikoff. All rights reserved.
//

#import "ASDetailViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ASDetailViewController ()
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) NSString *theQueryString;
@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) MPMoviePlayerController *moviePlayer;
@end

@implementation ASDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id) initWithQueryString: (NSString *) queryString{
    self = [super init];
    if (self) {
        self.theQueryString = queryString;
    }
    return self;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    
    NSString *urlString = @"https://www.google.com/#q=";
    urlString = [urlString stringByAppendingString:self.theQueryString];
    
    if ([self.theQueryString isEqualToString:@"fox"]) {
        urlString = @"http://www.youtube.com/watch?v=jofNR_WkoCE";
    }
    
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:url];
    [self.webView loadRequest:urlRequest];
}
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(playMovieOnTimer:) userInfo:nil repeats:NO];
//}
//
//- (void) playMovieOnTimer: (NSTimer *) theTimer{
//    
//    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
//                                         pathForResource:@"fox2" ofType:@"mov"]];
//    
//    self.moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:url];
//    
//    self.moviePlayer.controlStyle = MPMovieControlStyleDefault;
//    self.moviePlayer.shouldAutoplay = NO;
//    [self.view addSubview:self.moviePlayer.view];
//    [self.moviePlayer setFullscreen:YES animated:YES];
//    
//}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

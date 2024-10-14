//
//  ViewController.m
//  tmdb-ios
//
//  Created by Ivan Almada on 10/12/24.
//

#import "ViewController.h"
#import "IDNetworkClient.h"
#import "IDTVShow.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray<IDTVShow *> * _Nullable shows;

@end

@implementation ViewController

#pragma mark - UIViewController
- (void)viewDidLoad {
    [super viewDidLoad];

    self.shows = @[].mutableCopy;

    [self request];
}

#pragma mark - Helpers
- (void)request {
    [[IDNetworkClient sharedInstance] fetchPopularTVShowsWithCompletion:^(NSArray<IDTVShow *> * _Nullable shows, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching shows: %@", error.localizedDescription);
        } else {
            self.shows = shows;
            NSLog(@"shows: %@", self.shows);
        }
    }];
}

@end

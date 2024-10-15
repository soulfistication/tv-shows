//
//  IDLoginViewController.m
//  tmdb-ios
//
//  Created by Ivan Almada on 10/14/24.
//

#import "IDLoginViewController.h"
#import "UIView+Gradient.h"

@interface IDLoginViewController ()

@property (weak, nonatomic) IBOutlet UIView *gradientView;

@end

@implementation IDLoginViewController

#pragma mark - UIViewController
- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupHeroView];
}

#pragma mark - Helpers
- (void)setupHeroView {
    [self.gradientView addBlackGradientToView];
}

@end

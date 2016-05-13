//
//  STLViewController.m
//  Styley
//
//  Created by Pim Coumans on 05/14/2016.
//  Copyright (c) 2016 Pim Coumans. All rights reserved.
//

#import "STLViewController.h"
@import Styley;

@interface STLViewController ()

@end

@implementation STLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSDictionary *styles = @{@0 : @{NSFontAttributeName: [UIFont boldSystemFontOfSize:35]},
                                                 @1 : @{NSForegroundColorAttributeName: [UIColor redColor],
                                                        NSUnderlineStyleAttributeName: @0x02}};
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:@"This is a [0](quick) [1](test)" styles:styles];
    
    UILabel *label = [[UILabel alloc] init];
    label.attributedText = string;
    label.frame = CGRectMake(20, 100, CGRectGetWidth(self.view.bounds) - 40, CGRectGetHeight(self.view.bounds) - 200);
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

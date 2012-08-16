//
//  TableViewControllerWithLoader.m
//
//  Created by Jonas Hagstedt on 25/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TableViewControllerWithLoader.h"

@interface TableViewControllerWithLoader ()
@property (nonatomic, strong) UIActivityIndicatorView* loader;
@property (nonatomic, strong) UIImageView *loaderBackgroundView;
- (void)centerLoader;
@end

@implementation TableViewControllerWithLoader

@synthesize loader;
@synthesize loaderBackgroundView;

- (void)showLoader {
	if (self.loader == nil) {
		self.loader = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
		self.loaderBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loader_background"]];
		[self.view addSubview:self.loaderBackgroundView];
		self.loader.frame = CGRectMake(self.loaderBackgroundView.center.x - (self.loader.frame.size.width / 2), 
									   self.loaderBackgroundView.center.y - (self.loader.frame.size.height / 2), 
									   self.loader.frame.size.width, 
									   self.loader.frame.size.height);
		[self.loaderBackgroundView addSubview:self.loader];
	}
	[self centerLoader];
	[self.view bringSubviewToFront:self.loaderBackgroundView];
	self.loaderBackgroundView.hidden = NO;
	[self.loader startAnimating];
	[self.view setUserInteractionEnabled:NO];
}

- (void)hideLoader {
	[self.view setUserInteractionEnabled:YES];
	[self.loader stopAnimating];
	self.loaderBackgroundView.hidden = YES;
}

- (void)centerLoader {
	self.loaderBackgroundView.frame = CGRectMake(self.view.center.x - (self.loaderBackgroundView.frame.size.width / 2), 
												 self.view.center.y - (self.loaderBackgroundView.frame.size.height / 2), 
												 self.loaderBackgroundView.frame.size.width, 
												 self.loaderBackgroundView.frame.size.height);
	
}


@end

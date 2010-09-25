//
//  CreateRequestViewController.m
//  HackTO
//
//  Created by Jason Emery on 10-09-24.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CreateRequestViewController.h"
#import "ASIHTTPRequestWrapper.h"


@implementation CreateRequestViewController

- (id)init
{
	if (self = [super initWithNibName:@"CreateRequestView" bundle:nil]) {
		//
	}
	return self;
}






#pragma mark -
#pragma mark IBActions

- (IBAction)tappedLogin
{
	NSLog(@"tappedLogin");
	[ASIHTTPRequestWrapper createRequest];
}

- (void)dealloc {
    [super dealloc];
}


@end

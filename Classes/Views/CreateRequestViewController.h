//
//  CreateRequestViewController.h
//  HackTO
//
//  Created by Jason Emery on 10-09-24.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MGTwitterEngine;

@interface CreateRequestViewController : UIViewController {
	MGTwitterEngine *twitterEngine;
}

- (IBAction)tappedLogin;
- (IBAction)sendTweet:(id)sender;

@end

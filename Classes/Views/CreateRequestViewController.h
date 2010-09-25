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
<<<<<<< HEAD
	MGTwitterEngine *twitterEngine;
=======

	NSMutableDictionary *finalDictionary;
>>>>>>> 84b495f5d4c245926df378b0b7670192574706e5
}

- (IBAction)tappedLogin;
- (IBAction)sendTweet:(id)sender;

@end

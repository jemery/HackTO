//
//  ASIHTTPRequestWrapper.h
//  HackTO
//
//  Created by Jason Emery on 10-09-24.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASIHTTPRequestDelegate.h"

@interface ASIHTTPRequestWrapper : NSObject <ASIHTTPRequestDelegate> {

}

+ (void)createRequest;

@end

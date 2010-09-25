//
//  ASIHTTPRequestWrapper.m
//  HackTO
//
//  Created by Jason Emery on 10-09-24.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ASIHTTPRequestWrapper.h"

// ASIHTTPRequest lib includes
#import "ASIHTTPRequest.h"


#define TRUSTED_HOSTS_ARRAY [NSArray arrayWithObjects:		\
@"graupel.oanda.com", nil]


@implementation ASIHTTPRequestWrapper

+ (void)createRequest
{
	NSLog(@"createRequest");
	//NSURL *url = [NSURL URLWithString:@"https://graupel.oanda.com/v1/user/login.json?api_key=12345&username=jemery&password=foobar"];
	NSURL *url = [NSURL URLWithString:@"https://fxgame-webapi.oanda.com/v1/user/login.json?api_key=0325ee6232373738&username=jemery&password=foobar"];
	ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
	[request setDelegate:self];
	[request startAsynchronous];
}

+ (void)requestFinished:(ASIHTTPRequest *)request
{
	// Use when fetching text data
	NSString *responseString = [request responseString];
	NSLog(@"response: %@", responseString);
}

+ (void)requestFailed:(ASIHTTPRequest *)request
{
	NSError *error = [request error];
	NSLog(@"error: %@", error);
}


#pragma mark -
#pragma mark Connection delegate

+ (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
	NSLog(@"challenge.protectionSpace.host %@", challenge.protectionSpace.host);
	if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust])
	{
		NSArray *trustedHosts = TRUSTED_HOSTS_ARRAY;
		if ([trustedHosts containsObject:challenge.protectionSpace.host]) {
			[challenge.sender useCredential:[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust] forAuthenticationChallenge:challenge];
		}
	}
	[challenge.sender continueWithoutCredentialForAuthenticationChallenge:challenge];
}

+ (BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)space
{
	if([[space authenticationMethod] isEqualToString:NSURLAuthenticationMethodServerTrust]) {
		BOOL shouldAllowSelfSignedCert = YES;
		if(shouldAllowSelfSignedCert) {
			return YES; // Self-signed cert will be accepted
		} else {
			return NO;  // Self-signed cert will be rejected
		}
		// Note: it doesn't seem to matter what you return for a proper SSL cert
		//       only self-signed certs
	}
	// If no other authentication is required, return NO for everything else
	// Otherwise maybe YES for NSURLAuthenticationMethodDefault and etc.
	return NO;
}

@end

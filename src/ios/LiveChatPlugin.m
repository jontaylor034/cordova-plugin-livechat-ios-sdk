/*
 * This file contains Original Code and/or Modifications of Original Code
 * as defined in and that are subject to the Apache License
 * Version 2.0 (the 'License'). You may not use this file except in
 * compliance with the License. Please obtain a copy of the License at
 * http://opensource.org/licenses/Apache-2.0/ and read it before using this
 * file.
 *
 * The Original Code and all software distributed under the License are
 * distributed on an 'AS IS' basis, WITHOUT WARRANTY OF ANY KIND, EITHER
 * EXPRESS OR IMPLIED, AND APPLE HEREBY DISCLAIMS ALL SUCH WARRANTIES,
 * INCLUDING WITHOUT LIMITATION, ANY WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE, QUIET ENJOYMENT OR NON-INFRINGEMENT.
 * Please see the License for the specific language governing rights and
 * limitations under the License.
 */

#import "Act_Support-Bridging-Header.h"
#import "LiveChatPlugin.h"
#import <Cordova/CDVPlugin.h>
#import "Swift2Objc-Header.h"

@implementation LiveChatPlugin

- (void)livechat:(CDVInvokedUrlCommand *)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* license = LiveChat.licenseId;

	if(license != nil && [license length] > 0){
		[LiveChat presentChatWithAnimated:YES completion:nil];
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
	} else {
	
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

	}
}

-(void)init:(CDVInvokedUrlCommand *)command
{
    CDVPluginResult* pluginResult = nil;
	NSString* license = [command.arguments objectAtIndex:0];
	NSString* group = [command.arguments objectAtIndex:1];
	NSString* account = [command.arguments objectAtIndex:2];
	NSString* name = [command.arguments objectAtIndex:3];
	NSString* accountKey = @"Account";

	LiveChat.licenseId = license;
	LiveChat.groupId = group;

	if (name != nil && [name length] > 0){
		LiveChat.name = name;
	}

	[LiveChat setVariableWithKey:accountKey value:account];

	pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}



@end

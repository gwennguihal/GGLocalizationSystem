//
//  GGLocalizationSystem.m
//
//  Created by GWENN GUIHAL on 27/11/13.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "GGLocalizationSystem.h"

@implementation GGLocalizationSystem

//Singleton
static GGLocalizationSystem* _singleton = nil;

+ (GGLocalizationSystem *)sharedLocalSystem
{
    if (nil != _singleton)
    {
        return _singleton;
    }
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        _singleton = [[GGLocalizationSystem alloc] init];
    });
    
    return _singleton;
}


- (id)init
{
    self = [super init];
    if (self)
    {
		_bundle = [NSBundle mainBundle];
	}
    return self;
}

- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)comment
{
	return [_bundle localizedStringForKey:key value:comment table:nil];
}

- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)comment table:(NSString *)tableName
{
    return [_bundle localizedStringForKey:key value:comment table:tableName];
}

- (void) setLanguage:(NSString*) lg
{
	NSString *path = [[ NSBundle mainBundle ] pathForResource:lg ofType:@"lproj" ];
    
	if (path == nil)
    {
		[self resetLocalization];
    }
	else
    {
		_bundle = [NSBundle bundleWithPath:path];
        
        // save
        [[NSUserDefaults standardUserDefaults] setObject: [NSArray arrayWithObjects:lg, nil] forKey:@"AppleLanguages"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        // notif
        [[NSNotificationCenter defaultCenter] postNotificationName:GGLOCALIZATIONSYSTEM_LANGUAGE_DID_CHANGE object:nil];
    }
}

- (NSString*) getLanguage
{
	NSArray* languages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
	NSString *preferredLang = languages[0];
	return preferredLang;
}

- (void) resetLocalization
{
	_bundle = [NSBundle mainBundle];
    // notif
    [[NSNotificationCenter defaultCenter] postNotificationName:GGLOCALIZATIONSYSTEM_LANGUAGE_DID_CHANGE object:nil];
}

-(void) setSecondDefaultLanguage:(NSString*)lg
{
    NSMutableArray* languages = [NSMutableArray arrayWithArray: [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"]];
    languages[1] = lg;
    [[NSUserDefaults standardUserDefaults] setObject: languages forKey:@"AppleLanguages"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end

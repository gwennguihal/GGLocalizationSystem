//
//  GGLocalizationSystem.h
//
//  Created by GWENN GUIHAL on 27/11/13.
//  Inspired by https://github.com/tagyro/AMLocalizedString/
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

#import <Foundation/Foundation.h>

static NSString* GGLOCALIZATIONSYSTEM_LANGUAGE_DID_CHANGE = @"GGLOCALIZATIONSYSTEM_LANGUAGE_DID_CHANGE";

@interface GGLocalizationSystem : NSObject

#define GGLocalizeStringWithComment(key, comment) \
[[GGLocalizationSystem sharedLocalSystem] localizedStringForKey:(key) value:(comment)]

#define GGLocalizeString(key) \
[[GGLocalizationSystem sharedLocalSystem] localizedStringForKey:(key) value:(nil)]

#define GGLocalizeStringForInterfaceWithName(key, interfaceName) \
[[GGLocalizationSystem sharedLocalSystem] localizedStringForKey:(key) value:(nil) table:(interfaceName)]


+ (GGLocalizationSystem *)sharedLocalSystem;

/**
 Localize a string
 You can use the macros instead:
 - GGLocalizeStringWithComment
 - GGLocalizeStringForInterfaceWithName
 - GGLocalizationSystem
 */
- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)comment;
- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)comment table:(NSString *)tableName;
/**
 Set the language
 */
- (void) setLanguage:(NSString*) language;
/**
 Returns the current language
 */
- (NSString*) getLanguage;
/**
 Reset the localization to the default language of the device
 */
- (void) resetLocalization;
/**
 Set the second language, if first not found, use the second
 */
-(void) setSecondDefaultLanguage:(NSString*)lg;

// Bundle linked with the current language
@property (strong,nonatomic,readonly) NSBundle* bundle;

@end

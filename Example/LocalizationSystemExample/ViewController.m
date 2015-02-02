//
//  ViewController.m
//  LocalizationSystemExample
//
//  Created by GWENN GUIHAL on 04/08/2014.
//
//

#import "ViewController.h"
#import "GGLocalizationSystem.h"

@interface ViewController ()

-(void)_didChangeLanguage:(NSNotification*)notif;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // add observer
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_didChangeLanguage:) name:GGLOCALIZATIONSYSTEM_LANGUAGE_DID_CHANGE object:nil];
    // set english language
    [[GGLocalizationSystem sharedLocalSystem] setLanguage:@"en"];
}

-(void)_didChangeLanguage:(NSNotification*)notif
{
    // get current language
    NSLog(@"Current language: %@",[[GGLocalizationSystem sharedLocalSystem] getLanguage]);
    // print hello world
    NSLog( @"%@",GGLocalizeString(@"hello_world") );
    NSLog( @"%@",GGLocalizeStringForInterfaceWithName(@"CKg-nV-n2I.normalTitle", @"Main"));

    _labelOutlet.text = GGLocalizeStringForInterfaceWithName(@"Ihn-UL-YDZ.text", @"Main");
    
    // translate the french button
    NSString *translatedString = GGLocalizeStringForInterfaceWithName(@"CKg-nV-n2I.normalTitle", @"Main");
    [_buttonOutlet setTitle:translatedString forState:UIControlStateNormal];
    
    // translate the english button
    translatedString = GGLocalizeStringForInterfaceWithName(@"ebn-n0-btk.normalTitle", @"Main");
    [_englishButton setTitle:translatedString forState:UIControlStateNormal];

    
    // data
    NSString* path = [[[GGLocalizationSystem sharedLocalSystem] bundle] pathForResource:@"myFile" ofType:@"plist"];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    NSLog(@"dict:%@",dict);
}

- (IBAction)switchLanguage:(id)sender {
    [[GGLocalizationSystem sharedLocalSystem] setLanguage:@"fr"];
    
}
- (IBAction)activateEnglishLanguage:(id)sender {
    [[GGLocalizationSystem sharedLocalSystem] setLanguage:@"en"];
}
@end

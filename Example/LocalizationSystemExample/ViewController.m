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
    // set french language
    [[GGLocalizationSystem sharedLocalSystem] setLanguage:@"fr"];
}

-(void)_didChangeLanguage:(NSNotification*)notif
{
    // get current language
    NSLog(@"Current language: %@",[[GGLocalizationSystem sharedLocalSystem] getLanguage]);
    // print hello world
    NSLog( @"%@",GGLocalizeString(@"hello_world") );
    NSLog( @"%@",GGLocalizeStringForInterfaceWithName(@"CKg-nV-n2I.normalTitle", @"Main") );

    
    // data
    NSString* path = [[[GGLocalizationSystem sharedLocalSystem] bundle] pathForResource:@"myFile" ofType:@"plist"];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    NSLog(@"dict:%@",dict);
}

- (IBAction)switchLanguage:(id)sender {
    [[GGLocalizationSystem sharedLocalSystem] setLanguage:@"en"];
}
@end

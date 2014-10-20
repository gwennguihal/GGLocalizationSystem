//
//  ViewController.h
//  LocalizationSystemExample
//
//  Created by GWENN GUIHAL on 04/08/2014.
//
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)switchLanguage:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *buttonOutlet;
@property (strong, nonatomic) IBOutlet UIButton *englishButton;
@property (strong, nonatomic) IBOutlet UILabel *labelOutlet;
- (IBAction)activateEnglishLanguage:(id)sender;

@end

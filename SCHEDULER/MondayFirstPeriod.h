//
//  MondayFirstPeriod.h
//  SCHEDULER
//
//  Created by 佐々木 on 12/05/09.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MondayFirstPeriod : UIViewController <UITextViewDelegate>

@property (retain, nonatomic) IBOutlet UITextView *textviewContent;

- (IBAction)doneButton:(id)sender;
- (void)saveTextView;
- (void)loadTextView;

@end

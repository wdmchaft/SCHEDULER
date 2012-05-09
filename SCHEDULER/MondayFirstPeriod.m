//
//  MondayFirstPeriod.m
//  SCHEDULER
//
//  Created by 佐々木 on 12/05/09.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MondayFirstPeriod.h"

@implementation MondayFirstPeriod
@synthesize textviewContent = _textviewContent;

/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadTextView];
}


- (void)viewDidUnload
{
    [self setTextviewContent:nil];
    [self setTextviewContent:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [_textviewContent release];
    [super dealloc];
}

#pragma mark - TextView Delegate 
- (void)textViewDidBeginEditing:(UITextView *)textView {
    NSLog(@"テキストビューの編集が始まりました");
}

#pragma mark - TextView Method
- (IBAction)doneButton:(id)sender {
    [self saveTextView]; //内容の保存
    //[_textviewContent resignFirstResponder]; //ファーストレスポンダーを止める
}

//テキストビューの内容の保存
- (void)saveTextView {
    /*** 文字列ファイルを用いてデータを保存する方法 ***/
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"mondayTextView.strings"];
    NSString *contentStrings = [NSString string];
    contentStrings = _textviewContent.text;
    //データの保存
    if (filePath) {
        NSLog(@"データの保存を行ないます");
        [contentStrings writeToFile: filePath                 // (NSString *) ファイルパス
                         atomically: YES                      // (BOOL) 予備ファイルを生成
                           encoding: NSUnicodeStringEncoding  // (NSStringEncoding) 文字コード
                              error: NULL];                   // (NSError **) エラー
    }
}

//テキストビューの内容のロード
- (void)loadTextView {
    /*** 文字列ファイルを用いてデータロードする方法 ***/
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"mondayTextView.strings"];
    NSString *contentStrings = [NSString string];
    if (filePath) {
        contentStrings = [NSString stringWithContentsOfFile:filePath encoding:NSUnicodeStringEncoding error:NULL];
        _textviewContent.text = contentStrings;
    }

}
@end

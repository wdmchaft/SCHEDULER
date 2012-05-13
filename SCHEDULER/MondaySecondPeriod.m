//
//  MondaySecondPeriod.m
//  SCHEDULER
//
//  Created by 佐々木 on 12/05/09.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MondaySecondPeriod.h"

@implementation MondaySecondPeriod
@synthesize doneButton = _doneButton;
@synthesize mondayTextView = _mondayTextView;

/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    NSLog(@"月曜日2限目");
    return self;
}
*/

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
    [self setMondayTextView:nil];
    [self setDoneButton:nil];
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
    [_mondayTextView release];
    [_doneButton release];
    [super dealloc];
}

#pragma mark - TextView Delegate

- (void)textViewDidBeginEditing:(UITextView *)textView {
    NSLog(@"テキストビューの編集が始まりました");
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    NSLog(@"テキストビューの編集が終わりました");
    //_doneButton.
    [self saveTextView];
}

//Doneボタンが押された時の動作
- (void)doneButton:(id)sender {
    [self saveTextView];
    //ファーストレスポンダーを止める
    [_mondayTextView resignFirstResponder];
}

//テキストビューのコンテンツの保存
- (void)saveTextView {
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"TuesdayTextView.strings"];
    NSString *contentStrings = [NSString string];
    contentStrings = _mondayTextView.text;
    //データの保存
    if (filePath) {
        NSLog(@"データの保存を行ないます");
        [contentStrings writeToFile:filePath //ファイルパス
                         atomically:YES     //予備ファイルを生成
                           encoding:NSUnicodeStringEncoding //文字コード
                              error:NULL];  //エラー
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"テスト" message:@"保存しました" delegate:self cancelButtonTitle:nil otherButtonTitles:@"完了", nil];
        [alert show];
        [alert release];
    }
}

//テキストビューのコンテンツのロード
- (void)loadTextView {
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"TuesdayTextView.strings"];
    NSString *contentStrings = [NSString string];
    if (filePath) {
        NSLog(@"データのロードを行ないます!!");
        contentStrings = [NSString stringWithContentsOfFile:filePath
                                                   encoding:NSUnicodeStringEncoding 
                                                      error:NULL];
        _mondayTextView.text = contentStrings;
    }
}

@end

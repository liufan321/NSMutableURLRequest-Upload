//
//  ViewController.m
//  UploadExamples
//
//  Created by 刘凡 on 15/1/31.
//  Copyright (c) 2015年 joyios. All rights reserved.
//

#import "ViewController.h"
#import "NSMutableURLRequest+Upload.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSURL *url = [NSURL URLWithString:@"http://localhost/post/upload-m.php"];
    
    NSArray *fileURLs = @[[[NSBundle mainBundle] URLForResource:@"111" withExtension:nil],
                          [[NSBundle mainBundle] URLForResource:@"222" withExtension:nil]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url fileURLs:fileURLs name:@"userfile"];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        id result = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        NSLog(@"%@", result);
    }] resume];
}

@end

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
    [self demo4];
}

#pragma mark - POST Upload Demo
// MARK: - 上传单个文件，并指定保存在服务器的文件名
- (void)demo4 {
    NSURL *url = [NSURL URLWithString:@"http://localhost/post/upload.php"];
    
    NSURL *fileURL = [[NSBundle mainBundle] URLForResource:@"111" withExtension:nil];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url fileURL:fileURL fileName:@"hello.txt" name:@"userfile"];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        id result = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        NSLog(@"%@", result);
    }] resume];
}

// MARK: - 上传单个文件，保存成同名的文件
- (void)demo3 {
    NSURL *url = [NSURL URLWithString:@"http://localhost/post/upload.php"];
    
    NSURL *fileURL = [[NSBundle mainBundle] URLForResource:@"111" withExtension:nil];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url fileURL:fileURL name:@"userfile"];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        id result = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        NSLog(@"%@", result);
    }] resume];
}

// MARK: - 上传多个文件，并指定保存在服务器的文件名
- (void)demo2 {
    NSURL *url = [NSURL URLWithString:@"http://localhost/post/upload-m.php"];
    
    NSArray *fileURLs = @[[[NSBundle mainBundle] URLForResource:@"111" withExtension:nil],
                          [[NSBundle mainBundle] URLForResource:@"222" withExtension:nil]];
    NSArray *fileNames = @[@"abc.txt", @"bcd.txt"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url fileURLs:fileURLs fileNames:fileNames name:@"userfile"];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        id result = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        NSLog(@"%@", result);
    }] resume];
}

// MARK: - 上传多个文件，保存成同名的文件
- (void)demo1 {
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

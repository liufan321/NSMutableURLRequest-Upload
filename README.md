# NSMutableURLRequest-Upload


针对文件上传的 NSMutableURLRequest 分类


## 使用

－ 添加分类文件

将 `UploadRequest` 目录直接拖动到项目中 

－ 导入分类头文件

```
#import "NSMutableURLRequest+Upload.h"
```
－ 上传单个文件的请求

```
    NSURL *fileURL = [[NSBundle mainBundle] URLForResource:@"local.txt" withExtension:nil];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url fileURL:fileURL fileName:@"remote.txt" name:@"userfile"];
```

－ 上传多个文件的请求

```
    NSArray *fileURLs = @[[[NSBundle mainBundle] URLForResource:@"local1.txt" withExtension:nil],
                          [[NSBundle mainBundle] URLForResource:@"local2.txt" withExtension:nil]];
    NSArray *fileNames = @[@"remote1.txt", @"remote2.txt"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url fileURLs:fileURLs fileNames:fileNames name:@"userfile"];
```


## multipart/form-data POST 上传请求数据体格式

### 上传单个文件

```
\r\n--boundary\r\n
Content-Disposition: form-data; name="userfile"; filename="filename"\r\n 
Content-Type: application/octet-stream\r\n\r\n 
// 上传文件的二进制数据
\r\n
--boundary--\r\n
```

#### 参数说明

- boundary: 有字母和数字组成的随机字符串
- **userfile**: 服务器脚本中负责上传文件的字段名
- filename: 保存在服务器上的文件名

### 上传多个文件

```
\r\n--boundary\r\n
Content-Disposition: form-data; name="userfile[]"; filename="filename1"\r\n 
Content-Type: application/octet-stream\r\n\r\n 
// 第一个上传文件的二进制数据
\r\n
\r\n--boundary\r\n
Content-Disposition: form-data; name="userfile[]"; filename="filename2"\r\n 
Content-Type: application/octet-stream\r\n\r\n 
// 第一个上传文件的二进制数据
\r\n
--boundary--\r\n
```

#### 参数说明

- boundary: 有字母和数字组成的随机字符串
- **userfile[]**: 服务器脚本中负责上传文件的字段名
- filename: 保存在服务器上的文件名

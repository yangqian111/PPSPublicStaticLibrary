# PPSPublicStaticLibrary
介绍使用pod创建自己的静态库，并且上传到pod公共库，共享源代码

### 准备工作

首先，我们到GitHub创建一个仓库，用来作我们的共享仓库

然后clone到本地，这里我创建的是一个叫做PPSPublicStaticLibrary的仓库，并且我已经clone到本地

### 创建工程

和我们之前创建静态仓库一样，通过pod官方提供的模板创建一个静态仓库，单独建一个文件夹，将这个静态仓库先放在这个文件夹中

具体怎么创建，我就不讲了，可以看我之前的创建私有仓库的那篇文章，使用命令创建

```
pod lib create 
```

工程创建好之后，工程目录是这样的

![](http://o8bxt3lx0.bkt.clouddn.com/ppsheep/ib191.jpg)

接下来，我们将工程中的一些文件拷贝到我们之前clone下来的文件夹内

![](http://o8bxt3lx0.bkt.clouddn.com/ppsheep/1fdy8.jpg)

将选中的文件拷贝到我们clone下来的PPSPublicStaticLibrary文件夹

### podspec

同样的我们还是编写podspec文件，首先我们先将example工程install一下，这个通过Pod install一下，我就不详细讲了

```
Pod::Spec.new do |s|
  s.name             = 'PPSPublicStaticLibrary'
  s.version          = '0.1.0'
  s.summary          = 'A example to show how to create a public static library'

  s.description      = <<-DESC
演示了如何来创建一个pod共享库，并且上传到pod公共仓库上，这个仓库没有其他什么代码，完全作演示使用.
Demonstrates how to create a pod shared library and upload it to the pod public repository, which does not have any other code to be used for demonstration purposes.
                       DESC

  s.homepage         = 'https://github.com/yangqian111/PPSPublicStaticLibrary'

  s.license          = { :type => 'MIT', :file => 'LICENSE' }

  s.author           = { 'ppsheep' => 'ppsheep.qian@gmail.com' }

  s.source           = { :git => 'https://github.com/yangqian111/PPSPublicStaticLibrary.git', :tag => s.version.to_s }


  s.ios.deployment_target = '8.0'

  s.source_files = 'PPSPublicStaticLibrary/Classes/**/*'

  s.public_header_files = 'PPSPublicStaticLibrary/Classes/**/*.h'

end

```

上面是podspec文件，接下来，我们同样来创建一个测试的文件，方法，在classes下，新建一个cocoa，PPSPublicTest

![](http://o8bxt3lx0.bkt.clouddn.com/ppsheep/dbmhm.jpg)

然后，我们先在测试工程中，测试一下，工程是否能够跑通，修改了pod文件，不要忘了install一下

```objc
#import <PPSPublicStaticLibrary/PPSPublicTest.h>

@implementation PPSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    PPSPublicTest *test = [[PPSPublicTest alloc] init];
    [test publicTest];
    return YES;
}

@end

```
经测试，能够正确运行，接下来，我们就需要提交代码了

提交代码之前，我们需要做几件事，首先使用pod lib lint 检查一下当前的库是否有错误，进入到工程目录

```
pod lib lint

```

![](http://o8bxt3lx0.bkt.clouddn.com/ppsheep/a59er.jpg)

接下来，将代码push到我们的git仓库

```
git commit -m "init message"
git push

```

还需要对当前的静态库打一个tag，相当于release一个版本吧

![](http://o8bxt3lx0.bkt.clouddn.com/ppsheep/5elyj.jpg)

我们打了一个0.1.0的tag

这样，我们就将本地需要做的工作做完了，


然后将我们的tag push到仓库

```
git push --tag
```

这样，我们已经能够在我们的仓库中看到我们的代码，和创建的tag

### 提交到pod仓库

##### 注册pod账号

如果之前没有提交过pod仓库，那么需要注册一个账号

```
pod trunk register 邮箱地址 '用户名' --verbose
```

在邮箱中，会收到一封邮件，激活，然后回到我们的命令行

```
pod trunk me
```

就能够看到我们的详细信息

![](http://o8bxt3lx0.bkt.clouddn.com/ppsheep/6gt97.jpg)

然后我们执行

```
pod trunk push PPSPublicStaticLibrary.podspec
```

![](http://o8bxt3lx0.bkt.clouddn.com/ppsheep/6ssps.jpg)

这样，我们的PPSPublicStaticLibrary就已经发布成功了

我们去搜索一下试试看


![](http://o8bxt3lx0.bkt.clouddn.com/ppsheep/2ycf5.jpg)

能够搜到，成功

在其他工程中，集成通过

```
pod 'PPSPublicStaticLibrary', '~> 0.1.0'
```
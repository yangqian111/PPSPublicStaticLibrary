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

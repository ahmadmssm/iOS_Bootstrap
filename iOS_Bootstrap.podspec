#
# Be sure to run `pod lib lint iOS_Bootstrap.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'iOS_Bootstrap'
    s.version          = '0.2.6'
    s.summary          = 'iOS Bootstrap library'
    
    # This description is used to generate tags and improve search results.
    #   * Think: What does it do? Why did you write it? What is the focus?
    #   * Try to keep it short, snappy and to the point.
    #   * Write the description between the DESC delimiters below.
    #   * Finally, don't worry about the indent, CocoaPods strips it!
    
    s.description      = <<-DESC
    TODO: Add long description of the pod here.
    DESC
    
    s.homepage         = 'https://github.com/ahmadmssm/iOS_Bootstrap'
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Ahmad Mahmoud Saleh' => 'ams.eng@hotmail.com' }
    s.source           = { :git => 'https://github.com/ahmadmssm/iOS_Bootstrap.git', :tag => s.version.to_s }
    
    s.ios.deployment_target = '9.1'
    s.swift_version = '3.2'
    s.source_files = 'iOS_Bootstrap/Classes/**/*'
    

    # s.static_framework = true
    # s.resource_bundles = {
    #   'iOS_Bootstrap' => ['iOS_Bootstrap/Assets/*.png']
    # }
    
    # s.public_header_files = 'Pod/Classes/**/*.h'
    
    # s.pod_target_xcconfig = { 'SWIFT_WHOLE_MODULE_OPTIMIZATION' => 'YES',
    # 'APPLICATION_EXTENSION_API_ONLY' => 'YES', 'DEFINES_MODULE' => 'YES' }
    
    s.dependency 'Moya/RxSwift', '~> 11.0'
    s.dependency 'RxSwift'
    s.dependency 'HandyJSON', '~> 4.1.1'
    # s.dependency 'ActionSheetPicker-3.0', '~> 2.3.0'
    
    s.frameworks = 'Foundation'
    
end



#
#  Be sure to run `pod spec lint CZTagButtons.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  
  s.name         = "CZTagButtons"
  s.version      = "1.0.2"
  s.summary      = "One line of code to realize irregular button label sorting."
  s.ios.deployment_target = '7.0'


  s.homepage     = "https://github.com/Czing/CZTagButtons"

  s.license            = { :type => "MIT", :file => "LICENSE" }
    s.author       = { "cyz123" => "1009351323@qq.com" }
  s.source       = { :git => "https://github.com/Czing/CZTagButtons.git", :tag => "#{s.version}" }


  s.source_files  = "CZTagButtons/*.{h,m}"
 

    s.requires_arc = true


end

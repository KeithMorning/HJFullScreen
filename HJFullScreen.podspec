#
# Be sure to run `pod lib lint HJFullScreen.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HJFullScreen'
  s.version          = '0.1.0'
  s.summary          = 'HJFullScreen use a container view make a fullscreen action, write by swift'

  s.description      = <<-DESC
It is use a container view to make fullscreen easy to use. You can cusom a show viewcontroller make its support interface Orientation, add the view will be fullscreen in the container, then present it.
                       DESC

  s.homepage         = 'https://github.com/keithmorning/HJFullScreen'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'keithmorning' => 'keith.objc@gmail.com' }
  s.source           = { :git => 'https://github.com/keithmorning/HJFullScreen.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'

  s.source_files = 'HJFullScreen/Classes/**/*'
  
end

Pod::Spec.new do |s|
  s.name             = 'YMLogoAlert'
  s.version          = '0.1.0'
  s.summary          = 'A simple alert with logo image and color.'
  s.description      = <<-DESC

It is a simple alert library with smooth animation, color, and even an image if desired.
                       DESC

  s.homepage         = 'https://github.com/Youngminah/YMLogoAlert'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Youngminah' => 'bluebelsmudi@gmail.com' }
  s.source           = { :git => 'https://github.com/Youngminah/YMLogoAlert.git', :tag => s.version.to_s }
  s.swift_version = "5.0"
  s.ios.deployment_target = '13.0'
  s.source_files = 'YMLogoAlert/Classes/**/*'
  s.frameworks = 'UIKit'
end

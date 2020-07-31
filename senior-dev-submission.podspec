Pod::Spec.new do |s|
  s.name             = 'senior-dev-submission'
  s.version          = '0.1.0'
  s.summary          = 'A coding challenge for prospective Senior iOS Developers at GigabiteLabs.'
  s.description      = <<-DESC
'A coding challenge for prospective Senior iOS Developers at GigabiteLabs.'
                       DESC
                       
# you *may* need to edit these (hint).
# s.resource_bundles = {
#   'senior-dev-submission' => ['senior-dev-submission/Assets/*.png']
# }
# s.frameworks = 'UIKit', 'MapKit'
                       
# do not edit any line below this comment
  s.homepage         = 'https://gigabitelabs.com'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'GigabiteLabs' => 'engineering@gigabitelabs.com' }
  s.source           = { :git => 'https://github.com/GigabiteLabs/senior-dev-submission.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/gigabitelabs'
  s.ios.deployment_target = '13.0'
  s.swift_version = '5.2'
  s.source_files = 'senior-dev-submission/Classes/**/*'
  # s.public_header_files = 'Pod/Classes/**/*.h'
  
# remember, no 3rd party dependencies allowed
  # s.dependency 'AFNetworking', '~> 2.3'
  
  # runs tests when linting the pod
  s.test_spec 'senior-dev-submission_Tests' do |test_spec|
      test_spec.requires_app_host = true
      test_spec.source_files = 'Example/Tests/Sources/*.{swift}'
  end
end

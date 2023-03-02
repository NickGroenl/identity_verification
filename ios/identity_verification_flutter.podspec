#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint identity_verification_flutter.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'identity_verification_flutter'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter plugin project.'
  s.description      = <<-DESC
A new Flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/*.{h,m,swift}'
  s.dependency 'Flutter'
  s.platform = :ios, '11.0'
  s.ios.deployment_target  = '11.0'

  # Flutter.framework does not contain a i386 slice.
  # s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

  # s.preserve_paths = 'libs/IdentityVerification.xcframework', 'libs/Microblink.xcframework', 'libs/FaceTecSDK.xcframework', 'libs/DocumentVerification.xcframework', 'libs/iProov.xcframework', 'libs/Starscream.xcframework', 'libs/SocketIO.xcframework'
  s.xcconfig = { 'OTHER_LDFLAGS' => '-framework IdentityVerification' }
  s.frameworks = 'IdentityVerification'
  s.ios.vendored_frameworks =  'libs/Microblink.xcframework', 'libs/DocumentVerification.xcframework', 'libs/IdentityVerification.xcframework', 'libs/FaceTecSDK.xcframework', 'libs/iProov.xcframework', 'libs/Starscream.xcframework', 'libs/SocketIO.xcframework'
end

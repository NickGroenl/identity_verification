#import "IdentityVerificationFlutterPlugin.h"
#if __has_include(<identity_verification_flutter/identity_verification_flutter-Swift.h>)
#import <identity_verification_flutter/identity_verification_flutter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "identity_verification_flutter-Swift.h"
#endif

@implementation IdentityVerificationFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftIdentityVerificationFlutterPlugin registerWithRegistrar:registrar];
}
@end

import Flutter
import UIKit


public class SwiftIdentityVerificationFlutterPlugin: NSObject, FlutterPlugin, IdvPlatformApi {
    
    private let idv = IdentityVerificationSDK()
    var flutterPluginRegistrar: FlutterPluginRegistrar? = nil
    var idvDartApi: IdvDartApi? = nil
    
    private let resultsEventChannel = "platform_channel_events/results"

    public static func register(with registrar: FlutterPluginRegistrar) {
        let messenger : FlutterBinaryMessenger = registrar.messenger()
        let instance = SwiftIdentityVerificationFlutterPlugin()
        let api : IdvPlatformApi & NSObjectProtocol = instance
        IdvPlatformApiSetup(messenger, api)
    
        instance.flutterPluginRegistrar = registrar
        instance.idvDartApi = IdvDartApi(binaryMessenger: messenger)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    
    }
    
    public func startVerificationIdvConfiguration(_ idvConfiguration: IdvConfiguration, completion: @escaping (NSNumber?, FlutterError?) -> Void) {
        idv.idvDartApi = idvDartApi
        idv.completion = completion
        idv.startIdentityVerification(config: idvConfiguration)
 
    }

    
    public func setupIdentityVerificationCustomizationColorTheme(_ colorTheme: IdvColorTheme?, fontTheme: IdvFontTheme?, imageTheme: IdvImageTheme?, localizationTheme: IdvLocalizationTheme?, viewTheme: IdvViewTheme?, navigationTheme: IdvNavigationTheme?, dateFormatterTheme: IdvDateFormatterTheme?, completion: @escaping (FlutterError?) -> Void) {
        
        //        print("viewTheme \(viewTheme) ,navigationTheme \(navigationTheme)")
        idv.flutterPluginRegistrar = flutterPluginRegistrar

        if let idvColorTheme = colorTheme {
            let _ = try? idv.buildColorTheme(colorsTheme:idvColorTheme)
        }
        
        if let idvFontTheme = fontTheme {
            let _ = try? idv.buildFontTheme(fontTheme: idvFontTheme)
        }
        
        if let idvImageTheme = imageTheme {
            let _ = try? idv.buildImageTheme(imageTheme: idvImageTheme)
        }
        
        if let idvViewTheme = viewTheme {
            let _ = try? idv.buildViewTheme(viewTheme: idvViewTheme)
        }
        
        if let idvNavTheme = navigationTheme {
            let _ = try? idv.buildNavigationTheme(navigationTheme: idvNavTheme)
        }
        
        if let idvDateFormatterTheme = dateFormatterTheme {
            let _ = try? idv.buildDateFormatterTheme(dateFormatterTheme: idvDateFormatterTheme)
        }
        
        if let idvLocalizationTheme = localizationTheme {
            let _ = try? idv.buildLocalizationTheme(localizationTheme: idvLocalizationTheme)
        }
    }
    
}

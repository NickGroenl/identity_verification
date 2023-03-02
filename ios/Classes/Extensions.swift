//
//  Extensions.swift
//  identity_verification_flutter
//
//  Created by Belinda Natividad on 7/26/22.
//

import Foundation

extension IdentityVerificationSDK {
    func loadImage(path:String) -> UIImage {
        let key = flutterPluginRegistrar?.lookupKey(forAsset: path)
        let assetPath = Bundle.main.path(forResource: key, ofType: nil)!
        let assetImage: UIImage = UIImage(contentsOfFile: assetPath)!

        return assetImage
    }
    
    func loadFont(path:String) {
        let key = flutterPluginRegistrar?.lookupKey(forAsset:path)
        if let assetPath = Bundle.main.path(forResource: key, ofType: nil) {
            let fontData = NSData(contentsOfFile:assetPath)
            let dataProvider = CGDataProvider(data: fontData!)
            let fontRef = CGFont(dataProvider!)
            var errorRef: Unmanaged<CFError>? = nil
            if let fr = fontRef {
                CTFontManagerRegisterGraphicsFont(fr, &errorRef)
            }
        } else {
            //TODO: send to user here - path not found
        }
        
    }
}

extension UIColor {
    
    convenience init(hex: String) {
        var hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        if hex.hasPrefix("#") {
            hex = String(hex.dropFirst())
        }
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            alpha: Double(a) / 255
        )
    }
    
    static func setColor(idvColor:IdvColor) -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { (traitCollection: UITraitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .dark {
                    if let d = idvColor.darkModeColor {
                        return UIColor(hex:d)
                    } else {
                        return UIColor(hex:idvColor.color)
                    }
                }
                else {
                    return UIColor(hex:idvColor.color)
                }
            }
        } else {
            return UIColor(hex:idvColor.color)
        }
    }
        
}

extension UIImage {
    static func toByteArray(image:UIImage) -> FlutterStandardTypedData? {
        if let imageData = image.jpegData(compressionQuality: 1.0) {
            return FlutterStandardTypedData(bytes: imageData)
        }
        
        return nil
    }

}

extension String {
    var isNumeric: Bool {
        guard self.count > 0 else { return false }
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        return Set(self).isSubset(of: nums)
    }
}

extension Bool {

    var data:Data {
        var _self = self
        return Data(bytes: &_self, count: MemoryLayout.size(ofValue: self))
    }

    init?(data:NSData) {
        guard data.length == 1 else { return nil }
        var value = false
        data.getBytes(&value, length: MemoryLayout<Bool>.size)
        self = value
    }
}

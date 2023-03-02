//
//  ThemesBuilder.swift
//  identity_verification_flutter
//
//  Created by Belinda Natividad on 7/14/22.
//

import Foundation
import IdentityVerification

extension IdentityVerificationSDK {
    func buildColorTheme(colorsTheme: IdvColorTheme) throws -> MIVColorTheme {

        let idvColorTheme = MIVColorTheme.shared()

        if let c = colorsTheme.primaryColor {
            idvColorTheme.primaryColor = UIColor.setColor(idvColor: c)
        }

        if let c = colorsTheme.stepCaptionColor {
            idvColorTheme.stepCaptionColor = UIColor.setColor(idvColor: c)
        }

        if let c = colorsTheme.stepDisabledColor {
            idvColorTheme.stepDisabledColor = UIColor.setColor(idvColor: c)
        }

        if let c = colorsTheme.successColor {
            idvColorTheme.successColor = UIColor.setColor(idvColor: c)
        }

        if let c = colorsTheme.highlightColor {
            idvColorTheme.highlightColor = UIColor.setColor(idvColor: c)
        }

        if let c = colorsTheme.stepBackgroundSuccessColor {
            idvColorTheme.stepBackgroundSuccessColor = UIColor.setColor(idvColor: c)
        }

        if let c = colorsTheme.errorColor {
            idvColorTheme.errorColor = UIColor.setColor(idvColor: c)
        }

        if let c = colorsTheme.buttonBackgroundEnabledColor {
            idvColorTheme.buttonBackgroundEnabledColor = UIColor.setColor(idvColor: c)
        }

        if let c = colorsTheme.buttonBackgroundDisabledColor {
            idvColorTheme.buttonBackgroundDisabledColor = UIColor.setColor(idvColor: c)
        }

        if let c = colorsTheme.buttonTextDisabledColor {
            idvColorTheme.buttonTextDisabledColor = UIColor.setColor(idvColor: c)
        }

        if let c = colorsTheme.buttonTextEnabledColor {
            idvColorTheme.buttonTextEnabledColor = UIColor.setColor(idvColor: c)
        }

        if let c = colorsTheme.defaultBackgroundColor {
            idvColorTheme.defaultBackgroundColor = UIColor.setColor(idvColor: c)
        }

        if let c = colorsTheme.stepBackgroundColor {
            idvColorTheme.stepBackgroundColor = UIColor.setColor(idvColor: c)
        }

        if let c = colorsTheme.labelColor {
            idvColorTheme.labelColor = UIColor.setColor(idvColor: c)
        }

        if let c = colorsTheme.secondaryLabelColor {
            idvColorTheme.secondaryLabelColor = UIColor.setColor(idvColor: c)
        }

        if let c = colorsTheme.reviewDataEditBannerBackgroundColor {
            idvColorTheme.reviewDataEditBannerBackgroundColor = UIColor.setColor(idvColor: c)
        }

        if let c = colorsTheme.reviewDataEditBannerTextColor {
            idvColorTheme.reviewDataEditBannerTextColor = UIColor.setColor(idvColor: c)
        }

        if let c = colorsTheme.stepLabelColor {
            idvColorTheme.stepLabelColor = UIColor.setColor(idvColor: c)
        }

        if let c = colorsTheme.alertColor {
            idvColorTheme.alertColor = UIColor.setColor(idvColor: c)
        }

        if let c = colorsTheme.needsReviewColor {
            idvColorTheme.needsReviewColor = UIColor.setColor(idvColor: c)
        }

        if let c = colorsTheme.idInstructionsTextColor {
            idvColorTheme.idInstructionsTextColor = UIColor.setColor(idvColor: c)
        }

        if let c = colorsTheme.idFlashlightWarningBackgroundColor {
            idvColorTheme.idFlashlightWarningBackgroundColor = UIColor.setColor(idvColor: c)
        }

        if let c = colorsTheme.idFlashlightWarningTextColor {
            idvColorTheme.idFlashlightWarningTextColor = UIColor.setColor(idvColor: c)
        }

        if let c = colorsTheme.idReticleErrorColor {
            idvColorTheme.idReticleErrorColor = UIColor.setColor(idvColor: c)
        }

        if let c = colorsTheme.faceTecPrimaryColor {
            idvColorTheme.faceTecPrimaryColor = UIColor.setColor(idvColor: c)
        }

        if let c = colorsTheme.faceTecLoadingBarRailColor {
            idvColorTheme.faceTecLoadingBarRailColor = UIColor.setColor(idvColor: c)
        }

        if let c = colorsTheme.faceTecMainTextColor {
            idvColorTheme.faceTecMainTextColor = UIColor.setColor(idvColor: c)
        }

        if let c = colorsTheme.faceTecSubtextColor {
            idvColorTheme.faceTecSubtextColor = UIColor.setColor(idvColor: c)
        }

        if let c = colorsTheme.faceTecButtonTextColor {
            idvColorTheme.faceTecButtonTextColor = UIColor.setColor(idvColor: c)
        }

        if let c = colorsTheme.faceTecOvalColor {
            idvColorTheme.faceTecOvalColor = UIColor.setColor(idvColor: c)
        }

        if let c = colorsTheme.faceTecOvalProgressColor {
            idvColorTheme.faceTecOvalProgressColor = UIColor.setColor(idvColor: c)
        }

        if let c = colorsTheme.faceTecFeedbackBarBackgroundColor {
            idvColorTheme.faceTecFeedbackBarBackgroundColor = UIColor.setColor(idvColor: c)
        }

        if let c = colorsTheme.faceTecFeedbackBarTextColor {
            idvColorTheme.faceTecFeedbackBarTextColor = UIColor.setColor(idvColor: c)
        }

        if let c = colorsTheme.faceTecResultAnimationCheckmarkForegroundColor {
            idvColorTheme.faceTecResultAnimationCheckmarkForegroundColor = UIColor.setColor(idvColor: c)
        }

        if let c = colorsTheme.faceTecMainTextColor {
            idvColorTheme.faceTecMainTextColor = UIColor.setColor(idvColor: c)
        }

        return idvColorTheme
    }

    //ImageTheme
    func buildImageTheme(imageTheme: IdvImageTheme) throws -> MIVImageTheme {

        let idvImageTheme = MIVImageTheme.shared()

        if let i = imageTheme.landingIllustration {
            idvImageTheme.landingIllustration = loadImage(path:i)
        }

        if let i = imageTheme.iconCheckmarkLarge {
            idvImageTheme.iconCheckmarkLarge = loadImage(path:i)
        }

        if let i = imageTheme.iconCrossLarge {
            idvImageTheme.iconCrossLarge = loadImage(path:i)
        }

        if let i = imageTheme.iconCompleteVerificationBackground {
            idvImageTheme.iconCompleteVerificationBackground = loadImage(path:i)
        }

        if let i = imageTheme.iconActionCheckmark {
            idvImageTheme.iconActionCheckmark = loadImage(path:i)
        }

        if let i = imageTheme.iconLock {
            idvImageTheme.iconLock = loadImage(path:i)
        }

        if let i = imageTheme.iconEditField {
            idvImageTheme.iconEditField = loadImage(path:i)
        }

        if let i = imageTheme.editResultsHeaderIcon {
            idvImageTheme.editResultsHeaderIcon = loadImage(path:i)
        }

        if let i = imageTheme.loadingIndicator {
            idvImageTheme.loadingIndicator = loadImage(path:i)
        }

        if let i = imageTheme.idSuccessScanningImage {
            idvImageTheme.idSuccessScanningImage = loadImage(path:i)
        }

        if let i = imageTheme.idFrontCardImage {
            idvImageTheme.idFrontCardImage = loadImage(path:i)
        }

        if let i = imageTheme.idBackCardImage {
            idvImageTheme.idBackCardImage = loadImage(path:i)
        }

        if let i = imageTheme.faceTecCameraPermission {
            idvImageTheme.faceTecCameraPermission = loadImage(path:i)
        }

        if let i = imageTheme.faceTecIdealSelfie {
            idvImageTheme.faceTecIdealSelfie = loadImage(path:i)
        }

        if let i = imageTheme.faceTecProgressSelfieDoneBackground {
            idvImageTheme.faceTecProgressSelfieDoneBackground = loadImage(path:i)
        }

        if let i = imageTheme.faceTecIconClose {
            idvImageTheme.faceTecIconClose = loadImage(path:i)
        }

        return idvImageTheme
    }
    
    // ViewTheme
    func buildViewTheme(viewTheme: IdvViewTheme) throws -> MIVViewTheme {

        let idvViewTheme = MIVViewTheme.shared()

        if let v = viewTheme.faceImageCornerRadius {
            idvViewTheme.faceImageCornerRadius = v.doubleValue
        }

        if let v = viewTheme.buttonCornerRadius {
            idvViewTheme.buttonCornerRadius = v.doubleValue
        }

        if let v = viewTheme.actionViewCornerRadius {
            idvViewTheme.actionViewCornerRadius = v.doubleValue
        }

        if let v = viewTheme.actionStepCornerRadius {
            idvViewTheme.actionStepCornerRadius = v.doubleValue
        }

        if let v = viewTheme.resultsPersonImageCornerRadius {
            idvViewTheme.resultsPersonImageCornerRadius = v.doubleValue
        }

        if let v = viewTheme.stepViewShadowColor {
            idvViewTheme.stepViewShadowColor = UIColor(hex:v)
        }
        
        if let v = viewTheme.stepViewShadowOffset {
            idvViewTheme.stepViewShadowOffset = CGSize(width: v.width?.doubleValue ?? 0, height: v.height?.doubleValue ?? 0)
        }

        if let v = viewTheme.stepViewShadowOpacity {
            idvViewTheme.stepViewShadowOpacity = v.doubleValue
        }

        if let v = viewTheme.stepViewShadowRadius {
            idvViewTheme.stepViewShadowRadius = v.doubleValue
        }

        if let v = viewTheme.buttonHeight {
            idvViewTheme.buttonHeight = v.doubleValue
        }

        if let v = viewTheme.idInstructionsCornerRadius {
            idvViewTheme.idInstructionsCornerRadius = v.doubleValue
        }

        if let v = viewTheme.idFlashlightWarningCornerRadius {
            idvViewTheme.idFlashlightWarningCornerRadius = v.doubleValue
        }

        return idvViewTheme
    }
    
    // NavigationTheme
    func buildNavigationTheme(navigationTheme: IdvNavigationTheme) throws -> MIVNavigationTheme {

        let idvNavTheme = MIVNavigationTheme.shared()
        
//        if let n = navigationTheme.barStyle {
            idvNavTheme.barStyle = navigationTheme.barStyle == .black ? UIBarStyle.black : UIBarStyle.default
//        }
        
        if let n = navigationTheme.isTranslucent {
            idvNavTheme.isTranslucent = n.boolValue
        }
        
        if let n = navigationTheme.hideBarButtonOnSuccessfulVerification {
            idvNavTheme.hideBarButtonOnSuccessfulVerification = n.boolValue
        }
        
        if let n = navigationTheme.barTintColor {
            idvNavTheme.barTintColor = UIColor(hex: n)
        }
        
        if let n = navigationTheme.titleColor {
            idvNavTheme.titleColor = UIColor(hex: n)
        }
        
        if let n = navigationTheme.barButtonItemColor {
            idvNavTheme.barButtonItemColor = UIColor(hex: n)
        }
        
        return idvNavTheme
    
    }
    
    func buildDateFormatterTheme(dateFormatterTheme:IdvDateFormatterTheme) throws -> MIVDateFormatterTheme {
        
        let idvDateFormatterTheme = MIVDateFormatterTheme.shared()
        
        if let d = dateFormatterTheme.customDateFormat {
            idvDateFormatterTheme.customDateFormat = d
        }
            
        return idvDateFormatterTheme
    }
    
    func buildLocalizationTheme(localizationTheme:IdvLocalizationTheme) throws -> MIVLocalizationTheme {
        let theme = MIVLocalizationTheme.shared()
        
        if let l = localizationTheme.localizationFileName {
            theme.localizationFileName = l
        }
        
        if let l = localizationTheme.faceTecLocalizationFileName {
            theme.faceTecLocalizationFileName = l
        }
        
        return theme
    }

    // FontTheme
    func buildFontTheme(fontTheme:IdvFontTheme) throws -> MIVFontTheme {
        
        let idvFontTheme = MIVFontTheme.shared()
        
        //Load font if available
        if let a = fontTheme.fontFamily {
            loadFont(path:a.path)
            idvFontTheme.setupCustomFontFamily(a.path)
        }
        
        if let f = fontTheme.navigationBarTitleFont {
            idvFontTheme.navigationBarTitleFont = buildFont(font:f, fontFamilyName: fontTheme.fontFamily?.name)
        }
        
        if let f = fontTheme.buttonFont {
            idvFontTheme.buttonFont = buildFont(font:f, fontFamilyName: fontTheme.fontFamily?.name)
        }
        
        if let f = fontTheme.dataCaptionFont {
            idvFontTheme.dataCaptionFont = buildFont(font:f, fontFamilyName: fontTheme.fontFamily?.name)
        }
        
        if let f = fontTheme.dataTitleFont {
            idvFontTheme.dataTitleFont = buildFont(font:f, fontFamilyName: fontTheme.fontFamily?.name)
        }
        
        if let f = fontTheme.dataHeaderFont {
            idvFontTheme.dataHeaderFont = buildFont(font:f, fontFamilyName: fontTheme.fontFamily?.name)
        }
        
        if let f = fontTheme.titleFont {
            idvFontTheme.titleFont = buildFont(font:f, fontFamilyName: fontTheme.fontFamily?.name)
        }
        
        if let f = fontTheme.buttonStartFont {
            idvFontTheme.buttonStartFont = buildFont(font:f, fontFamilyName: fontTheme.fontFamily?.name)
        }
        
        if let f = fontTheme.stepTitleFont {
            idvFontTheme.stepTitleFont = buildFont(font:f, fontFamilyName: fontTheme.fontFamily?.name)
        }
        
        if let f = fontTheme.stepNumberFont {
            idvFontTheme.stepNumberFont = buildFont(font:f, fontFamilyName: fontTheme.fontFamily?.name)
        }
        
        if let f = fontTheme.secondaryLabelFont {
            idvFontTheme.secondaryLabelFont = buildFont(font:f, fontFamilyName: fontTheme.fontFamily?.name)
        }
        
        if let f = fontTheme.faceTecMessageFont {
            idvFontTheme.faceTecMessageFont = buildFont(font:f, fontFamilyName: fontTheme.fontFamily?.name)
        }
        
        if let f = fontTheme.faceTecHeaderFont {
            idvFontTheme.faceTecHeaderFont = buildFont(font:f, fontFamilyName: fontTheme.fontFamily?.name)
        }
        
        if let f = fontTheme.faceTecSubtextFont {
            idvFontTheme.faceTecSubtextFont = buildFont(font:f, fontFamilyName: fontTheme.fontFamily?.name)
        }
        
        if let f = fontTheme.faceTecButtonFont {
            idvFontTheme.faceTecButtonFont = buildFont(font:f, fontFamilyName: fontTheme.fontFamily?.name)
        }
        
        if let f = fontTheme.idInstructionsFont {
            idvFontTheme.idInstructionsFont = buildFont(font:f, fontFamilyName: fontTheme.fontFamily?.name)
        }
        
        if let f = fontTheme.idFlashlightWarningFont {
            idvFontTheme.idFlashlightWarningFont = buildFont(font:f, fontFamilyName: fontTheme.fontFamily?.name)
        }
        
        return idvFontTheme
    }
    
    func buildFont(font:IdvFont, fontFamilyName:String?) -> UIFont {
        var f = UIFont.systemFont(ofSize: font.size.doubleValue)
        var weight:UIFont.Weight = .regular
        
        if let fWeight = font.weight {
            switch fWeight.doubleValue {
            case 0:
                weight = .ultraLight
            case 1:
                weight = .thin
            case 2:
                weight = .light
            case 3:
                weight = .regular
            case 4:
                weight = .medium
            case 5:
                weight = .semibold
            case 6:
                weight = .bold
            case 7:
                weight = .heavy
            case 8:
                weight = .black
            default:
                weight = .regular
            }
            if let famName = fontFamilyName {
                f = UIFont(name:famName, size:font.size.doubleValue)!
            } else {
                f = UIFont.systemFont(ofSize: font.size.doubleValue, weight:weight)
            }
            
        } else {
            if let famName = fontFamilyName {
                f = UIFont(name:famName, size:font.size.doubleValue)!
            } else {
                f = UIFont.systemFont(ofSize: font.size.doubleValue)
            }
            
        }
        return f
    }
 
}

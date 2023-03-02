package com.microblink.identityverification.flutter

import android.app.Activity
import com.microblink.identityverification.IdentityVerificationSDK
import com.microblink.identityverification.flutter.config.DartConfig
import com.microblink.identityverification.flutter.document.BlinkIdDocumentResultListenerImpl
import com.microblink.identityverification.flutter.document.DocumentVerificationResultListenerImpl
import com.microblink.identityverification.flutter.liveness.IProovLivenessListener
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

/** IdentityVerificationFlutterPlugin */
class IdentityVerificationFlutterPlugin : FlutterPlugin, ActivityAware, DartConfig.IdvPlatformApi {

    private lateinit var activity: Activity
    private lateinit var idvDartApi: DartConfig.IdvDartApi

    override fun startVerification(
        idvConfiguration: DartConfig.IdvConfiguration,
        result: DartConfig.Result<Boolean>
    ) {

        IdentityVerificationController(
            activity, IdentityVerificationSDK.Companion,
            IdvVerificationFinishListener(idvDartApi, result),
            BlinkIdDocumentResultListenerImpl(idvDartApi),
            DocumentVerificationResultListenerImpl(idvDartApi),
            IdvFacetecLivenessListener(idvDartApi),
            IProovLivenessListener(idvDartApi),
        ).startVerification(idvConfiguration)

    }


    @SuppressWarnings("unused")
    override fun setupIdentityVerificationCustomization(
        colorTheme: DartConfig.IdvColorTheme?,
        fontTheme: DartConfig.IdvFontTheme?,
        imageTheme: DartConfig.IdvImageTheme?,
        localizationTheme: DartConfig.IdvLocalizationTheme?,
        viewTheme: DartConfig.IdvViewTheme?,
        navigationTheme: DartConfig.IdvNavigationTheme?,
        dateFormatterTheme: DartConfig.IdvDateFormatterTheme?,
        result: DartConfig.Result<Void>?
    ) {
        //Do nothing, for iOS only
    }


    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {

        DartConfig.IdvPlatformApi.setup(flutterPluginBinding.binaryMessenger, this)
        idvDartApi = DartConfig.IdvDartApi(flutterPluginBinding.binaryMessenger)

    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {

    }

    override fun onDetachedFromActivity() {
    }

    override fun onDetachedFromActivityForConfigChanges() {
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    }


}


class NoReply : DartConfig.IdvDartApi.Reply<Void?> {
    override fun reply(value: Void?) {
    }
}
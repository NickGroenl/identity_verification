package com.microblink.identityverification.flutter.liveness

import com.microblink.identityverification.flutter.NoReply
import com.microblink.identityverification.flutter.config.DartConfig.IdvDartApi
import com.microblink.identityverification.flutter.extension.toByteArray
import com.microblink.identityverification.manager.config.api.FaceTecLivenessResultListener
import com.microblink.identityverification.result.api.FaceTecLivenessResult

class IdvFacetecLivenessListener(private val idvDartApi: IdvDartApi) :
    FaceTecLivenessResultListener {
    override fun onLivenessCheckSuccess(result: FaceTecLivenessResult) {
        idvDartApi.onLivenessCheckSuccess(result.faceImage.toByteArray(), NoReply())
    }
}
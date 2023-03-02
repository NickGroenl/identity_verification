package com.microblink.identityverification.flutter.liveness

import com.iproov.sdk.core.exception.IProovException
import com.microblink.identityverification.flutter.NoReply
import com.microblink.identityverification.flutter.config.DartConfig.IdvDartApi
import com.microblink.identityverification.flutter.extension.toByteArray
import com.microblink.identityverification.iproov.api.IProovListener
import com.microblink.identityverification.manager.config.api.FaceTecLivenessResultListener
import com.microblink.identityverification.result.api.FaceTecLivenessResult

class IProovLivenessListener(private val idvDartApi: IdvDartApi) :
    IProovListener {

    override fun onError(exception: IProovException) {

    }

    override fun onFailure(feedbackCode: String) {
    }

    override fun onSuccess() {
        //TODO
        idvDartApi.onLivenessCheckSuccess(byteArrayOf(), NoReply())
    }
}
package com.microblink.identityverification.flutter.liveness

import com.microblink.identityverification.flutter.config.DartConfig
import com.microblink.identityverification.flutter.parser.DartModelParser
import com.microblink.identityverification.iproov.api.IProovListener
import com.microblink.identityverification.iproov.api.IProovLivenessStep
import com.microblink.identityverification.manager.config.api.LivenessStep

class IProovLivenessParser(private val iProovListener: IProovListener) :
    DartModelParser<DartConfig.LivenessStep, LivenessStep> {


    override fun parse(params: DartConfig.LivenessStep): LivenessStep {
        val builder = IProovLivenessStep.Builder()
        builder.iProovListener(iProovListener)
        return builder.build()
    }


}
package com.microblink.identityverification.flutter.liveness

import com.microblink.identityverification.flutter.config.DartConfig
import com.microblink.identityverification.flutter.parser.DartModelParser
import com.microblink.identityverification.manager.config.api.FaceTecLivenessResultListener
import com.microblink.identityverification.manager.config.api.FaceTecLivenessStep
import com.microblink.identityverification.manager.config.api.LivenessStep

class FacetecLivenessParser(private val faceTecLivenessResultListener: FaceTecLivenessResultListener) :
    DartModelParser<DartConfig.LivenessStep, LivenessStep> {


    override fun parse(params: DartConfig.LivenessStep): LivenessStep {
        val builder = FaceTecLivenessStep.Builder()
        builder.initializeInProductionMode(requireNotNull(params.initializeInProduction))
        builder.livenessResultListener(faceTecLivenessResultListener)
        return builder.build()
    }


}
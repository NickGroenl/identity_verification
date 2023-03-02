package com.microblink.identityverification.flutter.document

import android.os.Parcelable
import com.microblink.entities.recognizers.blinkid.generic.classinfo.Country
import com.microblink.entities.recognizers.blinkid.generic.classinfo.Region
import com.microblink.entities.recognizers.blinkid.generic.classinfo.Type
import com.microblink.identityverification.docver.manager.config.api.filter.DocumentVerificationDocumentFilter
import kotlinx.parcelize.Parcelize


@Parcelize
class DocumentVerificationFilterImpl(
    private val countries: List<Long>? = null,
    private val regions: List<Long>? = null,
    private val types: List<Long>? = null,
    private val allowScanning: Boolean = true
) :  DocumentVerificationDocumentFilter {

    override fun isDocumentAllowed(
        country: com.microblink.documentverification.entities.recognizers.blinkid.generic.classinfo.Country,
        region: com.microblink.documentverification.entities.recognizers.blinkid.generic.classinfo.Region,
        type: com.microblink.documentverification.entities.recognizers.blinkid.generic.classinfo.Type
    ): Boolean {
        val countryFilterResult = countries?.map { it.toInt() }?.contains(country.ordinal)
        val regionFilterResult = regions?.map { it.toInt() }?.contains(region.ordinal)
        val typeFilterResult = types?.map { it.toInt() }?.contains(type.ordinal)


        return if (allowScanning) {
            countryFilterResult ?: true && regionFilterResult ?: true && typeFilterResult ?: true
        } else {
            countryFilterResult == false && regionFilterResult == false && typeFilterResult == false
        }
    }

}
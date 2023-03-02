package com.microblink.identityverification.flutter.document

import com.microblink.entities.recognizers.blinkid.generic.classinfo.Country
import com.microblink.entities.recognizers.blinkid.generic.classinfo.Region
import com.microblink.entities.recognizers.blinkid.generic.classinfo.Type
import com.microblink.identityverification.blinkid.manager.config.api.filter.BlinkIdDocumentFilter
import kotlinx.parcelize.Parcelize


@Parcelize
class BlinkIdDocumentFilterImpl(
    private val countries: List<Long>? = null,
    private val regions: List<Long>? = null,
    private val types: List<Long>? = null,
    private val allowScanning: Boolean = true
) : BlinkIdDocumentFilter {


    //For now we are using the enum ordinal, but in the future we might want to use the enum name
    override fun isDocumentAllowed(country: Country, region: Region, type: Type): Boolean {

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


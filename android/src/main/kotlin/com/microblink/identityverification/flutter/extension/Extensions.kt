package com.microblink.identityverification.flutter.extension

import android.graphics.Bitmap
import com.microblink.entities.recognizers.blinkid.generic.classinfo.Type
import com.microblink.identityverification.flutter.config.DartConfig
import com.microblink.identityverification.result.api.config.fields.FieldType
import java.io.ByteArrayOutputStream

fun FieldType.toDartType() : DartConfig.FieldType{
    return DartConfig.FieldType.values()[ordinal]
}

fun Bitmap.toByteArray(): ByteArray {
    val stream = ByteArrayOutputStream()
    this.compress(Bitmap.CompressFormat.PNG, 100, stream)
    return stream.toByteArray()
}
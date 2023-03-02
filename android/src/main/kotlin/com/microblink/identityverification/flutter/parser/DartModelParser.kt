package com.microblink.identityverification.flutter.parser

interface DartModelParser<T, R> {
    fun parse(params: T): R
}
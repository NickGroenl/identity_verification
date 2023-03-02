// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:identity_verification_flutter/src/configuration/builders.dart';
import 'package:identity_verification_flutter/src/result/result_fields.dart';
import 'dart:typed_data';

class IdvResult {
  final List<DocumentResultField> documentResultFields;
  final Uint8List? faceImage;
  final Image? livenessImage;

  final Uint8List? frontSideDocumentImage;
  final Uint8List? backSideDocumentImage;
  final Uint8List? signatureImage;

  final ClassInfo? classInfo;
  final ImageAnalysisResult? frontImageAnalysisResult;
  final ImageAnalysisResult? backImageAnalysisResult;

  IdvResult(
      {required this.documentResultFields,
      required this.frontSideDocumentImage,
      this.livenessImage,
      required this.faceImage,
      required this.backSideDocumentImage,
      this.signatureImage,
      this.classInfo,
      this.frontImageAnalysisResult,
      this.backImageAnalysisResult});

  Map<FieldType, DocumentResultField> getResultFieldAsMap() {

    final map = <FieldType, DocumentResultField>{};

    for(var field in documentResultFields){
      map[field.fieldType] = field;
    }

    return map;
  }
}

class IdvError extends Error {
  String _errorMessage = '';

  get errorMessage => _errorMessage;
  final ErrorType errorType;

  IdvError(this.errorType) {
    switch (errorType) {
      case ErrorType.Needs_Review:
        _errorMessage = 'Needs review';
        break;
      case ErrorType.Failed:
        _errorMessage = 'Verification failed';
        break;
      case ErrorType.Cancelled:
        _errorMessage = 'Verification cancelled';
        break;
    }
  }
}

enum ErrorType { Needs_Review, Failed, Cancelled }

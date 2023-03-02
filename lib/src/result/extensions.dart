import 'package:flutter/material.dart';

import '../../identity_verification.dart';

IdvResult createIdvResult(
    DocumentResult? blinkIdDocumentResult, Image? facetecImage) {
  final resultField = blinkIdDocumentResult?.resultsFields?.map((e) {
    DocumentResultField field;

    switch (e!.resultFieldType) {
      case ResultFieldType.StringResult:
        field = StringResultField(e.value1!, e.type);
        break;
      case ResultFieldType.InsertedStringResult:
        field = InsertedStringResultField(e.value1!, e.type);
        break;
      case ResultFieldType.EditedStringResult:
        field = EditedStringResultField(e.value1!, e.value2!, e.type);
        break;
      case ResultFieldType.DateResult:
        field = DateResultField(
            DateTime(
                e.simpleDate!.year, e.simpleDate!.month, e.simpleDate!.day),
            e.type);
        break;
      case ResultFieldType.BooleanResult:
        field = BooleanResultField(e.boolValue!, e.type);
        break;
    }

    return field;
  }).toList();
  return IdvResult(
      documentResultFields: resultField!,
      frontSideDocumentImage:blinkIdDocumentResult?.frontSideDocumentImage! != null
          ? blinkIdDocumentResult?.frontSideDocumentImage!
          : null,
      backSideDocumentImage: blinkIdDocumentResult?.backSideDocumentImage! != null
          ? blinkIdDocumentResult?.backSideDocumentImage!
          : null,
      faceImage: blinkIdDocumentResult?.faceImage! != null
          ? blinkIdDocumentResult?.faceImage!
          : null,
      signatureImage: blinkIdDocumentResult?.signatureImage != null
          ? blinkIdDocumentResult?.signatureImage!
          : null,
      classInfo: blinkIdDocumentResult?.classInfo,
      livenessImage: facetecImage,
      frontImageAnalysisResult: blinkIdDocumentResult?.frontImageAnalysisResult,
      backImageAnalysisResult: blinkIdDocumentResult?.backImageAnalysisResult);
}

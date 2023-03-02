//
//  MBBarcodeResult.h
//  MicroblinkDev
//
//  Created by Jura Skrlec on 28/11/2017.
//

/**
 * Enumeration of possible barcode formats
 */
typedef NS_ENUM(NSInteger, MDVBarcodeType) {
    MDVBarcodeNone = 0,
    /** QR code */
    MDVBarcodeTypeQR,
    /** Data Matrix */
    MDVBarcodeTypeDataMatrix,
    /** UPCE */
    MDVBarcodeTypeUPCE,
    /** UPCA */
    MDVBarcodeTypeUPCA,
    /** EAN 8 */
    MDVBarcodeTypeEAN8,
    /** EAN 13 */
    MDVBarcodeTypeEAN13,
    /** Code 128 */
    MDVBarcodeTypeCode128,
    /** Code 39 */
    MDVBarcodeTypeCode39,
    /** ITF */
    MDVBarcodeTypeITF,
    /** Code 39 */
    MDVBarcodeTypeAztec,
    /** PDF 417 */
    MDVBarcodeTypePdf417
};

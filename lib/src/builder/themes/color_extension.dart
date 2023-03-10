import 'dart:ui';

class ColorExtension {
  const ColorExtension();

  static String? toJson(Color? color) {
    if (color != null) { 
      return '#${color.value.toRadixString(16)}';
    }
    return null;
    
  }

  static Color? fromJson(String? code) {
    // throw UnimplementedError();
    if (code != null) { 
      return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
    }
    return null;
    
  }
} 

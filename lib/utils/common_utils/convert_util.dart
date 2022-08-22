import 'dart:convert';
import 'dart:typed_data';

class ConvertUtil {

  static List<String> parseImagesByteToBase64(List<Uint8List> imagesbyte) {
    List<String> base64List = [];

    imagesbyte.forEach(((imagebyte) {
      String base64string = base64.encode(imagebyte);
      final fileBase64 = 'data:image/png;base64,$base64string';
      base64List.add(fileBase64);
    }));

    return base64List;
  }
}
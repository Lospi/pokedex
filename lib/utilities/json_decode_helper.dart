import 'dart:convert';

import 'package:isolate_helper/isolate_helper.dart';

class JsonDecoderHelper extends IsolateHelper<String, Map<String, dynamic>> {
  static JsonDecoderHelper instance = JsonDecoderHelper._();

  JsonDecoderHelper._()
      : super(
          isolateFunction: decode,
          debugName: 'jsonDecode',
        );
}

Map<String, dynamic> decode(String data) => jsonDecode(data);

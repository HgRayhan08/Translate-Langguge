import 'package:apk_translate/model/translate_response.dart';
import 'package:dio/dio.dart';

class translate {
  Future<TranslateResponse> getTranslate(
      {required String textNilai,
      required String target,
      required String language}) async {
    final response = await Dio().post("https://api.mymemory.translated.net/get",
        queryParameters: {"q": textNilai, "langpair": "$target|$language"});
    // print(response);
    return TranslateResponse.fromJson(response.data);
  }
}

// To parse this JSON data, do
//
//     final listTranslateResponse = listTranslateResponseFromJson(jsonString);

import 'dart:convert';

ListTranslateResponse listTranslateResponseFromJson(String str) =>
    ListTranslateResponse.fromJson(json.decode(str));

String listTranslateResponseToJson(ListTranslateResponse data) =>
    json.encode(data.toJson());

class ListTranslateResponse {
  ResponseData responseData;
  bool quotaFinished;
  dynamic mtLangSupported;
  String responseDetails;
  int responseStatus;
  dynamic responderId;
  dynamic exceptionCode;
  List<Match> matches;

  ListTranslateResponse({
    required this.responseData,
    required this.quotaFinished,
    this.mtLangSupported,
    required this.responseDetails,
    required this.responseStatus,
    this.responderId,
    this.exceptionCode,
    required this.matches,
  });

  factory ListTranslateResponse.fromJson(Map<String, dynamic> json) =>
      ListTranslateResponse(
        responseData: ResponseData.fromJson(json["responseData"]),
        quotaFinished: json["quotaFinished"],
        mtLangSupported: json["mtLangSupported"],
        responseDetails: json["responseDetails"],
        responseStatus: json["responseStatus"],
        responderId: json["responderId"],
        exceptionCode: json["exception_code"],
        matches:
            List<Match>.from(json["matches"].map((x) => Match.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "responseData": responseData.toJson(),
        "quotaFinished": quotaFinished,
        "mtLangSupported": mtLangSupported,
        "responseDetails": responseDetails,
        "responseStatus": responseStatus,
        "responderId": responderId,
        "exception_code": exceptionCode,
        "matches": List<dynamic>.from(matches.map((x) => x.toJson())),
      };
}

class Match {
  String id;
  String segment;
  String translation;
  String source;
  String target;
  dynamic quality;
  dynamic reference;
  int usageCount;
  String? subject;
  String createdBy;
  String lastUpdatedBy;
  DateTime createDate;
  DateTime lastUpdateDate;
  double match;

  Match({
    required this.id,
    required this.segment,
    required this.translation,
    required this.source,
    required this.target,
    required this.quality,
    this.reference,
    required this.usageCount,
    this.subject,
    required this.createdBy,
    required this.lastUpdatedBy,
    required this.createDate,
    required this.lastUpdateDate,
    required this.match,
  });

  factory Match.fromJson(Map<String, dynamic> json) => Match(
        id: json["id"],
        segment: json["segment"],
        translation: json["translation"],
        source: json["source"],
        target: json["target"],
        quality: json["quality"],
        reference: json["reference"],
        usageCount: json["usage-count"],
        subject: json["subject"],
        createdBy: json["created-by"],
        lastUpdatedBy: json["last-updated-by"],
        createDate: DateTime.parse(json["create-date"]),
        lastUpdateDate: DateTime.parse(json["last-update-date"]),
        match: json["match"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "segment": segment,
        "translation": translation,
        "source": source,
        "target": target,
        "quality": quality,
        "reference": reference,
        "usage-count": usageCount,
        "subject": subject,
        "created-by": createdBy,
        "last-updated-by": lastUpdatedBy,
        "create-date": createDate.toIso8601String(),
        "last-update-date": lastUpdateDate.toIso8601String(),
        "match": match,
      };
}

class ResponseData {
  String translatedText;
  int match;

  ResponseData({
    required this.translatedText,
    required this.match,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) => ResponseData(
        translatedText: json["translatedText"],
        match: json["match"],
      );

  Map<String, dynamic> toJson() => {
        "translatedText": translatedText,
        "match": match,
      };
}

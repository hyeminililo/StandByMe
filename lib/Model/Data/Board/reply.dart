import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class replyModel {
  int? _replyId;
  String? _replyContents;
  String? _replyWriter;

  replyModel({int? replyId, String? replyContents, String? replyWriter})
      : _replyId = replyId,
        _replyContents = replyContents,
        _replyWriter = replyWriter;

  replyModel toMap() {
    return replyModel(
        replyId: _replyId,
        replyContents: _replyContents,
        replyWriter: _replyWriter);
  }

  factory replyModel.fromMap(Map<String, dynamic> map) {
    return replyModel(
      replyId: map['replyId'] as int,
      replyContents: map['contents'] as String,
      replyWriter: map['writer'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory replyModel.fromJson(String source) =>
      replyModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class BoardModelDetails {
  final int? _boardId;
  final String? _contents;
  final String? _title;
  final String? _location;
  final String? _writer;
  final dynamic _createdDate;
  final int? _theNumberOfReply;
  final int? _viewCount;
  final int? _heartsCount;

  BoardModelDetails(
      {int? boardId,
      String? contents,
      String? title,
      String? location,
      String? writer,
      dynamic createdDate,
      int? theNumberOfReply,
      int? viewCount,
      int? heartsCount})
      : _boardId = boardId,
        _contents = contents,
        _title = title,
        _location = location,
        _writer = writer,
        _createdDate = createdDate,
        _theNumberOfReply = theNumberOfReply,
        _viewCount = viewCount,
        _heartsCount = heartsCount;

  BoardModelDetails toMap() {
    return BoardModelDetails(
        boardId: _boardId,
        contents: _contents,
        title: _title,
        location: _location,
        writer: _writer,
        createdDate: _createdDate,
        theNumberOfReply: _theNumberOfReply,
        viewCount: _viewCount,
        heartsCount: _heartsCount);
  }

  factory BoardModelDetails.fromMap(Map<String, dynamic> map) {
    return BoardModelDetails(
      boardId: map['_boardId'] as int,
      contents: map['_contents'] as String,
      title: map['_title'] as String,
      location: map['_region'] as String,
      writer: map['_writer'] as String,
      createdDate: map['_createdDate'] as dynamic,
      theNumberOfReply: map['_theNumberOfReply'] as int,
      viewCount: map['_view'] as int,
      heartsCount: map['_hearts'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory BoardModelDetails.fromJson(String source) =>
      BoardModelDetails.fromMap(json.decode(source) as Map<String, dynamic>);
}

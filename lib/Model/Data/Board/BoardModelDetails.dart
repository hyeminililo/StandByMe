import 'dart:convert';
import 'dart:ffi';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class BoardModelDetails {
  final Long? _boardId;
  final String? _contents;
  final String? _title;
  final String? _location;
  final String? _writer;
  final DateTime _createdDate;
  final Long? _theNumberOfReply;
  final int? _viewCount;
  final Long? _heartsCount;

  BoardModelDetails(
      {Long? boardId,
      String? contents,
      String? title,
      String? location,
      String? writer,
      dynamic createdDate,
      Long? theNumberOfReply,
      int? viewCount,
      Long? heartsCount})
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
      boardId: map['_boardId'] as Long,
      contents: map['_contents'] as String,
      title: map['_title'] as String,
      location: map['_region'] as String,
      writer: map['_writer'] as String,
      createdDate: map['_createdDate'] as dynamic,
      theNumberOfReply: map['_theNumberOfReply'] as Long,
      viewCount: map['_view'] as int,
      heartsCount: map['_hearts'] as Long,
    );
  }

  String toJson() => json.encode(toMap());

  factory BoardModelDetails.fromJson(String source) =>
      BoardModelDetails.fromMap(json.decode(source) as Map<String, dynamic>);
}

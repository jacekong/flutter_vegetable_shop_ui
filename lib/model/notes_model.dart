import 'dart:convert';

class NotesModel {
  final String title;
  final String content;
  NotesModel({
    required this.title,
    required this.content,
  });

  NotesModel copyWith({
    String? title,
    String? content,
  }) {
    return NotesModel(
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'content': content,
    };
  }

  factory NotesModel.fromMap(Map<String, dynamic> map) {
    return NotesModel(
      title: map['title'] as String,
      content: map['content'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotesModel.fromJson(String source) => NotesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'NotesModel(title: $title, content: $content)';

  @override
  bool operator ==(covariant NotesModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.content == content;
  }

  @override
  int get hashCode => title.hashCode ^ content.hashCode;
}
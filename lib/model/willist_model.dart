import 'dart:convert';

class WillModel {
  final String title;
  final String content;
  WillModel({
    required this.title,
    required this.content,
  });

  WillModel copyWith({
    String? title,
    String? content,
  }) {
    return WillModel(
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

  factory WillModel.fromMap(Map<String, dynamic> map) {
    return WillModel(
      title: map['title'] as String,
      content: map['content'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WillModel.fromJson(String source) => WillModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'WillModel(title: $title, content: $content)';

  @override
  bool operator ==(covariant WillModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.content == content;
  }

  @override
  int get hashCode => title.hashCode ^ content.hashCode;
}
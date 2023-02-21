import 'dart:convert';

class Vegetables {
  final String name;
  final String description;
  final double price;
  int qty;
  final String url;
  Vegetables({
    required this.name,
    required this.description,
    required this.price,
    required this.qty,
    required this.url,
  });

  Vegetables copyWith({
    String? name,
    String? description,
    double? price,
    int? qty,
    String? url,
  }) {
    return Vegetables(
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      qty: qty ?? this.qty,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'price': price,
      'qty': qty,
      'url': url,
    };
  }

  factory Vegetables.fromMap(Map<String, dynamic> map) {
    return Vegetables(
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'].toDouble() as double,
      qty: map['qty'].toInt() as int,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Vegetables.fromJson(String source) => Vegetables.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Vegetables(name: $name, description: $description, price: $price, qty: $qty, url: $url)';
  }

  @override
  bool operator ==(covariant Vegetables other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.description == description &&
      other.price == price &&
      other.qty == qty &&
      other.url == url;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      description.hashCode ^
      price.hashCode ^
      qty.hashCode ^
      url.hashCode;
  }
}
import 'dart:convert';

class Hotel {
  final String image;
  final String name;
  final String info;
  final String cost;
  final int bed;
  final int swimming;
  final int bath;
  Hotel({
    required this.image,
    required this.name,
    required this.info,
    required this.cost,
    required this.bed,
    required this.swimming,
    required this.bath,
  });

  Hotel copyWith({
    String? image,
    String? name,
    String? info,
    String? cost,
    int? bed,
    int? swimming,
    int? bath,
  }) {
    return Hotel(
      image: image ?? this.image,
      name: name ?? this.name,
      info: info ?? this.info,
      cost: cost ?? this.cost,
      bed: bed ?? this.bed,
      swimming: swimming ?? this.swimming,
      bath: bath ?? this.bath,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,
      'info': info,
      'cost': cost,
      'bed': bed,
      'swimming': swimming,
      'bath': bath,
    };
  }

  factory Hotel.fromMap(Map<String, dynamic> map) {
    return Hotel(
      image: map['image'],
      name: map['name'],
      info: map['info'],
      cost: map['cost'],
      bed: map['bed'],
      swimming: map['swimming'],
      bath: map['bath'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Hotel.fromJson(String source) => Hotel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Hotel(image: $image, name: $name, info: $info, cost: $cost, bed: $bed, swimming: $swimming, bath: $bath)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Hotel &&
        other.image == image &&
        other.name == name &&
        other.info == info &&
        other.cost == cost &&
        other.bed == bed &&
        other.swimming == swimming &&
        other.bath == bath;
  }

  @override
  int get hashCode {
    return image.hashCode ^
        name.hashCode ^
        info.hashCode ^
        cost.hashCode ^
        bed.hashCode ^
        swimming.hashCode ^
        bath.hashCode;
  }
}

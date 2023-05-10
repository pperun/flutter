class User {
  final int id;
  final String? name;
  final String? phoneNumber;
  final DateTime createdAt;
  final DateTime updatedAt;

  User(
    this.id,
    this.name,
    this.phoneNumber,
    this.createdAt,
    this.updatedAt,
  );

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? '',
        name = json['name'] ?? '',
        phoneNumber = json['phoneNumber'],
        createdAt = DateTime.fromMillisecondsSinceEpoch(
          json['createdAt'],
        ),
        updatedAt = DateTime.fromMicrosecondsSinceEpoch(
          json['updatedAt'],
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name ?? '',
        'phoneNumber': phoneNumber ?? '',
        'createdAt': createdAt.millisecondsSinceEpoch,
        'updatedAt': updatedAt.millisecondsSinceEpoch,
      };
}

class User {
  final int id;
  final String name;
  final String phoneNumber;
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
      : id = json['data']['id'],
        name = json['data']['name'],
        phoneNumber = json['data']['phoneNumber'],
        createdAt = DateTime.fromMillisecondsSinceEpoch(
          json['data']['createdAt'],
        ),
        updatedAt = DateTime.fromMicrosecondsSinceEpoch(
          json['data']['updatedAt'],
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phoneNumber': phoneNumber,
        'createdAt': createdAt.millisecondsSinceEpoch,
        'updatedAt': updatedAt.millisecondsSinceEpoch,
      };
}

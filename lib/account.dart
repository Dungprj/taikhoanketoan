class Account {
  String code;
  String name;
  bool isFavorite;

  Account({
    required this.code,
    required this.name,
    this.isFavorite = false,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      code: json['code'],
      name: json['name'],
      isFavorite: json['isFavorite'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'name': name,
      'isFavorite': isFavorite,
    };
  }
}

class SizeModel {
  String name;
  String qty;

  SizeModel({
    required this.name,
    required this.qty,
  });

  factory SizeModel.fromJson(Map<String, dynamic> json) {
    return SizeModel(
      name: json['name'] ?? '',
      qty: json['qty'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'qty': qty,
    };
  }
}

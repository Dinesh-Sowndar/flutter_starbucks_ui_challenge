class SizeModel {
  String? name;
  String? qty;

  SizeModel({this.name, this.qty});

  SizeModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['qty'] = qty;
    return data;
  }
}

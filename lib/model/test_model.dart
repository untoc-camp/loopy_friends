class TestModel {
  String? id;
  String? name;

  TestModel({
    this.id,
    this.name,
  });

  TestModel.fromJson(String id, Map<String, dynamic> json) {
    id = id;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

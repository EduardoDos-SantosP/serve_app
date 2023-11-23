abstract class Model {
  String? _id;

  Model({String id = ''}) : _id = id;

  Model.withId(this._id);

  String get id => _id!;

  Model.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
  }

  Map<String, dynamic> toJson() => {'id': id};
}

abstract class Model {
  String id;

  Model(this.id);

  Map<String, dynamic> toJson() => {'id': id};
}

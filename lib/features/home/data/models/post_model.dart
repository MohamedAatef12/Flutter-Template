import 'package:template/features/home/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  const PostModel({required super.id, required super.name});

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      PostModel(id: json['id'], name: json['name']);

  Map<String, dynamic> toJson() => {'id': id, 'name': name};

  factory PostModel.fromEntity(PostEntity user) =>
      PostModel(id: user.id, name: user.name);

  PostEntity toEntity() => PostEntity(id: id, name: name);
}

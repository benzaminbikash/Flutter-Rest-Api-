import 'dart:convert';

List<PostsModal> postsModalFromJson(String str) =>
    List<PostsModal>.from(json.decode(str).map((x) => PostsModal.fromJson(x)));

String postsModalToJson(List<PostsModal> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostsModal {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  PostsModal({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory PostsModal.fromJson(Map<String, dynamic> json) => PostsModal(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}

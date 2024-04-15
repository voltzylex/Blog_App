// ignore_for_file: public_member_api_docs, sort_constructors_first

class Blog {
  final String id;
  final String title;

  final String content;

  final String imageUrl;

  final String posterId;

  final DateTime updatedAt;
  final List<String> topics;
  final String? posterName;

  Blog({
    required this.id,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.posterId,
    required this.updatedAt,
    required this.topics,
    this.posterName
  });
}

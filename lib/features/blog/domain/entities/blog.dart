class Blog {
  final String id;
  final String title;

  final String content;

  final String imageUrl;

  final String posterId;

  final DateTime updatedAt;
  final List<String> topics;

  Blog({
    required this.id,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.posterId,
    required this.updatedAt,
    required this.topics,
  });
}

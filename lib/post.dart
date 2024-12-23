class Post {
  final int id;
  final Map<String, String> title; // Tiêu đề theo ngôn ngữ
  final Map<String, String> content; // Nội dung theo ngôn ngữ
  final List<String> imageUrls;
  final Map<String, List<String>> details; // Mô tả chi tiết theo ngôn ngữ

  Post({
    required this.id,
    required this.title,
    required this.content,
    required this.imageUrls,
    required this.details,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: Map<String, String>.from(json['title']),
      content: Map<String, String>.from(json['content']),
      imageUrls: List<String>.from(json['image_urls']),
      details: Map<String, List<String>>.from(json['details']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'image_urls': imageUrls,
      'details': details,
    };
  }
}

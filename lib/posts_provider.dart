import 'package:flutter/material.dart';
import 'package:tourr/post.dart'; // Đảm bảo import đúng lớp Post

class PostsProvider extends ChangeNotifier {
  List<Post> _posts = [];

  List<Post> get posts => _posts;

  // Lấy danh sách bài viết (có thể sử dụng APIService ở đây để lấy dữ liệu)
  void setPosts(List<Post> posts) {
    _posts = posts;
    notifyListeners();
  }

  // Thêm bài viết mới
  void addPost(Post post) {
    _posts.add(post);
    notifyListeners();
  }

  // Cập nhật bài viết
  void updatePost(Post post) {
    int index = _posts.indexWhere((element) => element.id == post.id);
    if (index != -1) {
      _posts[index] = post;
      notifyListeners();
    }
  }

  // Xóa bài viết
  void deletePost(int id) {
    _posts.removeWhere((post) => post.id == id);
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class LocalizationProvider with ChangeNotifier {
  String _languageCode = 'vi'; // Default language is Vietnamese

  String get languageCode => _languageCode;

  void setLanguage(String languageCode) {
    _languageCode = languageCode;
    notifyListeners();
  }

  String translate(String key) {
    final Map<String, String> texts = _languageCode == 'vi' ? _viTexts : _enTexts;
    return texts[key] ?? key;
  }

  // Vietnamese translations
  static const Map<String, String> _viTexts = {
    'menu': 'Menu',
    'post_list': 'Danh sách bài viết',
    'add_post': 'Thêm bài viết',
    'google_map': 'Google Map',
    'settings': 'Cài đặt',
    'title': 'Tiêu đề',
    'content': 'Nội dung',
    'add_image': 'Thêm hình ảnh',
    'save': 'Lưu',
    'edit_post': 'Chỉnh sửa bài viết',
    'delete': 'Xóa',
    'notification': 'Quản lý thông báo',
    'language': 'Thay đổi ngôn ngữ',
    'account': 'Quản lý tài khoản',
    'support': 'Hỗ trợ và liên hệ',
    'privacy': 'Chính sách bảo mật',
    'close': 'Đóng',
    'current_language': 'Ngôn ngữ hiện tại',
    'post_details': 'Chi tiết bài viết',
    'no_description': 'Chưa có mô tả',
    'enter_title': 'Nhập tiêu đề bài viết',
    'enter_content': 'Nhập nội dung bài viết',
    'enter_image_url': 'Nhập đường dẫn hình ảnh',
    'error': 'Có lỗi xảy ra!',
    'loading': 'Đang tải...',
    'confirm_delete': 'Xác nhận xóa bài viết?',
    'yes': 'Có',
    'no': 'Không',
    'add_post_description': 'Thêm thông tin và hình ảnh bài viết',
    'edit_post_description': 'Cập nhật nội dung bài viết',
  };

  // English translations
  static const Map<String, String> _enTexts = {
    'menu': 'Menu',
    'post_list': 'Post List',
    'add_post': 'Add Post',
    'google_map': 'Google Map',
    'settings': 'Settings',
    'title': 'Title',
    'content': 'Content',
    'add_image': 'Add Image',
    'save': 'Save',
    'edit_post': 'Edit Post',
    'delete': 'Delete',
    'notification': 'Manage Notifications',
    'language': 'Change Language',
    'account': 'Account Management',
    'support': 'Support & Contact',
    'privacy': 'Privacy Policy',
    'close': 'Close',
    'current_language': 'Current Language',
    'post_details': 'Post Details',
    'no_description': 'No description available',
    'enter_title': 'Enter post title',
    'enter_content': 'Enter post content',
    'enter_image_url': 'Enter image URL',
    'error': 'An error occurred!',
    'loading': 'Loading...',
    'confirm_delete': 'Confirm delete this post?',
    'yes': 'Yes',
    'no': 'No',
    'add_post_description': 'Add post details and images',
    'edit_post_description': 'Update post content',
  };
}

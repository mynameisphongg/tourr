import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'LocalizationProvider.dart';
import 'post.dart';
import 'add_post_screen.dart';
import 'edit_post_screen.dart';
import 'post_detail_screen.dart';
import 'google_map_screen.dart';
import 'api_service.dart';
import 'setting_creen.dart';

class PostListScreen extends StatefulWidget {
  @override
  _PostListScreenState createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  final ApiService _apiService = ApiService();
  late Future<List<Post>> _postsFuture;

  @override
  void initState() {
    super.initState();
    _refreshPosts();
  }

  void _refreshPosts() {
    setState(() {
      _postsFuture = _apiService.getPosts();
    });
  }

  void _deletePost(int id) {
    setState(() {
      _apiService.deletePost(id);
      _refreshPosts();
    });
  }

  void _editPost(Post post) async {
    final updatedPost = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditPostScreen(post: post),
      ),
    );
    if (updatedPost != null && updatedPost is Post) {
      setState(() {
        _apiService.updatePost(updatedPost);
        _refreshPosts();
      });
    }
  }

  void _addPost() async {
    final newPost = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddPostScreen()),
    );
    if (newPost != null && newPost is Post) {
      setState(() {
        _apiService.addPost(newPost);
        _refreshPosts();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var locale = Provider.of<LocalizationProvider>(context);
    var languageCode = locale.languageCode;

    return Scaffold(
      appBar: AppBar(
        title: Text(locale.translate('post_list')),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                locale.translate('menu'),
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text(locale.translate('post_list')),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text(locale.translate('add_post')),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddPostScreen()),
                ).then((newPost) {
                  if (newPost != null && newPost is Post) {
                    setState(() {
                      _apiService.addPost(newPost);
                      _refreshPosts();
                    });
                  }
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.map),
              title: Text(locale.translate('google_map')),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GoogleMapScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(locale.translate('settings')),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<Post>>(
        future: _postsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text(locale.translate('error')));
          }
          final posts = snapshot.data ?? [];
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      post.imageUrls.isNotEmpty
                          ? post.imageUrls[0]
                          : 'assets/images/default.jpg',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(post.title[languageCode] ?? ''),
                  subtitle: Text(
                    post.content[languageCode] ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostDetailScreen(post: post),
                      ),
                    );
                  },
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () => _editPost(post),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Icon(Icons.edit, color: Colors.white),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () => _deletePost(post.id),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

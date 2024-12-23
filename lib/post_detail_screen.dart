import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'LocalizationProvider.dart';
import 'post.dart';

class PostDetailScreen extends StatelessWidget {
  final Post post;

  PostDetailScreen({required this.post});

  @override
  Widget build(BuildContext context) {
    var locale = Provider.of<LocalizationProvider>(context);
    var languageCode = locale.languageCode;

    return Scaffold(
      appBar: AppBar(
        title: Text(post.title[languageCode] ?? ''),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.content[languageCode] ?? '',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              ...List.generate(post.imageUrls.length, (index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        post.imageUrls[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 200,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      (post.details[languageCode]?.isNotEmpty ?? false)
                          ? post.details[languageCode]![index]
                          : locale.translate('no_description'),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 24),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

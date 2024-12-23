import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'LocalizationProvider.dart';
import 'package:tourr/post.dart';

class EditPostScreen extends StatefulWidget {
  final Post post;

  EditPostScreen({required this.post});

  @override
  _EditPostScreenState createState() => _EditPostScreenState();
}

class _EditPostScreenState extends State<EditPostScreen> {
  late TextEditingController _titleViController;
  late TextEditingController _titleEnController;
  late TextEditingController _contentViController;
  late TextEditingController _contentEnController;
  List<TextEditingController> _imageControllers = [];
  List<TextEditingController> _detailViControllers = [];
  List<TextEditingController> _detailEnControllers = [];

  @override
  void initState() {
    super.initState();
    _titleViController = TextEditingController(text: widget.post.title['vi']);
    _titleEnController = TextEditingController(text: widget.post.title['en']);
    _contentViController = TextEditingController(text: widget.post.content['vi']);
    _contentEnController = TextEditingController(text: widget.post.content['en']);

    _imageControllers = (widget.post.imageUrls ?? [])
        .map((url) => TextEditingController(text: url))
        .toList();
    _detailViControllers = (widget.post.details['vi'] ?? [])
        .map((detail) => TextEditingController(text: detail))
        .toList();
    _detailEnControllers = (widget.post.details['en'] ?? [])
        .map((detail) => TextEditingController(text: detail))
        .toList();
  }


  @override
  void dispose() {
    _titleViController.dispose();
    _titleEnController.dispose();
    _contentViController.dispose();
    _contentEnController.dispose();
    for (var controller in _imageControllers) {
      controller.dispose();
    }
    for (var controller in _detailViControllers) {
      controller.dispose();
    }
    for (var controller in _detailEnControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _addImageField() {
    setState(() {
      _imageControllers.add(TextEditingController());
      _detailViControllers.add(TextEditingController());
      _detailEnControllers.add(TextEditingController());
    });
  }

  void _removeImageField(int index) {
    setState(() {
      _imageControllers.removeAt(index);
      _detailViControllers.removeAt(index);
      _detailEnControllers.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    var locale = Provider.of<LocalizationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(locale.translate('edit_post')),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _titleViController,
                decoration: InputDecoration(
                  labelText: locale.translate('enter_title') + ' (Việt)',
                ),
              ),
              TextField(
                controller: _titleEnController,
                decoration: InputDecoration(
                  labelText: locale.translate('enter_title') + ' (English)',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _contentViController,
                decoration: InputDecoration(
                  labelText: locale.translate('enter_content') + ' (Việt)',
                ),
                maxLines: 3,
              ),
              TextField(
                controller: _contentEnController,
                decoration: InputDecoration(
                  labelText: locale.translate('enter_content') + ' (English)',
                ),
                maxLines: 3,
              ),
              SizedBox(height: 16),
              Text(
                locale.translate('add_image'),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _imageControllers.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      TextField(
                        controller: _imageControllers[index],
                        decoration: InputDecoration(
                          labelText: locale.translate('enter_image_url') +
                              ' ${index + 1}',
                        ),
                      ),
                      TextField(
                        controller: _detailViControllers[index],
                        decoration: InputDecoration(
                          labelText:
                          locale.translate('description') + ' (Việt)',
                        ),
                      ),
                      TextField(
                        controller: _detailEnControllers[index],
                        decoration: InputDecoration(
                          labelText:
                          locale.translate('description') + ' (English)',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _removeImageField(index),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  );
                },
              ),
              ElevatedButton.icon(
                onPressed: _addImageField,
                icon: Icon(Icons.add),
                label: Text(locale.translate('add_image')),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_titleViController.text.isNotEmpty &&
                      _titleEnController.text.isNotEmpty &&
                      _contentViController.text.isNotEmpty &&
                      _contentEnController.text.isNotEmpty &&
                      _imageControllers.every((controller) =>
                      controller.text.isNotEmpty) &&
                      _detailViControllers.every((controller) =>
                      controller.text.isNotEmpty) &&
                      _detailEnControllers.every((controller) =>
                      controller.text.isNotEmpty)) {
                    final updatedPost = Post(
                      id: widget.post.id,
                      title: {
                        'vi': _titleViController.text,
                        'en': _titleEnController.text,
                      },
                      content: {
                        'vi': _contentViController.text,
                        'en': _contentEnController.text,
                      },
                      imageUrls: _imageControllers
                          .map((controller) => controller.text)
                          .toList(),
                      details: {
                        'vi': _detailViControllers
                            .map((controller) => controller.text)
                            .toList(),
                        'en': _detailEnControllers
                            .map((controller) => controller.text)
                            .toList(),
                      },
                    );
                    Navigator.pop(context, updatedPost);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(locale.translate('fill_all_fields'))),
                    );
                  }
                },
                child: Text(locale.translate('save')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

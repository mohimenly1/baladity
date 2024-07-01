import 'package:flutter/material.dart';
import 'package:sos_app/models/Post.dart';

class PostDetailScreen extends StatelessWidget {
  final Post post;

  const PostDetailScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title,
            style: const TextStyle(fontFamily: 'TajawalRegular')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(post.imageCover),
            const SizedBox(height: 10),
            Text(
              post.title,
              style:
                  const TextStyle(fontFamily: 'TajawalRegular', fontSize: 24),
            ),
            const SizedBox(height: 10),
            Text(
              post.content,
              style:
                  const TextStyle(fontFamily: 'TajawalRegular', fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

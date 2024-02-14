import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({super.key});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Row(
          children: [
            const Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
            const Text(
              'Free Board',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(width: 180),
            TextButton(
                onPressed: () => context.go('/creatPost'),
                child: const Text('+ Creat Post'))
          ],
        ),
      ],
    ));
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'liskov_substitution /post_example/solution/post_database.dart';
import 'liskov_substitution /post_example/solution/post_model.dart';
import 'liskov_substitution /rectangle_example/rectangle_solution.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Liskov Substitution'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _rectangleExample() {
    Rectangle rec = Rectangle(2, 5);
    log("${rec.calcArea()}");

    Square squ = Square(5);
    log("${squ.calcArea()}");
  }

  _postExample() {
    PostDatabase db = PostDatabase();

    List<String> posts = [];

    posts.add('ORIGINAL POST');
    posts.add('#TAG POST');
    posts.add('@MENTION POST');
    posts.add('http POST');
    Post postObj;

    for (var post in posts) {
      if (post.startsWith('#')) {
        postObj = TagPost();
      } else if (post.startsWith('@')) {
        postObj = MentionPost();
      } else if (post.startsWith('http')) {
        postObj = LinkPost();
      } else {
        postObj = Post();
      }

      String result = postObj.createPost(db, post);
      log(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  _rectangleExample();
                },
                child: const Text("Rectangle Example")),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
                onPressed: () {
                  _postExample();
                },
                child: const Text("Post Example")),
          ],
        ),
      ),
    );
  }
}

import 'package:solid_principles/liskov_substitution%20/post_example/violation/post_database.dart';

class Post {
  String createPost(PostDatabase db, String post) {
    return db.addPost(post);
  }
}

class TagPost extends Post {
  String createTagPost(PostDatabase db, String post) {
    return db.addTagPost(post);
  }
}

class MentionPost extends Post {
  String createMentionPost(PostDatabase db, String post) {
    return db.addMentionPost(post);
  }
}

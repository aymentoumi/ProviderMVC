import 'package:flutter/foundation.dart';

import 'author.dart';

class Feed {
  final String title;
  final int views, answers, id;
  final Author author;
  bool favorite = false;

  Feed(this.id,
      {@required this.title,
      @required this.views,
      @required this.answers,
      @required this.author});
}

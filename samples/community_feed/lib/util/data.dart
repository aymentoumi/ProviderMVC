import '../model/author.dart';
import '../model/feed.dart';

abstract class Data {
  static final Map<int, Feed> feeds = {
    1: Feed(
      1,
      title: 'T1',
      views: 1,
      answers: 1,
      author: Author(name: 'A1', imageUrl: 'url1'),
    ),
    2: Feed(
      2,
      title: 'T2',
      views: 2,
      answers: 2,
      author: Author(name: 'A2', imageUrl: 'url2'),
    )
  };

  static Future<List<int>> get allIds => Future.value(feeds.keys.toList());

  static Future<List<int>> get favoritesIds =>
      Future.value(feeds.keys.where((id) => feeds[id].favorite).toList());
}

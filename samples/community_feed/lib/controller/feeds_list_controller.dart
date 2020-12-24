import 'package:community_feed/util/data.dart';
import 'package:provider_mvc/controller.dart';

class FeedsListController extends Controller {
  final List<int> _feedIds = [];

  List<int> get feeds => _feedIds;

  set feeds(List<int> feedIds) {
    _feedIds.clear();
    _feedIds.addAll(feedIds);
  }

  void removeFeed(int id) {
    Data.feeds[id].favorite = false;
    _feedIds.remove(id);
    update();
  }
}

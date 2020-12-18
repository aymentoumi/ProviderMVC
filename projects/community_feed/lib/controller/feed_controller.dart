import 'package:community_feed/util/data.dart';
import 'package:provider_mvc/controller.dart';

class FeedController extends Controller {
  final int feedId;

  FeedController(this.feedId);

  void toogle() {
    Data.feeds[feedId].favorite = !Data.feeds[feedId].favorite;
    update();
  }
}

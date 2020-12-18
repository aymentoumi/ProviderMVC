import 'package:flutter/material.dart';
import 'package:provider_mvc/view.dart';

import '../controller/feeds_list_controller.dart';
import 'feed_view.dart';

class FeedsListView extends View<FeedsListController> {
  FeedsListView() : super(FeedsListController());

  @override
  Widget builder(BuildContext context, FeedsListController controller,
          Widget widget) =>
      ListView(
        children: controller.feeds.map((id) => FeedView(id)).toList(),
      );
}

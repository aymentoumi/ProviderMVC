import 'package:community_feed/main.dart';
import 'package:community_feed/model/feed.dart';
import 'package:flutter/material.dart';
import 'package:provider_mvc/view.dart';

import '../controller/feed_controller.dart';
import '../util/data.dart';

class FeedView extends View<FeedController> {
  FeedView(int feedId) : super(FeedController(feedId));

  @override
  Widget builder(
      BuildContext context, FeedController controller, Widget widget) {
    Feed feed = Data.feeds[controller.feedId];
    return Card(
      color: Colors.grey,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child:
                    CircleAvatar(child: Text(feed.author.name.substring(0, 2))),
              ),
              Expanded(child: Text(feed.title)),
              IconButton(
                icon: Icon(
                    feed.favorite ? Icons.favorite : Icons.favorite_border),
                onPressed: () {
                  if (ModalRoute.of(context).settings.name == '/favorites')
                    favoriteScreen.feedsList.controller
                        .removeFeed(controller.feedId);
                  else
                    controller.toogle();
                },
              )
            ],
          )
        ],
      ),
    );
  }
}

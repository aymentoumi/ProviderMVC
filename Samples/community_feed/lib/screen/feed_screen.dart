import 'package:community_feed/main.dart';
import 'package:community_feed/model/author.dart';
import 'package:community_feed/model/feed.dart';
import 'package:flutter/material.dart';

import '../util/data.dart';
import '../util/screen_type.dart';
import '../view/feeds_list_view.dart';

class FeedScreen extends StatelessWidget {
  final ScreenType _type;
  final FeedsListView feedsList = FeedsListView();

  FeedScreen([this._type = ScreenType.home]);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text((_type == ScreenType.favorites) ? 'Favorites' : 'Home'),
          actions: [
            if (_type == ScreenType.home)
              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {
                  Navigator.pushNamed(context, '/favorites');
                },
              )
          ],
        ),
        body: WillPopScope(
          onWillPop: () async {
            if (_type == ScreenType.favorites)
              homeScreen.feedsList.controller.update();
            return true;
          },
          child: FutureBuilder<List<int>>(
            future:
                (_type == ScreenType.home) ? Data.allIds : Data.favoritesIds,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                feedsList.controller.feeds = snapshot.data;
                if (_type == ScreenType.home)
                  return RefreshIndicator(
                      onRefresh: () async {
                        int id = Data.feeds.keys.last + 1;
                        Data.feeds[id] = Feed(
                          id,
                          title: 'T$id',
                          views: 1,
                          answers: 1,
                          author: Author(name: 'A$id', imageUrl: 'url$id'),
                        );
                        feedsList.controller.feeds = await Data.allIds;
                        feedsList.refresh();
                      },
                      child: feedsList);
                return feedsList;
              } else
                return CircularProgressIndicator();
            },
          ),
        ),
      );
}

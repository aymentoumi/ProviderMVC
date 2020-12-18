import 'package:flutter/material.dart';
import 'package:portfolio/view/profile_view.dart';

PortfolioApp portfolioApp = PortfolioApp();

void main() => runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: portfolioApp),
    );

class PortfolioApp extends StatelessWidget {
  final ProfileView _profileView = ProfileView();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              pinned: true,
              snap: false,
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/GitHub-Mark.png',
                ),
                title: Text('GitHub Portfolio'),
                centerTitle: true,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Github Username',
                            ),
                            onChanged: (text) =>
                                _profileView.controller?.username = text,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          onPressed: () => _profileView.controller?.update(),
                          child: Text('Load'),
                        ),
                      )
                    ],
                  ),
                  _profileView
                ],
              ),
            ),
          ],
        ),
      );
}

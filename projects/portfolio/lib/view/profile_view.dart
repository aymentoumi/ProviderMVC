import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/controller/profile_controller.dart';
import 'package:portfolio/model/profile.dart';
import 'package:provider_mvc/view.dart';
import 'package:url_launcher/url_launcher.dart';

int _hash = 0;

class ProfileView extends View<ProfileController> {
  ProfileView() : super(ProfileController());

  _create(Profile profile) {
    if (profile.name == null)
      return Align(
        child: Text(
            (controller?.username != '')
                ? 'User ${controller?.username} not found!'
                : '',
            style: TextStyle(color: Colors.red)),
      );
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Profile',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Image.network(
          profile.avatarUrl,
          width: 100.0,
          height: 100.0,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return CircularProgressIndicator();
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(
            text: TextSpan(
                text: 'Html url: ',
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                      text: 'Github URL',
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => launch(profile.htmlUrl))
                ]),
          ),
        ),
        Text('Name: ${profile.name}', style: TextStyle(color: Colors.black)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Company: ${profile.company ?? ''}',
              style: TextStyle(color: Colors.black)),
        ),
        Text('Location: ${profile.location ?? ''}',
            style: TextStyle(color: Colors.black)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Email: ${profile.email ?? ''}',
              style: TextStyle(color: Colors.black)),
        ),
        Text('Bio: ${profile.bio ?? ''}',
            style: TextStyle(color: Colors.black)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Divider(),
        ),
        Text(
          'Projects',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _projectsList(profile.reposUrl),
        )
      ],
    );
  }

  Widget _projectsList(String url) {
    List<Widget> items = [];

    return FutureBuilder(
      future: controller?.loadProjects(url),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          snapshot.data.forEach((project) {
            items.add(MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  child:
                      Text(project.name, style: TextStyle(color: Colors.blue)),
                  onTap: () => launch(project.htmlUrl),
                )));
            items.add(Padding(
              padding: const EdgeInsets.all(4.0),
            ));
          });
          return Column(children: items);
        }
        return CircularProgressIndicator();
      },
    );
  }

  @override
  Widget builder(
          BuildContext context, ProfileController controller, Widget widget) =>
      FutureBuilder(
        future: controller.loadProfile(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (_hash != snapshot.data.hashCode) {
              _hash = snapshot.data.hashCode;
              return _create(snapshot.data);
            }
          }
          return LinearProgressIndicator();
        },
      );
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:portfolio/model/profile.dart';
import 'package:portfolio/model/project.dart';
import 'package:provider_mvc/controller.dart';

class ProfileController extends Controller {
  String username = '';

  Future loadProfile() async {
    if (username != '') {
      var response = await http.get('https://api.github.com/users/$username');

      var data = jsonDecode(response.body);
      if (data['message'] == null) {
        return Profile(
            avatarUrl: data['avatar_url'],
            bio: data['bio'],
            company: data['company'],
            email: data['email'],
            htmlUrl: data['html_url'],
            location: data['location'],
            name: data['name'],
            reposUrl: data['repos_url']);
      }
    }

    return Profile();
  }

  Future loadProjects(String url) async {
    List projects = [];

    var response = await http.get(url);

    List data = jsonDecode(response.body);

    data.forEach((project) =>
        projects.add(Project(project['name'], project['html_url'])));

    return projects;
  }
}

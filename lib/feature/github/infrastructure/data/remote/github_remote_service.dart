import 'dart:convert';
import 'package:github/feature/github/infrastructure/models/github_model.dart';
import 'package:github/feature/login/infrastructure/data/local/token_storage.dart';
import 'package:http/http.dart' as http;

class GitHubRemoteService {
  Future<List<GitHubModel>> fetchRepositories() async {
    final token = await TokenStorage().getToken();
    final response = await http.get(
      Uri.parse('https://api.github.com/user/repos'),
      headers: {
        'Authorization': 'token $token',
        'Accept': 'application/vnd.github+json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => GitHubModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load repositories');
    }
  }
}

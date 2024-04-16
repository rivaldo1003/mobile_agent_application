import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ServiceProfile {
  String? id;
  String? name;
  String? job;
  String? createdAt;

  ServiceProfile({
    this.id,
    this.name,
    this.job,
    this.createdAt,
  });

  static Future<ServiceProfile> postData(String name, String job) async {
    final url = Uri.parse('https://reqres.in/api/users');
    var response = await http.post(url, body: {
      "name": name,
      "job": job,
    });

    var data = json.decode(response.body);

    return ServiceProfile(
      id: data['id'],
      name: data['name'],
      job: data['job'],
      createdAt: data['createdAt'],
    );
  }
}

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:urlshortener/urlshortener.dart' as urlshortener;

Future<String> _shortURL(String fullURL) async {
  String? url;
  final request = await http.post(
      Uri.parse('https://www.lifestylebysusa.com/a'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      body: "lsturl=$fullURL&format=json");
  var jsonBlock = jsonDecode(request.body);
  url = jsonBlock['short'];
  return url ?? fullURL;
}

Future<void> main(List<String> arguments) async {
  print('Hello world: ${urlshortener.calculate()}!');
  String shorter = await _shortURL("https://www.alexedsell.com");
  print("https://www.alexedsell.com");
  print(shorter);
}

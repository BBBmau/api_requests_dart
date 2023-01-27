import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:urlshortener/urlshortener.dart' as urlshortener;

Future<String> _shortURL(String fullURL) async {
  String? url;
  var _client = HttpClient();
  final request = await http.post(
      Uri.parse('https://www.lifestylebysusa.com/a'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      body: "lsturl=$fullURL&format=json");
  // request.headers
  //     .set(HttpHeaders.contentLengthHeader, bodyBytes.length.toString());
  // request.headers.contentType = ContentType.json;
  // print(bodyBytes);
  // request.add(bodyBytes);
  // final HttpClientResponse response = await request.close();
  //   print(response.statusCode);
  //   if (response.statusCode == 201) {
  //     url = response.headers[HttpHeaders.locationHeader]?.first;
  //   } else if (response.statusCode == 200) {
  //     await for (var contents in response.transform(Utf8Decoder())) {
  //       print(contents);
  //     }
  //   }
  // } on Exception catch (sendError) {
  //   print('Failed to shorten GitHub template URL: $sendError');
  // }

  print(request.statusCode);
  print(request.body);
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

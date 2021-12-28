import 'package:http/http.dart' as http;
import 'package:nasa_application/core/services/exporter.dart';

class NetworkExecuter {
  static Future<dynamic> getImages(
      {required Rover rover, required int sol, required String camera}) async {
    String query =
        "$baseUrl/v1/rovers/${rover.name}/photos?sol=$sol&camera=$camera&api_key=$apiKey";
    // ignore: avoid_print
    print("Query => $query");
    var response = await http.get(Uri.parse(query));
    // ignore: avoid_print
    print("Response => ${response.body}");

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> images = data['photos'];
      return images.map((e) => ResponseModel.fromJson(e));
    }
    throw StateError('Error code:' + response.statusCode.toString());
  }
}

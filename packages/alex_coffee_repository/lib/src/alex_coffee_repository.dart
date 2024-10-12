import 'dart:convert';
import 'package:alex_coffee_repository/src/alex_coffee.dart';
import 'package:http/http.dart' as http;

/// A repository for the alex coffee images.
/// The images originate from a site called "https://coffee.alexflipnote.dev/".
class AlexCoffeeRepository {
  /// Fetches the json for a single alex coffee image.
  Future<AlexCoffee> fetchCoffee() async {
    final response = await http
        .get(Uri.parse('https://coffee.alexflipnote.dev/random.json'));
    if (response.statusCode == 200) {
      return AlexCoffee.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to fetch alex coffee image data.');
    }
  }
}

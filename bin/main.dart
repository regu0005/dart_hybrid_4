import 'package:dart_hybrid_4/people_data.dart';
import 'package:dart_hybrid_4/printing.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
  Printing printer = Printing();

  try {
    // Get data from API
    var url = Uri.https('random-data-api.com', '/api/v2/users', {
      'response_type': 'json',
      'size': '10',
    });

    var response = await http.get(url);

    // Parse data if the response is OK continue
    if (response.statusCode == 200) {
      final parsedJson = jsonDecode(response.body) as List;

      List<Map<String, String>> peopleData = parsedJson.map((item) {
        return {
          'uid': item['uid'].toString(),
          'first_name': item['first_name'].toString(),
          'first_name': item['first_name'].toString(),
          'last_name': item['last_name'].toString(),
          'email': item['email'].toString(),
        };
      }).toList();

      People people = People(peopleData);

      // Simple Output
      printer.printTitle("Output");
      people.output();

      // Sort by 'option' first_name, last_name, or email
      var sortOption = "email";
      printer.printTitle("Sort by $sortOption");
      people.sort(sortOption);
      people.output();

      // Add a new person
      people.plus({
        'first_name': 'Gustavo',
        'last_name': 'Reguerin',
        'email': 'reguerin@gmail.com',
        'uid': 'abcdefgh-1234-5678-00000000',
      });
      printer.printTitle("Add person");
      people.output();

      // Remove person
      people.remove('Gustavo');
      printer.printTitle("Remove person");
      people.output();
    } else {
      print('Failed to load data. Response code: ${response.statusCode}');
    }
  } catch (e) {
    print('Caught error: $e');
  }
}

// import 'package:dart_hybrid_4/calculate.dart';
import 'package:dart_hybrid_4/people_data.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
  try {
    var url = Uri.https('random-data-api.com', '/api/v2/users', {
      'response_type': 'json',
      'size': '10',
    });

    var response = await http.get(url);
    if (response.statusCode == 200) {
      final parsedJson = jsonDecode(response.body) as List;

      List<Map<String, String>> peopleData = parsedJson.map((item) {
        return {
          'first_name': item['first_name'].toString(),
          'last_name': item['last_name'].toString(),
          'email': item['email'].toString(),
        };
      }).toList();

      People people = People(peopleData);

      people.output();
    } else {
      print('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Caught error: $e');
  }
}

// Students student = Students(peopleData);

// Simple Output
  // print.printTitle("Output");
  // student.output();

// Sort by 'option' first, last, or email
  // var sortOption = "email";
  // print.printTitle("Sort by $sortOption");
  // student.sort(sortOption);
  // student.output();

// Add a new person
  // student.plus({
  //   'first': 'Gustavo',
  //   'last': 'Reguerin',
  //   'email': 'reguerin@gmail.com',
  // });
  // print.printTitle("Add person");
  // student.output();

// Remove person
  // student.remove('Gustavo');
  // print.printTitle("Remove person");
  // student.output();

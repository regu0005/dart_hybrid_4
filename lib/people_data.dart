import 'dart:io';

class People {
  late List<Map<String, String>> people;

  People(List<Map<String, String>> people) {
    this.people = people;
  }

  void output() {
    var counter = 1;
    var countNameLimit = 12;
    var countLastLimit = 14;
    var countEmailLimit = 32;

    people.forEach((item) {
      var firstNameLength = item['first_name']?.length ?? 0;
      var lastNameLength = item['last_name']?.length ?? 0;
      var emailLength = item['email']?.length ?? 0;

      if (counter < 10) {
        stdout.write('0$counter: ');
      } else {
        stdout.write('$counter: ');
      }

      stdout.write('First: ${item['first_name']}');
      fillSpaces(firstNameLength, countNameLimit);

      stdout.write('Last: ${item['last_name']}');
      fillSpaces(lastNameLength, countLastLimit);

      stdout.write('Email: ${item['email']}');
      fillSpaces(emailLength, countEmailLimit);

      stdout.write('UID: ${item['uid']}');

      counter++;
      print('');
    });
  }

  void sort(value) {
    switch (value) {
      case 'first':
        people.sort((a, b) => a['first_name']!.compareTo(b['first_name']!));
        break;
      case 'last':
        people.sort((a, b) => a['last_name']!.compareTo(b['last_name']!));
        break;
      case 'email':
        people.sort((a, b) => a['email']!.compareTo(b['email']!));
        break;
    }
  }

  void plus(Map<String, String> person) {
    people.add(person);
  }

  void remove(value) {
    people.removeWhere((element) {
      if (value != null) {
        return element['first_name']?.contains(value) == true ||
            element['last_name']?.contains(value) == true ||
            element['email']?.contains(value) == true;
      } else {
        return false;
      }
    });
  }

  void fillSpaces(int value, int count) {
    for (var i = value; i < count; i++) {
      stdout.write(' ');
    }
  }
}

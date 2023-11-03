class People {
  late List<Map<String, String>> people;

  People(List<Map<String, String>> people) {
    this.people = people;
  }

  void output() {
    people.forEach((item) {
      print(
          'First: ${item['first_name']}, Last: ${item['last_name']}, Email: ${item['email']}');
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
}

import 'dart:io';

class Printing {
  Printing();

  void printTitle(String customTitle) {
    var countEquals = 124;

    print('');
    for (var i = 0; i < countEquals; i++) {
      stdout.write('=');
    }
    print('');
    var equalsForTitle = countEquals - customTitle.length - 2;
    var equalsEachSide = (equalsForTitle / 2).floor();

    for (var j = 0; j < equalsEachSide; j++) {
      stdout.write('=');
    }

    stdout.write(' $customTitle ');

    for (var j = 0; j < equalsEachSide; j++) {
      stdout.write('=');
    }
    if (equalsForTitle % 2 == 1) {
      stdout.write('=');
    }
    print('');
    for (var i = 0; i < countEquals; i++) {
      stdout.write('=');
    }
    print('');
  }
}

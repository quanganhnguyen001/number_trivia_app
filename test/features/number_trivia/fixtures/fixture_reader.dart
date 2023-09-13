import 'dart:io';

String fixture(String name) =>
    File('test/features/number_trivia/fixtures/$name').readAsStringSync();

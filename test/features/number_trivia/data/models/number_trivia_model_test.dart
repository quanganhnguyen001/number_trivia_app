import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia_app/features/number_trivia/data/models/number_trivia_models.dart';
import 'package:number_trivia_app/features/number_trivia/domain/entities/number_trivia_entity.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  const tNumberTriviaModel = NumberTriviaModel(text: "Test text", number: 1);

  test('should be subclass of NumberTrivia entity', () {
    expect(tNumberTriviaModel, isA<NumberTrivia>());
  });

  group('fromJson', () {
    test('should return a valid model when the JSON number is an integer', () {
      final Map<String, dynamic> jsonMap = jsonDecode(fixture('trivia.json'));
      final results = NumberTriviaModel.fromJson(jsonMap);

      expect(results, equals(tNumberTriviaModel));
    });
  });

  test(
      'should return a valid model when the JSON number is regarded as a double',
      () {
    final Map<String, dynamic> jsonMap =
        jsonDecode(fixture('trivia_double.json'));
    final results = NumberTriviaModel.fromJson(jsonMap);

    expect(results, equals(tNumberTriviaModel));
  });

  group('toJson', () {
    test('should return a JSON map containing the proper data', () {
      final results = tNumberTriviaModel.toJson();

      final expectedMap = {
        'text': 'Test text',
        'number': 1,
      };
      expect(results, expectedMap);
    });
  });
}

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:number_trivia_app/core/interfaces/usecase.dart';
import 'package:number_trivia_app/features/number_trivia/domain/entities/number_trivia_entity.dart';
import 'package:number_trivia_app/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:number_trivia_app/features/number_trivia/domain/usecases/get_random_number_trivia.dart';

import 'get_concrete_number_trivia_test.mocks.dart';

@GenerateMocks([NumberTriviaRepository])
void main() {
  late MockNumberTriviaRepository mockNumberTriviaRepository;
  late GetRandomNumberTrivia usecase;
  late NumberTrivia tNumberTrivia;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetRandomNumberTrivia(mockNumberTriviaRepository);
    tNumberTrivia = const NumberTrivia(number: 1, text: 'test');
  });

  test(
    'should get trivia from the repository',
    () async {
      //arange

      when(mockNumberTriviaRepository.getRandomNumberTrivia())
          .thenAnswer((_) async => Right(tNumberTrivia));
      //act
      final result = await usecase(NoParams());
      //assert
      expect(result, equals(Right(tNumberTrivia)));
      verify(mockNumberTriviaRepository.getRandomNumberTrivia());
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}

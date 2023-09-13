import 'package:dartz/dartz.dart';

import 'package:number_trivia_app/features/number_trivia/domain/entities/number_trivia_entity.dart';

import '../../../../core/interfaces/failure.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>>? getConcreteNumberTrivia(int number);

  Future<Either<Failure, NumberTrivia>>? getRandomNumberTrivia();
}

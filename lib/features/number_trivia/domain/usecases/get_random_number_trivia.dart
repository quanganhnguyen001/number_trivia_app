import 'package:dartz/dartz.dart';

import '../../../../core/interfaces/failure.dart';
import '../../../../core/interfaces/usecase.dart';
import '../entities/number_trivia_entity.dart';
import '../repositories/number_trivia_repository.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivia, NoParams> {
  final NumberTriviaRepository repository;

  GetRandomNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>>? call(NoParams noParams) {
    return repository.getRandomNumberTrivia();
  }
}

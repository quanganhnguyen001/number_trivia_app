// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>>? call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

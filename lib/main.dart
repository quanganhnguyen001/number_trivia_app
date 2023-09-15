import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'features/number_trivia/presentation/pages/number_trivia_page.dart';

import 'injection_container.dart' as di;
import 'package:flutter/material.dart';

import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<NumberTriviaBloc>(),
        )
      ],
      child: MaterialApp(
        title: 'Number Trivia',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const NumberTriviaPage(),
      ),
    );
  }
}

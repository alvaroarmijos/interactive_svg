import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interactive_svg/src/features/map/src/bloc/map_page_bloc.dart';
import 'package:interactive_svg/src/features/map/src/pages/map_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapPageBloc(),
      child: const MaterialApp(
        title: 'Interactive SVG',
        home: MapPage(),
      ),
    );
  }
}

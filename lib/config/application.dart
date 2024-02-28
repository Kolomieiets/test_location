import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_location/features/location/provider/location_screen_provider.dart';
import 'package:test_location/features/name/name_screen.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocationScreenProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Test Location',
        home:  const NameScreen(),
        theme: ThemeData(canvasColor: Colors.transparent, brightness: Brightness.dark),
      ),
    );
  }
}

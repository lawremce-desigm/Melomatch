import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shazamclome/homepage.dart';
import 'package:shazamclome/themeprovider.dart'; // Make sure to import your provider file

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final isDarkMode = ref.watch(themeProvider);

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Shazam Clone',
          theme: ThemeData(
            primarySwatch: Colors.blue, // Light mode primary color swatch
           scaffoldBackgroundColor: Colors.green, // Light mode secondary color
            // Other light mode theme configurations...
          ),
          darkTheme: ThemeData(
            primarySwatch: Colors.indigo, // Dark mode primary color swatch
            scaffoldBackgroundColor: Colors.amber, // Dark mode secondary color
            // Other dark mode theme configurations...
          ),
          themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: Homepage(),
        );
      },
    );
  }
}

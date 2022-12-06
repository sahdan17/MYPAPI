import 'package:flutter/material.dart';
import 'package:mypapi_feext/views/login.dart';
import 'package:mypapi_feext/views/menu.dart';

void main() {
  runApp(const MyApp());
}

// stateless widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: Colors.green
        // fonts Family
        fontFamily: 'Poppins',
      ),
      // home: const RootPage(),
      // home: const Chatty(),
      routes: {
        //'/': (context) => const SplashPage(),
        '/home': (context) => const Menu(),
        //'/login': (context) => Login(),
        '/': (context) => Login(),
        //'/profile': (context) => Profile(),
        //'/root_page': (context) => const RootPage(),
        //'/chatty': (context) => const Chatty(),
        //'/album': (context) => const AlbumPage(),
        //'/postpage': (context) => const PostPage(),
      },
    );
  }
}

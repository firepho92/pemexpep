import 'package:flutter/material.dart';
import 'package:pemexpep/Components/AppContainer.dart';
import 'package:pemexpep/Providers/ViewsProvider.dart';
import 'package:provider/provider.dart';
import '';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ViewsProvider>(create: (_) => ViewsProvider(),)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Nunito',
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
            color: Color.fromARGB(255, 11, 35, 30),
          ),
          iconTheme: IconThemeData(
            color: Color.fromARGB(255, 255, 255, 255)
          ),
          scaffoldBackgroundColor: Color.fromARGB(255, 239, 240, 244),
          cardTheme: CardTheme(color: Color.fromARGB(255, 255, 255, 255), elevation: 10),
          bottomAppBarColor: Color.fromARGB(255, 11, 35, 30),
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AppContainer()
      ),
    );
  }
}

import 'package:doraemon/hp1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'new.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FindState>(create: (context)=>FindState(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
         primarySwatch: Colors.blue,
        ),
        home:const hp()
    ));
  }
}
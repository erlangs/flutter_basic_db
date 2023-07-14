import 'package:flutter/material.dart';
import 'app.dart';

void main() async{
  await init();
  runApp(MyApp());
}

init() async {
  var packageName = 'com.xx.xx';
  await appInit(packageName: packageName);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

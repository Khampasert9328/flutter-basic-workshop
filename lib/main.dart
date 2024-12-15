

import 'package:flutter/material.dart';
import 'package:gennexs_workshop_flutter_basic/GetData/get_data.dart';
import 'package:gennexs_workshop_flutter_basic/Listview/listview.dart';
import 'package:gennexs_workshop_flutter_basic/Login/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
       ChangeNotifierProvider(create: (context)=>GetData()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ListviewPage(),
      ),
    );
  }
}



import 'package:daily5/models/myuser.dart';
import 'package:daily5/pages/splashpage.dart';
import 'package:daily5/pages/welcomepage.dart';
import 'package:daily5/pages/wrapper.dart';
import 'package:daily5/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(StreamProvider<MyUser?>.value(
    initialData: null,
    value: AuthService().user,
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Wrapper()
    ),
  ));
}




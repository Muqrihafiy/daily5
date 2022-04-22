import 'package:daily5/models/myuser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/iconfile.dart';



class SplashPage extends StatelessWidget{
  int duration = 0;
  Widget goToPage;

  SplashPage({required this.goToPage,required this.duration });

  @override
  Widget build(BuildContext context) {


    Future.delayed(Duration(seconds: this.duration),() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => this.goToPage)
      );
    });


    return Scaffold(
        body: Container(
            color: Color(0xFFAED581),
            alignment: Alignment.center,
            child: IconFont()
        )
    );
  }
}
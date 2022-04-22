import 'package:daily5/models/myuser.dart';
import 'package:daily5/pages/mainmenu.dart';
import 'package:daily5/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatelessWidget{

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        body: Container(
          color: Colors.black,
          child: Stack(
            children: [
              Positioned.fill(
                  child:Opacity(
                    opacity: 0.3,
                    child: Image.asset('android/assets/img/mosque.png',
                        fit: BoxFit.cover),
                  )
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Container(
                        width:180,
                        height: 180,
                        color: Color(0xFFAED581),

                      ),
                    ),
                    SizedBox(height: 50),
                    Text('Daily5',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold
                        )
                    ),
                    SizedBox(height:40),
                    Text('Track you solat 5 times a day',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18
                      ),
                    ),
                    SizedBox(height:40),
                    FlatButton(
                        onPressed: () async{
                          dynamic result = await _auth.signInAnon();
                          if (result == null){
                            print('error');
                          }else {
                            print('sign in');
                            print (result.uid);
                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => mainmenu()
                          )
                          );
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        color: Color(0xFFAED581),
                        padding: EdgeInsets.all(25),
                        child: Text('Welcome!',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            )
                        )
                    )
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}


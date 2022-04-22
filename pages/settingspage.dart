import 'package:daily5/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'mainmenu.dart';

class settingspage extends StatefulWidget{

  @override
  _SettingPageState createState() => _SettingPageState();
}
class _SettingPageState extends State<settingspage> {

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('SettingsUI', style: TextStyle(fontSize: 22)),
        leading: IconButton(
          onPressed: (){ Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => mainmenu()
              )
          );},
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          )
        ),
        actions: <Widget>[ FlatButton.icon(
              onPressed:() async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label:Text('logout'))
     ]
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(height:40),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.lime,
                ),
                SizedBox(width:10),
                Text("Account",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
              ],
            ),
            Divider(height: 20, thickness: 1),
            SizedBox(height:10),
            buildAccountOption(context, "Language"),
            buildAccountOption(context, "Location"),

          ],
        ),
      ),
    );
  }
}GestureDetector buildAccountOption (BuildContext context, String title){
  return GestureDetector(
    onTap: (){
      showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          title: Text(title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("option 1"),
              Text("option 2")
            ],
          ),
          actions:[
            TextButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text("close"))
          ]
        );
      },
      );
    },
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal:20),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600]
                )),
                Icon(Icons.arrow_back_ios_new, color: Colors.grey),

              ],
          ),
      ),
  );
}

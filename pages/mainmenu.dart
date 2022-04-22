import 'package:daily5/models/category.dart';
import 'package:daily5/pages/settingspage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'about.dart';

class mainmenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.lime,
        elevation:0.0,
      ),
      body: Container(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom:10),
                  child: Text('testing',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black)
                  ),
                ),
                OutlinedButton(
                  onPressed: () { },
                  child: const Text('Outlined Button'),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                      backgroundColor: MaterialStateProperty.all(Colors.grey[500]),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.all(40)),
                      textStyle: MaterialStateProperty.all(
                          const TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
                ),
                )
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lime,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      color: Colors.black.withOpacity(0.2),
                      offset: Offset.zero
                    )
                  ]
                ),
                height: 100,
                padding: EdgeInsets.only(bottom:20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ClipOval(
                     child:Material(
                       child: IconButton(
                         icon: Icon(Icons.favorite, color: Colors.lime),
                          onPressed: (){
                          },
                        ),
                       ),
                      ),
                    ClipOval(
                      child:Material(
                        child: IconButton(
                          icon: Icon(Icons.pin_drop, color: Colors.lime),
                          onPressed: (){Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => category()
                              )
                          );
                          },
                        ),
                      ),
                    ),
                    ClipOval(
                      child:Material(
                        child: IconButton(
                          icon: Icon(Icons.pin_drop, color: Colors.lime),
                          onPressed: (){},
                        ),
                      ),
                    ),
                    ClipOval(
                      child:Material(
                        child: IconButton(
                          icon: Icon(Icons.pin_drop, color: Colors.lime),
                          onPressed: (){},
                        ),
                      ),
                    ),
                    ClipOval(
                      child:Material(
                        child: IconButton(
                          icon: Icon(Icons.settings, color: Colors.lime),
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => settingspage()
                                )
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                )
              ),
            )
          ],
        )
      )
    );
  }
}
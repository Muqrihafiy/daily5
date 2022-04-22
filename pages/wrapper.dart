import 'package:daily5/pages/splashpage.dart';
import 'package:daily5/pages/welcomepage.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:daily5/models/myuser.dart';

import 'mainmenu.dart';

class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    print(user);
    if (user==null){
      return SplashPage(duration: 3, goToPage: WelcomePage());
    } else {
      return mainmenu();
    }
  }
}

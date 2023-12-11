import 'package:animated_widgets/widgets/scale_animated.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:igse/adminPages/adminHomePage.dart';
import 'package:igse/homePage/presentation/homePage.dart';
import 'package:igse/routing/router.gr.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'injection.dart';
import 'loginSignup/welcomePage.dart';

void main() async {
  configureInjection(Environment.dev);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
  getIt.registerSingleton<Routera>(Routera());

}




class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (BuildContext context, AsyncSnapshot<SharedPreferences> prefs) {
          var val = prefs.data;
          if (prefs.hasData) {
            if(val!.getString('lastLogin')=='user'){
              return MaterialApp(home: HomePage(),);;
            }
            else if(val.getString('lastLogin')=='admin'){
              return MaterialApp(home: AdminHomePage(),);
            }
          }

          return MaterialApp(home: WelcomePage());
        });
  }
}


import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kodiaryflutterdemo/provider/company_listing_provider.dart';
import 'package:kodiaryflutterdemo/ui/login.dart';
import 'package:kodiaryflutterdemo/utilis/constants.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import 'model/company_listing_user_name.dart';
import 'model/local_json.dart';

Future<void> main() async {

 WidgetsFlutterBinding.ensureInitialized();
  getCompanyListingUserName();
 getLocalJson();
 LocationData? location;


 location= await Location.instance.getLocation();
 log('my weather lat${location.latitude.toString()}');
 log('my weather lat${location.longitude.toString()}');

 Constants.latitude = location.latitude;
 Constants.longitude = location.longitude;


 runApp(
     MultiProvider(
       providers: [
         ChangeNotifierProvider<CompanyListingProvider>(create: (_) => CompanyListingProvider()),
       ],
       child: MyApp(),
     )

 );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login()
    );
  }
}



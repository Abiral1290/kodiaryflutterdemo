

import 'package:flutter/material.dart';

import '../model/company_listing_user_name.dart';
import '../model/login.dart';

class CompanyListingProvider extends ChangeNotifier{

  List<CompanyListingUserName> companylist =[];

   TextEditingController? textEditingControllerEmail;
   TextEditingController? textEditingControllerPassword;

   void loginProvider(String email,String password)async{
     await login(email, password);
   }
}
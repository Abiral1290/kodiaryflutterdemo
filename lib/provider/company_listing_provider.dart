

import 'package:flutter/material.dart';

import '../model/company_listing_user_name.dart';
import '../model/login.dart';

enum Status { init, loading, success, error }

class CompanyListingProvider extends ChangeNotifier{

  Status _status = Status.init;
  Status get status => _status;


  List<CompanyListingUserName> companylist =[];

   TextEditingController? textEditingControllerEmail;
   TextEditingController? textEditingControllerPassword;

   void loginProvider(String email,String password)async{
     var response =await login(email, password);

     if(response.statusCode ==200){
      _status = Status.success;
     }
   }
}
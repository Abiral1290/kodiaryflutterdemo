import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kodiaryflutterdemo/model/company_listing_user_name.dart';
import 'package:kodiaryflutterdemo/provider/company_listing_provider.dart';
import 'package:kodiaryflutterdemo/ui/afterLogin.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
   Login({Key? key}) : super(key: key);



   TextEditingController textEditingControllerEmail = TextEditingController() ;
   TextEditingController textEditingControllerPassword =TextEditingController();

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
          child: Column(
            children: [
              TextFormField(
                controller: textEditingControllerEmail,
              //  validator: (){},
                decoration: const InputDecoration(

                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1,
                      color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:  Colors.grey, width: 1.0)),
                  border: OutlineInputBorder(gapPadding: 0),
                  helperText: ' ',
                  helperStyle: TextStyle(fontSize: 13),
                  isDense: true,
                  errorStyle: TextStyle(fontSize: 13),
                  hintText: "Enter Your Email",
                //  hintStyle: hintStyle ?? const TextStyle(fontSize: 13),
                  contentPadding: EdgeInsets.only(top:10, left: 10),

                ),
              ),
              TextFormField(
                controller:textEditingControllerPassword,
                decoration: const InputDecoration(

                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1,
                      color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 1.0)),
                  border: OutlineInputBorder(gapPadding: 0),
                  helperText: ' ',
                  helperStyle: TextStyle(fontSize: 13),
                  isDense: true,
                  errorStyle: TextStyle(fontSize: 13),
                  hintText: "Enter Your Email",
                  //  hintStyle: hintStyle ?? const TextStyle(fontSize: 13),
                  contentPadding: EdgeInsets.only(top:10, left: 10),

                ),
              ),
              ElevatedButton(onPressed: ()async{

              context.read<CompanyListingProvider>().loginProvider
                  (textEditingControllerEmail.text,
                textEditingControllerPassword.text);
              var snackBar = const SnackBar(content: Text('Sucessfully logged'));
              

              }, child: Text('Press')),
              ElevatedButton(onPressed: (){
                // if(context.read<CompanyListingProvider>().textEditingControllerEmail !=null
                //     && context.read<CompanyListingProvider>().textEditingControllerPassword != null)
                //   {
                //
                //   }

                Navigator.push(context, MaterialPageRoute(builder: (context)=> const AfterLogin()));
              }, child: const Text('Google Maps')),

            ],
          ),
      ),
    );
  }
}

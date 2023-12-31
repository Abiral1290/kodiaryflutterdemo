import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import '../utilis/api_response.dart';
import '../utilis/api_url.dart';
import '../utilis/constants.dart';
import 'package:http/http.dart' as http;


class Theme {
  String? name;
  List<Palettes>? palettes;
  String? primaryTextColor;
  String? textColor;

  Theme({this.name, this.palettes, this.primaryTextColor, this.textColor});

  Theme.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['palettes'] != null) {
      palettes = <Palettes>[];
      json['palettes'].forEach((v) {
        palettes!.add(new Palettes.fromJson(v));
      });
    }
    primaryTextColor = json['primaryTextColor'];
    textColor = json['textColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.palettes != null) {
      data['palettes'] = this.palettes!.map((v) => v.toJson()).toList();
    }
    data['primaryTextColor'] = this.primaryTextColor;
    data['textColor'] = this.textColor;
    return data;
  }
}

class Palettes {
  String? label;
  String? value;

  Palettes({this.label, this.value});

  Palettes.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['value'] = this.value;
    return data;
  }
}

Future<Apireponse<dynamic>> login(String email, String password) async {

  var header = {
    "origin" : 'https://${Constants.domain}',
  };

  var body = {"email": email, "password": password, };
  var resp = await http.post(Uri.parse(ApiUrls.login), body: body,headers: header);

  log(resp.statusCode.toString());
 // var object = jsonDecode(resp.body);
  log(resp.body);
  try {
  //  (object);
    if (resp.statusCode == 200) {

      Map<String, dynamic> object = json.decode(resp.body);
      log('my data $object');



      Theme theme = await  Theme.fromJson(object["theme"]);
      //object["theme"].cast<Map<String, dynamic>>();
      log(theme.toString());

      String color = theme.palettes!.first.value!;
      log(color);      Constants.appColor =
          Color(int.parse(color.replaceAll('#','0xFF')));
    } else {
      return Apireponse(statusCode: resp.statusCode, response:'');
    }
    return Apireponse(statusCode: resp.statusCode, response: '');
  } catch (e) {
    return Apireponse(statusCode: resp.statusCode, response: e);
  }
}

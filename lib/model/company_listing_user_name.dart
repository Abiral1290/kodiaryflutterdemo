import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:kodiaryflutterdemo/utilis/constants.dart';

import '../utilis/api_response.dart';
import '../utilis/api_url.dart';
import 'package:http/http.dart' as http;


class CompanyListingUserName {
  int? id;
  String? name;
  String? code;
  String? category;
  String? email;
  String? domain;
  Null? logo;
  Null? phone;
  String? logoUrl;
  String? status;
  bool? acceptHazardiousWaste;
  Null? statusRemarks;
  Null? details;
  Null? verifiedAt;
  List<Services>? services;

  CompanyListingUserName(
      {this.id,
        this.name,
        this.code,
        this.category,
        this.email,
        this.domain,
        this.logo,
        this.phone,
        this.logoUrl,
        this.status,
        this.acceptHazardiousWaste,
        this.statusRemarks,
        this.details,
        this.verifiedAt,
        this.services});

  CompanyListingUserName.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    category = json['category'];
    email = json['email'];
    domain = json['domain'];
    logo = json['logo'];
    phone = json['phone'];
    logoUrl = json['logo_url'];
    status = json['status'];
    acceptHazardiousWaste = json['accept_hazardious_waste'];
    statusRemarks = json['status_remarks'];
    details = json['details'];
    verifiedAt = json['verified_at'];
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    data['category'] = this.category;
    data['email'] = this.email;
    data['domain'] = this.domain;
    data['logo'] = this.logo;
    data['phone'] = this.phone;
    data['logo_url'] = this.logoUrl;
    data['status'] = this.status;
    data['accept_hazardious_waste'] = this.acceptHazardiousWaste;
    data['status_remarks'] = this.statusRemarks;
    data['details'] = this.details;
    data['verified_at'] = this.verifiedAt;
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Services {
  int? id;
  String? name;
  String? slug;
  String? host;
  String? statsApi;
  String? description;
  String? status;
  String? statusRemarks;
  String? createdAt;
  String? updatedAt;
  int? companyServiceId;

  Services(
      {this.id,
        this.name,
        this.slug,
        this.host,
        this.statsApi,
        this.description,
        this.status,
        this.statusRemarks,
        this.createdAt,
        this.updatedAt,
        this.companyServiceId});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    host = json['host'];
    statsApi = json['stats_api'];
    description = json['description'];
    status = json['status'];
    statusRemarks = json['status_remarks'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    companyServiceId = json['company_service_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['host'] = this.host;
    data['stats_api'] = this.statsApi;
    data['description'] = this.description;
    data['status'] = this.status;
    data['status_remarks'] = this.statusRemarks;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['company_service_id'] = this.companyServiceId;
    return data;
  }
}

class Meta {
  int? total;
  int? count;
  int? currentPage;
  int? lastPage;
  Null? previousPage;
  Null? nextPage;

  Meta(
      {this.total,
        this.count,
        this.currentPage,
        this.lastPage,
        this.previousPage,
        this.nextPage});

  Meta.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    count = json['count'];
    currentPage = json['current_page'];
    lastPage = json['last_page'];
    previousPage = json['previous_page'];
    nextPage = json['next_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['count'] = this.count;
    data['current_page'] = this.currentPage;
    data['last_page'] = this.lastPage;
    data['previous_page'] = this.previousPage;
    data['next_page'] = this.nextPage;
    return data;
  }
}

Future<Apireponse<List<CompanyListingUserName>>> getCompanyListingUserName() async {
  var headers = {'Accept': 'application/json'};
  log(' ${ApiUrls.companyListing}');
  var response = await http.get(Uri.parse(ApiUrls.companyListing), headers: headers);

  log(response.body);
  Map<String, dynamic> object = json.decode(response.body);

  log(response.body);
  if (response.statusCode == 200) {
    final data = await object["data"].cast<Map<String, dynamic>>();
    //  ("Data $data");
    List<CompanyListingUserName> companyList = await data.map<CompanyListingUserName>((value) {
      var userList = CompanyListingUserName.fromJson(value);

      return userList;
    }).toList();


    log('my company list ${companyList.first.domain}');
    Constants.domain = companyList.first.domain!;
    log(Constants.domain);

    return Apireponse(statusCode: response.statusCode, response: companyList);
  } else {
    return Apireponse(statusCode: response.statusCode, response: object['data']);
  }
}





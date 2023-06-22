class ApiUrls {

  ///static const String _baseUrl = 'http://192.168.99.21';
  // static const String _baseUrl = 'http://api.staging.rojgari.com';
  static const String _baseUrl = 'https://gateway.cronlink.ca';

  static String get _endpoint => _baseUrl + '/api/v1';


  static String companyListing = '$_endpoint/authentication/companies-listing?name=suman';
  static String login = '$_endpoint/authentication/login';


}

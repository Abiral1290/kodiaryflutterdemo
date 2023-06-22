

class Apireponse<T>{
  final int? statusCode;
  final T? response;

  Apireponse({this.statusCode ,this.response});

}
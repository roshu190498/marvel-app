import 'dart:convert';

import 'package:marvel_app/model/marvel_movies_model.dart';
import 'package:http/http.dart' as http;

class ApiService{


  Future<List<McuData>> getMarvelData() async{
    var marvelUrl = "https://mcuapi.herokuapp.com/api/v1/movies";
    var uri = Uri.parse(marvelUrl);
    var response =  await http.get(uri);
    var body = response.body;
    var decodeBody = jsonDecode(body);
    print(decodeBody);
    return MoviesModel.fromJson(decodeBody).data as List<McuData>;
  }

}
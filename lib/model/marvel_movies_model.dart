import 'package:flutter/material.dart';
import 'package:marvel_app/apis/api_service.dart';
import 'package:marvel_app/helpers/helper_function.dart';
import 'package:marvel_app/screens/home_screen.dart';

class MoviesModel {
  List<McuData>? data;
  int? total;

  MoviesModel({this.data, this.total});

  MoviesModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <McuData>[];
      json['data'].forEach((v) {
        data!.add(new McuData.fromJson(v));
      });
    }
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    return data;
  }
}

class McuData {
  int? id;
  String? title;
  String? releaseDate;
  String? boxOffice;
  int? duration;
  String? overview;
  String? coverUrl;
  String? trailerUrl;
  String? directedBy;
  int? phase;
  String? saga;
  int? chronology;
  int? postCreditScenes;
  String? imdbId;

  McuData(
      {this.id,
      this.title,
      this.releaseDate,
      this.boxOffice,
      this.duration,
      this.overview,
      this.coverUrl,
      this.trailerUrl,
      this.directedBy,
      this.phase,
      this.saga,
      this.chronology,
      this.postCreditScenes,
      this.imdbId});

  McuData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    releaseDate = json['release_date'];
    boxOffice = json['box_office'];
    duration = json['duration'];
    overview = json['overview'];
    coverUrl = json['cover_url'];
    trailerUrl = json['trailer_url'];
    directedBy = json['directed_by'];
    phase = json['phase'];
    saga = json['saga'];
    chronology = json['chronology'];
    postCreditScenes = json['post_credit_scenes'];
    imdbId = json['imdb_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['release_date'] = this.releaseDate;
    data['box_office'] = this.boxOffice;
    data['duration'] = this.duration;
    data['overview'] = this.overview;
    data['cover_url'] = this.coverUrl;
    data['trailer_url'] = this.trailerUrl;
    data['directed_by'] = this.directedBy;
    data['phase'] = this.phase;
    data['saga'] = this.saga;
    data['chronology'] = this.chronology;
    data['post_credit_scenes'] = this.postCreditScenes;
    data['imdb_id'] = this.imdbId;
    return data;
  }
}


class MovieManager extends ChangeNotifier {
  var _movieItems = <McuData>[];
  var _selectedIndex = -1;


  List<McuData> get movieItem => List.unmodifiable(_movieItems);

  int get selectedIndex => _selectedIndex;
  
  McuData? get selectedMovie => _selectedIndex != -1 ? _movieItems[_selectedIndex]: null;

  void movieTapped(int index){
    _selectedIndex = index;
    print(_selectedIndex.toString());
    notifyListeners();
  }

  void selectedMovieTapped(String id){
    //need this to set path
    final index = movieItem.indexWhere((element) => element.id == id);
    _selectedIndex = index;
    notifyListeners();
  }


  void getMovieData() async { 
    print('getMovieData called');
    _movieItems = await ApiService().getMarvelData();
    print(_movieItems.length);
    notifyListeners();
  }
  
  
}
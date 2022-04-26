import 'package:flutter/material.dart';
import 'package:marvel_app/model/app_state_manager.dart';
import 'package:marvel_app/model/marvel_movies_model.dart';
import 'package:marvel_app/router/movie_router_delegate.dart';
import 'package:marvel_app/screens/home_screen.dart';
import 'package:marvel_app/screens/sign_up_screen.dart';
import 'package:marvel_app/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MarvelApp());
}


class MarvelApp extends StatefulWidget {
  const MarvelApp({ Key? key }) : super(key: key);

  @override
  State<MarvelApp> createState() => _MarvelAppState();
}

class _MarvelAppState extends State<MarvelApp> {

  late MovieRouterDelegate _appRouter;
  final _movieManger = MovieManager();
  final _appStateManager = AppStateManager();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _appRouter = MovieRouterDelegate(appStateManager: _appStateManager, movieManager: _movieManger);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => _appStateManager),
        ChangeNotifierProvider(create: (context)=> _movieManger)

      ],
      child: MaterialApp(
        home: Router(
          routerDelegate: _appRouter,
        ),
        
        
      ),
    );
  }
}
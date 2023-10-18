import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:endless_photo_tape/pages/photo_list_page.dart';
import 'package:endless_photo_tape/redux/reducers.dart';
import 'package:endless_photo_tape/resources/text.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'redux/state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final store = Store(appReducer,
      initialState: AppState.initialState(), middleware: [thunkMiddleware]);

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(//передаем store в StoreProvider, чтобы сообщить приложению, что store может быть использован любым, кто захочет запросить текущий state приложения.
      store: store,
      child: MaterialApp(
        title: title,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: const PhotoListPage(),
      ),
    );
  }
}
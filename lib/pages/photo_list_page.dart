import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:endless_photo_tape/config/values.dart';
import 'package:endless_photo_tape/pages/photo_card.dart';
import 'package:endless_photo_tape/redux/actions.dart';
import 'package:endless_photo_tape/redux/middleware.dart';

import '../redux/state.dart';
import '../resources/text.dart';

class PhotoListPage extends StatefulWidget {
  const PhotoListPage({super.key});

  @override
  State<StatefulWidget> createState() => ImagesListState();
}

class ImagesListState extends State {//виджет, выстраивающий бесконечный список фотографий
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(photoListTitle),
        ),
        body: RefreshIndicator(
            onRefresh: () => _refresh(context),
            child: Center(
                child: SizedBox(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: StoreConnector<AppState, AppState>(
                              converter: (store) => store.state,
                              builder: (_, state) {
                                var store = StoreProvider.of<AppState>(context);
                                if (state.photos.isEmpty) {
                                  store.dispatch(loadNextPhotoPages);
                                }
                                return ListView.builder(
                                    padding: const EdgeInsets.only(top: 15),
                                    scrollDirection: Axis.vertical,
                                    itemCount: state.photos.length,
                                    itemBuilder: (context, index) {
                                      if (index == state.photos.length - pageSize) {
                                        store.dispatch(loadNextPhotoPage);
                                      }
                                      return GestureDetector(
                                        child: PhotoCard(state.photos[index], index),
                                      );
                                    });
                              },
                            ),
                          )
                        ])
                )
            )
        )
    );
    //
  }

  Future<void> _refresh(BuildContext context) async {
    var store = StoreProvider.of<AppState>(context);
    store.dispatch(RefreshAction());
  }
}
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:photo_view/photo_view.dart';
import 'package:endless_photo_tape/models/item/photo.dart';
import 'package:endless_photo_tape/pages/like_button.dart';

import '../redux/state.dart';

class PhotoFullSizePage extends StatefulWidget {
  const PhotoFullSizePage({super.key});

  @override
  State<StatefulWidget> createState() => _FullScreenPhotoState();
}

class _FullScreenPhotoState extends State {

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.up,
      dismissThresholds: const {DismissDirection.up: 0.7},
      dragStartBehavior: DragStartBehavior.start,
      background: const ColoredBox(color: Colors.black),
      onDismissed: (_) => Navigator.of(context).pop(),
      child: StoreConnector<AppState, AppState>(
          converter: (store) => store.state,
          builder: (_, state) {
            PhotoItem currentPhoto = state.photos[state.currentPhotoIndex!];
            return Scaffold(
                appBar: AppBar(
                  leading: const CloseButton(),
                  title: Text(currentPhoto.title!),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {},
                  child: PhotoLikeButton(currentPhoto, state.currentPhotoIndex!),
                ),
                body: Center(
                  child: PhotoView(
                    minScale: PhotoViewComputedScale.contained,
                    imageProvider: CachedNetworkImageProvider(currentPhoto.imageLink!),
                  ),
                ));
          }),
    );
  }

}
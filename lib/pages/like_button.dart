import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:endless_photo_tape/redux/actions.dart';

import '../models/item/photo.dart';
import '../redux/state.dart';

class PhotoLikeButton extends StatelessWidget {//виджет дизайна и обработки нажатия кнопки like
  final PhotoItem photoItem;
  final int index;

  const PhotoLikeButton(this.photoItem, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    if (photoItem.isLicked) {
      return IconButton(
        splashRadius: 20,
        icon: const Icon(Icons.favorite_outlined),
        color: Colors.redAccent,
        onPressed: () => _likeButtonPressed(context),
      );
    }
    return IconButton(
      splashRadius: 20,
      icon: const Icon(Icons.favorite_border),
      onPressed: () => _likeButtonPressed(context),
    );
  }

  void _likeButtonPressed(BuildContext context) {
    var store = StoreProvider.of<AppState>(context);
    store.dispatch(LikeAction(photoItem, index));
  }
}
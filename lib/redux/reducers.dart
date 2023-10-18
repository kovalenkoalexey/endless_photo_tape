import 'dart:math';

import 'package:endless_photo_tape/redux/actions.dart';

import '../models/item/photo.dart';
import 'state.dart';

AppState appReducer(AppState state, dynamic action) {//обработчик actions, имеет доступ к текущему состоянию и экшену, который ждет обработки
  if (action is LoadPhotosAction) {//в зависимости от того или иного action возвращает то или иное состояние
    return _loadPhotos(action);
  }
  if (action is LikeAction) {
    return _likeImage(state, action);
  }
  if (action is OpenPhotoAction) {
    return _openPhoto(state, action);
  }
  if (action is RefreshAction) {
    return _initRandomState();
  }

  return state;
}

AppState _loadPhotos(LoadPhotosAction action) {
  return AppState.init(action.photos, action.page);
}

AppState _likeImage(AppState state, LikeAction action) {
  List<PhotoItem> result = List.from(state.photos);
  PhotoItem photo = PhotoItem(
      action.photo.title, action.photo.imageLink, !action.photo.isLicked);
  result[action.index] = photo;
  return AppState(result, state.page, state.currentPhotoIndex);
}

AppState _openPhoto(AppState state, OpenPhotoAction action) {
  return AppState.copy(state, action.index);
}

AppState _initRandomState() {
  int page = Random().nextInt(15);
  return AppState.init(List.empty(), page);
}
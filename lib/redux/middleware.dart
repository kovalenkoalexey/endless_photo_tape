import 'package:redux/redux.dart';
import 'package:endless_photo_tape/models/item/photo.dart';
import 'package:endless_photo_tape/redux/actions.dart';
import 'package:redux_thunk/redux_thunk.dart';

import '../data/repository.dart';
import '../models/dto/photo.dart';
import 'state.dart';

final Repository repository = Repository.getInstance();

ThunkAction<AppState> loadNextPhotoPage = (Store<AppState> store) async {//промежуточный слой, позволяющий вызывать создателей действий, которые возвращают функцию вместо объекта действия
  PhotoPage photoPage = await repository.nextPage(store.state.page);//

  List<PhotoItem> result = [];
  result.addAll(store.state.photos);
  for (var p in photoPage.photo!) {
    result.add(PhotoItem.fromPhoto(p));
  }

  store.dispatch(LoadPhotosAction(result, store.state.page + 1));//метод вызова экшена, который обрабатывается одним из редьюсеров
};

ThunkAction<AppState> loadNextPhotoPages = (Store<AppState> store) async {
  int pageCount = 3;
  PhotoPage photoPage =
  await repository.getPageByCount(store.state.page, pageCount);

  List<PhotoItem> result = [];
  result.addAll(store.state.photos);
  for (var p in photoPage.photo!) {
    result.add(PhotoItem.fromPhoto(p));
  }

  store.dispatch(LoadPhotosAction(result, store.state.page + pageCount));
};
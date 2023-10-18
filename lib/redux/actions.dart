import '../models/item/photo.dart';

class LoadPhotosAction {//идентификаторы событий, которые хранят в себе payload для передачи нужных параметров в reducer позволяющее вызывать создателей действий, которые возвращают функцию вместо объекта действия
  final List<PhotoItem> _photos;
  final int _page;

  LoadPhotosAction(this._photos, this._page);

  int get page => _page;

  List<PhotoItem> get photos => _photos;
}

class LikeAction {
  final PhotoItem _photo;
  final int _index;

  LikeAction(this._photo, this._index);

  int get index => _index;

  PhotoItem get photo => _photo;
}

class OpenPhotoAction {
  final int _index;

  OpenPhotoAction(this._index);

  int get index => _index;
}


class RefreshAction {
  RefreshAction();
}
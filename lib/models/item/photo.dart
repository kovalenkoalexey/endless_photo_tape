import '../../utils/utils.dart';
import '../dto/photo.dart';

class PhotoItem {//класс изображения
  final String? _title;
  final String? _imageLink;
  final bool _isLicked;

  PhotoItem(this._title, this._imageLink, this._isLicked);

  PhotoItem.fromPhoto(Photo photo)
      : _title = photo.title,
        _imageLink = createImageLink(photo),
        _isLicked = false;

  bool get isLicked => _isLicked;

  String? get imageLink => _imageLink;

  String? get title => _title;
}
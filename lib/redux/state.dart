import '../models/item/photo.dart';

class AppState {//состояния, которые возвращаются в UI, который перерисовывается в соответствии с этим возвращенным состоянием
  final List<PhotoItem> _photos;
  final int _page;
  int? _currentPhotoIndex;

  AppState(this._photos, this._page, this._currentPhotoIndex);
  AppState.init(List<PhotoItem> photos, int page): this(photos, page, null);

  AppState.initialState()
      : _photos = List.empty(),
        _page = 1;

  AppState.copy(AppState state, int index)
      : _photos = state.photos,
        _page = state.page,
        _currentPhotoIndex = index;

  List<PhotoItem> get photos => _photos;

  int get page => _page;

  int? get currentPhotoIndex => _currentPhotoIndex;
}
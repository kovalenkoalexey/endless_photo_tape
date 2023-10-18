class Photo {
  final int? _id;
  final String? _owner;
  final String? _secret;
  final String? _server;
  final String? _title;

  Photo(this._id, this._owner, this._secret, this._server, this._title);

  Photo.fromJson(Map<String, dynamic> json)
      : _id = int.parse(json['id']),
        _owner = json["owner"],
        _secret = json["secret"],
        _server = json["server"],
        _title = json["title"];

  String? get title => _title;

  String? get server => _server;

  String? get secret => _secret;

  String? get owner => _owner;

  int? get id => _id;
}

class PhotoPage {
  int? _page;
  int? _pages;
  int? _perPage;
  int? _total;
  List<Photo>? _photo;

  PhotoPage(this._page, this._pages, this._perPage, this._total, this._photo);

  PhotoPage.fromJson(Map<String, dynamic> json) {
    _page = json['page'];
    _pages = json['pages'];
    _perPage = json['perpage'];
    _total = json['total'];
    if (json['photo'] != null) {
      _photo = <Photo>[];
      json['photo'].forEach((v) => _photo!.add(Photo.fromJson(v)));
    }
  }

  List<Photo>? get photo => _photo;

  int? get total => _total;

  int? get perPage => _perPage;

  int? get pages => _pages;

  int? get page => _page;
}
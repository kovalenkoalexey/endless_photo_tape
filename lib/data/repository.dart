import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:endless_photo_tape/models/dto/photo.dart';

import '../config/values.dart';

class Repository {//хранение данных приложения
  static Repository? repo;

  static Repository getInstance() {
    repo ??= Repository();
    return repo!;
  }

  Future<PhotoPage> nextPage(int page) async {
    final url = Uri.parse(
        "$api/?method=$method&api_key=$key&format=$format&user_id=$userId&page=$page&per_page=$pageSize");
    final response = await http.get(url);
    return _parsePhotoPageResponse(response);
  }

  Future<PhotoPage> getPageByCount(int currentPage, int pageCount) async {
    final url = Uri.parse(
        "$api/?method=$method&api_key=$key&format=$format&user_id=$userId&page=$currentPage&per_page=${pageSize * pageCount}");
    final response = await http.get(url);
    return _parsePhotoPageResponse(response);
  }

  PhotoPage _parsePhotoPageResponse(response) {
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      return PhotoPage.fromJson(
          jsonDecode(body.substring(14, body.length - 1))["photos"]);
    } else {
      throw Exception("failed request");
    }
  }
}
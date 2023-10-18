import '../../config/values.dart';
import '../../models/dto/photo.dart';

String createImageLink(Photo photo) {
  return "$imageApi/${photo.server}/${photo.id}_${photo.secret}.jpg";
}
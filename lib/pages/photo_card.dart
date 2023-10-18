import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:endless_photo_tape/models/item/photo.dart';
import 'package:endless_photo_tape/pages/like_button.dart';
import 'package:endless_photo_tape/pages/photo_full_size.dart';
import 'package:endless_photo_tape/redux/actions.dart';

import '../redux/state.dart';

class PhotoCard extends StatelessWidget {
  final PhotoItem photoItem;
  final int photoIndex;

  const PhotoCard(this.photoItem, this.photoIndex, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: InkWell(
          splashColor: Colors.grey,
          onTap: () => _openFullScreenPhoto(context),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1)),
                margin: const EdgeInsets.only(bottom: 10),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: photoItem.imageLink!,
                            placeholder: (context, url) => const CircularProgressIndicator(
                              color: Colors.black,
                            ),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Row(
                            children: [
                              Text(photoItem.title!, style: const TextStyle(fontSize: 20, color: Colors.black54)
                                // Theme.of(context).textTheme.titleLarge,
                              ),
                              const Spacer(),
                              PhotoLikeButton(photoItem, photoIndex),
                            ],
                          )),
                    ],
                  ),
                ),
              )),
        ));
  }

  void _openFullScreenPhoto(BuildContext context) {
    var store = StoreProvider.of<AppState>(context);
    store.dispatch(OpenPhotoAction(photoIndex));
    Navigator.push(context, MaterialPageRoute(builder: (context) => const PhotoFullSizePage()));
  }
}
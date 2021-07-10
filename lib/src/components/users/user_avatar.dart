import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splitbill_client/src/models/user.dart';
import 'package:splitbill_client/src/services/gravatar/gravatar.dart';

class UserAvatar extends StatelessWidget {
  final User user;
  final int size;

  UserAvatar({required this.user, this.size = 45});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: Gravatar.getAvatar(user.email, size: size),
      errorWidget: (context, url, error) => Icon(Icons.error),
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CircularProgressIndicator(value: downloadProgress.progress),
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import '../../core/values/colors.dart';

class CustomNetworkImage extends StatelessWidget {
  CustomNetworkImage({
    required this.imageUrl,
    required this.width,
    required this.height,
    this.radius = 8,
  });

  final String imageUrl;
  final double width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fadeInDuration: Duration(milliseconds: 0),
      fadeOutDuration: Duration(milliseconds: 0),
      imageUrl: imageUrl,
      placeholder: (_, url) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: darkGrey700,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/app_colors.dart';
import 'package:flutter/material.dart';

class CachednetworkImage extends StatelessWidget {
  const CachednetworkImage({
    super.key, required this.url,
  });
final String url;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:url,
      fit: BoxFit.cover,
      height: 250,
      width: double.infinity,
      placeholder: (context, url) => const SizedBox(
        height: 200.0,
        child: Center(
          child: CircularProgressIndicator(
            color: AppColors.kPrimaryColor,
          ),
        ),
        
      ),
      errorWidget: (context, url, error) =>const Icon(Icons.error),
    );
  }
}


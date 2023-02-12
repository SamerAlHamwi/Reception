import '../../core/constants/app_assets.dart';
import 'package:flutter/material.dart';

class NullableImage {
  static Image build({
    required final String? image,
    final bool network = true,
    final String placeholder = AppAssets.appLogoURI,
    final BoxFit fit = BoxFit.cover,
  }) {
    if (image == null) {
      return Image.asset(
        placeholder,
        fit: fit,

      );
    }
    if (network) {
      return Image.network(
        image,
        fit: fit,
        errorBuilder: (_, __, ___) {
          return Image.asset(
            placeholder,
            fit: fit,
          );
        },
      );
    }
    return Image.asset(
      image,
      fit: fit,
    );
  }
}

import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  final bool loading;
  final Color? dropColor;
  final double? blurFactor;
  final bool onlyOpacity;
  const FullScreenLoader({
    Key? key,
    this.blurFactor,
    this.dropColor,
    this.loading = false,
    this.onlyOpacity = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!loading) {
      return const SizedBox();
    }
    final sigma = blurFactor ?? 1.0;

    return BackdropFilter(
      filter: ui.ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: dropColor ?? Colors.grey.withOpacity(0.4),
        child: onlyOpacity
            ? const SizedBox.shrink()
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}

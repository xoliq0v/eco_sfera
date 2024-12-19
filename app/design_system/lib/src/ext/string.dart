import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/services.dart' as services;
import 'package:flutter/widgets.dart';

extension StringExtDesign on String {
  Future<Uint8List> svgToUint8List({
    double targetWidth = 48,
    double targetHeight = 48,
    String? package,
  }) async {
    final path = package == null ? this : 'packages/$package/$this';
    final svgString = await services.rootBundle.loadString(path);
    final pictureInfo = await vg.loadPicture(
      SvgStringLoader(svgString),
      null,
      onError: (error, stackTrace) {
        debugPrint('Error $error');
      },
    );

    final devicePixelRatio =
        ui.PlatformDispatcher.instance.views.first.devicePixelRatio;
    final width = (targetWidth * devicePixelRatio).toInt();
    final height = (targetHeight * devicePixelRatio).toInt();

    final scaleFactor = min(
      width / pictureInfo.size.width,
      height / pictureInfo.size.height,
    );

    final recorder = ui.PictureRecorder();

    ui.Canvas(recorder)
      ..scale(scaleFactor)
      ..drawPicture(pictureInfo.picture);

    final rasterPicture = recorder.endRecording();

    final image = rasterPicture.toImageSync(width, height);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  String toKm(BuildContext context){
    return switch (context.locale.currentLanguage()) {
        AppLanguages.ru => '${this} км',
        AppLanguages.uz => '${this} km',
        AppLanguages.en => '${this} km',
    };
  }
}

extension UzbekPhoneNumberFormatter on String {
  String formatUzbekPhoneNumberMap() {
    // Remove any non-digit characters (like spaces, dashes, etc.)
    String digits = this.replaceAll(RegExp(r'\D'), '');

    // Check if it's a valid length for an Uzbek phone number
    if (digits.length == 12 && digits.startsWith('998')) {
      return '(${digits.substring(3, 5)}) ${digits.substring(5, 8)}-${digits.substring(8)}';
    } else {
      return 'Invalid number';
    }
  }
  String formatUzbekPhoneNumber() {
    // Remove any non-digit characters (like spaces, dashes, etc.)
    String digits = this.replaceAll(RegExp(r'\D'), '');

    // Check if it's a valid length for an Uzbek phone number
    if (digits.length == 12 && digits.startsWith('998')) {
      return '+998 (${digits.substring(3, 5)}) ${digits.substring(5, 8)}-${digits.substring(8)}';
    } else {
      return 'Invalid number';
    }
  }
}
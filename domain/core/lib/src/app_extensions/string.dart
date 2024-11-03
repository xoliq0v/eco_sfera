import 'dart:convert';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

extension StringExt on String {
  String removeBlankSpaces() => replaceAll(' ', '');

  String phoneUI() {
    final mask = MaskTextInputFormatter(
      mask: '+### ## ### ## ##',
      filter: {'#': RegExp('[0-9]')},
    );
    return mask.maskText(this);
  }

  String credential(String value) {
    final credentials = '$this:$value';
    return base64Encode(utf8.encode(credentials));
  }

  Future<bool> launchPhone() async {
    final url = Uri(scheme: 'tel', path: this);
    if (await canLaunchUrl(url)) {
      return launchUrl(url);
    } else {
      debugPrint('Could not launch $this');
      return false;
    }
  }
}

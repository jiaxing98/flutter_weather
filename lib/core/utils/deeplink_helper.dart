import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';

class DeepLinkHelper {
  final AppLinks _appLinks = AppLinks();
  late StreamSubscription<Uri>? _linkSubscription;

  void initDeepLink() async {
    _linkSubscription = _appLinks.uriLinkStream.listen(
      (uriValue) {
        print(' you will listen any url updates ');
        print(' here you can redirect from url as per your need ');
      },
      onError: (err) {
        debugPrint('====>>> error : $err');
      },
      onDone: () {
        _linkSubscription?.cancel();
      },
    );
  }
}

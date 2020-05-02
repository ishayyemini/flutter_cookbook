import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'components/home/home.dart';

class FluroRouter {
  static Router router = Router();

  static Handler _homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return HomePage();
    },
  );

  static void setupRouter() {
    router.define('/', handler: _homeHandler);
  }
}

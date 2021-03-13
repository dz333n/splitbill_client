import 'package:fluro/fluro.dart';
import 'package:splitbill_client/src/routes/base_route.dart';
import 'package:splitbill_client/src/routes/event_details_route.dart';
import 'package:splitbill_client/src/routes/home_route.dart';
import 'package:splitbill_client/src/routes/not_found.dart';

class ApplicationRouter extends FluroRouter {}

class ApplicationRoutes {
  static List<BaseRoute> get _routes {
    return [
      HomeRoute(),
      EventDetailsRoute(),
    ];
  }

  static void configureRouter(ApplicationRouter router) {
    router.notFoundHandler = _getHandler(NotFoundRoute());

    for (var route in _routes) {
      router.define(route.templatePath, handler: _getHandler(route));
    }
  }

  static Handler _getHandler(BaseRoute route) {
    return Handler(handlerFunc: route.handler);
  }
}

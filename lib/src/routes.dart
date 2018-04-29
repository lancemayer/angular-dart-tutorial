import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'route_paths.dart' as paths;
import 'hero_list_component.template.dart' as hlct;
import 'dashboard_component.template.dart' as dct;

@Injectable()
class Routes {
  static final _heroes = new RouteDefinition(
    routePath: paths.heroes,
    component: hlct.HeroListComponentNgFactory,
  );

  static final _dashboard = new RouteDefinition(
    routePath: paths.dashboard,
    component: dct.DashboardComponentNgFactory,
  );

  RouteDefinition get dashboard => _dashboard;

  RouteDefinition get heroes => _heroes;

  final List<RouteDefinition> all = [
    _dashboard,
    _heroes,
    new RouteDefinition.redirect(path: '', redirectTo: paths.dashboard.toUrl()),
  ];
}
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_components/angular_components.dart';

import 'src/hero_service.dart';
import 'src/routes.dart';

@Component(
  selector: 'my-app',
  template: '''
  <h1>{{title}}</h1>
  <nav>
    <a [routerLink]="routes.dashboard.toUrl()"
      routerLinkActive="active">Dashboard</a>
    <a [routerLink]="routes.heroes.toUrl()"
      routerLinkActive="active">Heroes</a>
  </nav>
    <router-outlet [routes]="routes.all"></router-outlet>
  ''',
  styleUrls: ['app_component.css'],
  directives: [
    routerDirectives,
    materialDirectives,
  ],
  providers: [
    const ClassProvider(HeroService),
    const ClassProvider(Routes),
    materialProviders,
  ],
)
class AppComponent {
  final title = 'Tour de Heroes';
  final Routes routes;

  AppComponent(this.routes);
}

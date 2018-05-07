import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_components/angular_components.dart';

import 'src/hero_service.dart';
import 'src/routes.dart';

@Component(
  selector: 'my-app',
  template: '''
    <header class="material-header">
      <div class="material-header-row">
        <!--<material-button icon
            class="material-drawer-button" (trigger)="drawer.toggle()">
          <material-icon icon="menu"></material-icon>
        </material-button>-->
        <span class="material-header-title">{{title}}</span>
        <div class="material-spacer"></div>
        <nav class="material-navigation">
          <a [routerLink]="routes.dashboard.toUrl()" routerLinkActive="active">Dashboard</a>
        </nav>
        <nav class="material-navigation">
          <a [routerLink]="routes.heroes.toUrl()" routerLinkActive="active">Heroes</a>
        </nav>
        <nav class="material-navigation">
          <a href="">Link 3</a>
        </nav>
      </div>
    </header>
    <div class="my-body">
    <router-outlet [routes]="routes.all"></router-outlet>
    </div>
  ''',
  styleUrls: [
    'package:angular_components/app_layout/layout.scss.css',
    'app_component.css',
  ],
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

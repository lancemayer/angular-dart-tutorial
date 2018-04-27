import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'src/hero.dart';
import 'src/mock_heroes.dart';
import 'src/hero_component.dart';
import 'src/hero_service.dart';

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  styleUrls: ['app_component.css'],
  directives: [coreDirectives, formDirectives, HeroComponent],
  providers: [const ClassProvider(HeroService)],
)
class AppComponent implements OnInit {
  final HeroService _heroService;
  AppComponent(this._heroService);

  final title = 'Tour de Heroes';
  List<Hero> heroes;
  Hero selected;

  void ngOnInit() => _getHeroes();

  void onSelect(Hero hero) => selected = hero;

  void _getHeroes() {
    heroes = _heroService.getAll();
  }
}

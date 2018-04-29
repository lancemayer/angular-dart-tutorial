import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'dart:async';
import 'hero.dart';
import 'hero_component.dart';
import 'hero_service.dart';

@Component(
  selector: 'my-heroes',
  templateUrl: 'hero_list_component.html',
  styleUrls: ['hero_list_component.css'],
  directives: [coreDirectives, formDirectives, HeroComponent],
  providers: [const ClassProvider(HeroService)],
)
class HeroListComponent implements OnInit {
  final HeroService _heroService;
  HeroListComponent(this._heroService);
  final title = 'Tour de Heroes';

  List<Hero> heroes;
  Hero selected;

  void ngOnInit() => _getHeroes();

  void onSelect(Hero hero) => selected = hero;

  Future<void> _getHeroes() async {
    heroes = await _heroService.getAll();
  }
}

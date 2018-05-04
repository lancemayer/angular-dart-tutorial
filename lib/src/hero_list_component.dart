import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_components/angular_components.dart';

import 'dart:async';
import 'hero.dart';
import 'hero_service.dart';
import 'route_paths.dart' as paths;

@Component(
  selector: 'my-heroes',
  templateUrl: 'hero_list_component.html',
  styleUrls: ['hero_list_component.css'],
  directives: [
    materialDirectives,
    materialInputDirectives,
    coreDirectives,
    formDirectives,
  ],
  providers: [
    const ClassProvider(HeroService),
    materialProviders,
  ],
  pipes: [commonPipes],
)
class HeroListComponent implements OnInit {
  final HeroService _heroService;
  final Router _router;
  final title = 'Tour de Heroes';
  List<Hero> heroes;
  Hero selected;
  String addHeroName;

  HeroListComponent(this._heroService, this._router);

  void ngOnInit() => _getHeroes();

  void onSelect(Hero hero) => selected = hero;

  Future<void> _getHeroes() async {
    heroes = await _heroService.getAll();
  }

  Future<void> add() async {
    String name = addHeroName.trim();
    if (name.isEmpty) return null;
    heroes.add(await _heroService.create(name));
    selected = null;
    addHeroName = '';
  }

  Future<void> delete(Hero hero) async {
    await _heroService.delete(hero.id);
    heroes.remove(hero);
    if (selected ==  hero)
      selected = null;
  }

  String _heroUrl(int id) =>
      paths.hero.toUrl(parameters: {paths.idParam: id.toString()});

  Future<NavigationResult> gotoDetail() =>
      _router.navigate(_heroUrl(selected.id));
}

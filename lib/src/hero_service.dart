import 'package:angular/angular.dart';
import 'dart:async';
import 'hero.dart';
import 'mock_heroes.dart';

@Injectable()
class HeroService {
  Future<Hero> get(int id) async =>
    (await getAll()).firstWhere((hero) => hero.id == id);
  
  Future<List<Hero>> getAll() async => mockHeroes;

  Future<List<Hero>> getAllSlowly() {
    return new Future.delayed(const Duration(seconds: 2), getAll);
  }
}
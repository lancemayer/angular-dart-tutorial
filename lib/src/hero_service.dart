import 'dart:async';
import 'dart:convert';

import 'package:angular/angular.dart';
import 'package:http/http.dart';

import 'hero.dart';
// import 'mock_heroes.dart';

@Injectable()
class HeroService {
  Future<Hero> get(int id) async =>
    (await getAll()).firstWhere((hero) => hero.id == id);

  static const _heroesUrl = 'api/heroes';

  final Client _http;

  HeroService(this._http);
  
  // Future<List<Hero>> getAll() async => mockHeroes;
  Future<List<Hero>> getAll() async {
    try{
      final response = await _http.get(_heroesUrl);
      final heroes = _extractData(response)
        .map((value) => new Hero.fromJson(value))
        .toList();
      
      return heroes;
    } catch (e) {
      throw _handleError(e);
    }
  }

  dynamic _extractData(Response resp) => json.decode(resp.body)['data'];

  Exception _handleError(dynamic e) {
    print(e);
    return new Exception('Server error; cause: $e');
  }
}


  // Future<List<Hero>> getAllSlowly() {
  //   return new Future.delayed(const Duration(seconds: 2), getAll);
  // }
// }
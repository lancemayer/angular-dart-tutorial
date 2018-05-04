import 'dart:async';
import 'dart:convert';

import 'package:angular/angular.dart';
import 'package:http/http.dart';

import 'hero.dart';
// import 'mock_heroes.dart';

@Injectable()
class HeroService {
  static const _heroesUrl = 'api/heroes';

  final Client _http;
  static final _headers = {'Content-Type': 'application/json'};
  HeroService(this._http);
  
  Future<Hero> get(int id) async {
    try {
      final response = await _http.get('$_heroesUrl/$id');
      return new Hero.fromJson(_extractData(response));
    } catch (e) {
      throw _handleError(e);
    }
  }

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

  Future<Hero> create(String name) async {
    try {
      final response = await _http.post(_heroesUrl, headers: _headers, body: json.encode({'name': name}));
      return new Hero.fromJson(_extractData(response));
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<Hero> update(Hero hero) async {
    try {
      final url = '$_heroesUrl/${hero.id}';
      final response = await _http.put(url, headers: _headers, body: json.encode(hero));
      return new Hero.fromJson(_extractData(response));
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<void> delete(int id) async {
    try {
      final url = '$_heroesUrl/$id';
      await _http.delete(url, headers: _headers);
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

import 'package:pokemon/dependency_injection/features/pokemon/pokemon_injector.dart';

class Injector {
  call() {
    feature();
  }

  void feature() {
    PokemonInjector()();
  }
}

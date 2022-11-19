import 'package:get_it/get_it.dart';
import 'package:pokedex/data/pokemon_api_provider.dart';
import 'package:pokedex/domain/data/poke_api_provider.dart';
import 'package:pokedex/domain/use_case/number_pages_use_case.dart';
import 'package:pokedex/domain/use_case/pokemon_list_use_case.dart';
import 'package:pokedex/pokemon_pagination_cubit.dart';

void setup() {
  GetIt.I
      .registerLazySingleton<PokeAPIProvider>(() => PokemonAPIProviderImpl());
  GetIt.I.registerLazySingleton(
    () => PokemonListUseCase(
      provider: GetIt.I.get<PokeAPIProvider>(),
    ),
  );
  GetIt.I.registerLazySingleton(
    () => PokemonPaginationCubit(
      GetIt.I.get<PokemonListUseCase>(),
      GetIt.I.get<NumberPagesUseCase>(),
    ),
  );
  GetIt.I.registerLazySingleton(
    () => NumberPagesUseCase(
      GetIt.I.get<PokeAPIProvider>(),
    ),
  );
}

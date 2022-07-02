import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'recipe_searcher_state.dart';

class RecipeSearcherCubit extends Cubit<RecipeSearcherState> {
  RecipeSearcherCubit() : super(const RecipeSearcherState());

  Future<void> search(String query) async {
    emit(
      RecipeSearcherState(
        status: RecipeSearcherStatus.loading,
        query: query,
      ),
    );

    try {
      // Consulta a la API
      await Future<dynamic>.delayed(const Duration(seconds: 3));
      throw Exception();
      emit(
        RecipeSearcherState(
          status: RecipeSearcherStatus.loaded,
          query: query,
          // recipes: [],
        ),
      );
    } catch (e) {
      emit(
        RecipeSearcherState(
          status: RecipeSearcherStatus.error,
          query: query,
          // recipes: [],
        ),
      );
    }
  }
}

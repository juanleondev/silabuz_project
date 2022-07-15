import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:silabuz_project/recipe_searcher/models/recipe_model.dart';

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
      final url = Uri.parse('https://api.bigoven.com/recipes').replace(
        queryParameters: <String, dynamic>{
          'pg': '1',
          'rpp': '10',
          'title_kw': query,
          'api_key': 'glFUKikehWjLW900etpS564VgIzOWSW5',
        },
      );
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      final jsonMap = jsonDecode(response.body) as Map<String, dynamic>;
      final recipesList = jsonMap['Results'] as List<dynamic>;
      final recipes = <RecipeModel>[];
      for (final recipe in recipesList) {
        recipes.add(RecipeModel.fromJson(recipe as Map<String, dynamic>));
      }

      emit(
        state.copyWith(
          page: 1,
          query: query,
          status: RecipeSearcherStatus.loaded,
          recipes: recipes,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          page: 1,
          status: RecipeSearcherStatus.error,
          query: query,
        ),
      );
    }
  }

  Future<void> loadMoreInformation() async {
    emit(state.copyWith(status: RecipeSearcherStatus.loading));
    try {
      // Consulta a la API
      final url = Uri.parse('https://api.bigoven.com/recipes').replace(
        queryParameters: <String, dynamic>{
          'pg': state.page + 1,
          'rpp': '10',
          'title_kw': state.query,
          'api_key': 'glFUKikehWjLW900etpS564VgIzOWSW5',
        },
      );
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      // final jsonMap = jsonDecode(response.body) as Map<String, dynamic>;
      // final newRecipes = (jsonMap['Results'] as List<Map<String, dynamic>>)
      //     .map((json) => RecipeModel.fromJson(json))
      //     .toList();

      emit(
        state.copyWith(
          status: RecipeSearcherStatus.loaded,
          // recipes: state.recipes + newRecipes,
          page: state.page + 1,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: RecipeSearcherStatus.error,
        ),
      );
    }
  }
}

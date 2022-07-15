part of 'recipe_searcher_cubit.dart';

enum RecipeSearcherStatus {
  initial,
  loading,
  loaded,
  error,
}

class RecipeSearcherState extends Equatable {
  const RecipeSearcherState({
    this.status = RecipeSearcherStatus.initial,
    this.query = '',
    this.recipes = const <RecipeModel>[],
    this.page = 1,
  });

  final List<RecipeModel> recipes;
  final String query;
  final RecipeSearcherStatus status;
  final int page;

  RecipeSearcherState copyWith({
    RecipeSearcherStatus? status,
    String? query,
    List<RecipeModel>? recipes,
    int? page,
  }) {
    return RecipeSearcherState(
      status: status ?? this.status,
      query: query ?? this.query,
      recipes: recipes ?? this.recipes,
      page: page ?? this.page,
    );
  }

  @override
  List<Object?> get props => [recipes, query, status, page];
}

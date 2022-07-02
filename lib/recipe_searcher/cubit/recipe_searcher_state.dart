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
    this.recipes = const <dynamic>[],
  });

  final List<dynamic> recipes;
  final String query;
  final RecipeSearcherStatus status;

  RecipeSearcherState copyWith({
    RecipeSearcherStatus? status,
    String? query,
    List<dynamic>? recipes,
  }) {
    return RecipeSearcherState(
      status: status ?? this.status,
      query: query ?? this.query,
      recipes: recipes ?? this.recipes,
    );
  }

  @override
  List<Object?> get props => [recipes, query, status];
}

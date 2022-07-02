import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silabuz_project/recipe_searcher/cubit/recipe_searcher_cubit.dart';

class RecipeSearcherPage extends StatelessWidget {
  const RecipeSearcherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecipeSearcherCubit(),
      child: const ReciperSearcherView(),
    );
  }
}

class ReciperSearcherView extends StatelessWidget {
  const ReciperSearcherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            onChanged: (query) {
              context.read<RecipeSearcherCubit>().search(query);
            },
          ),
          Expanded(child: BlocBuilder<RecipeSearcherCubit, RecipeSearcherState>(
            builder: (context, state) {
              if (state.status == RecipeSearcherStatus.initial) {
                return Center(child: Text('What do we eat?'));
              }
              if (state.status == RecipeSearcherStatus.loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state.status == RecipeSearcherStatus.error) {
                return Center(
                  child: Text('Error'),
                );
              }
              return _RecipeList();
            },
          ))
        ],
      ),
    );
  }
}

class _RecipeList extends StatelessWidget {
  const _RecipeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, index) => ListTile(
        title: Text('$index'),
      ),
    );
  }
}

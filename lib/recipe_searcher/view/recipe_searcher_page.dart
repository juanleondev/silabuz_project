import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:silabuz_project/recipe_searcher/cubit/recipe_searcher_cubit.dart';
import 'package:silabuz_project/recipe_searcher/models/recipe_model.dart';

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
    const textStyle = TextStyle(fontSize: 15, fontWeight: FontWeight.bold);
    return Scaffold(
      body: Column(
        children: [
          TextField(
            onChanged: (query) {
              context.read<RecipeSearcherCubit>().search(query);
            },
          ),
          Expanded(
            child: BlocBuilder<RecipeSearcherCubit, RecipeSearcherState>(
              builder: (context, state) {
                if (state.status == RecipeSearcherStatus.initial) {
                  return Center(
                    child: Text(
                      'What do we eat?',
                      style: textStyle.copyWith(fontSize: 12),
                    ),
                  );
                }
                if (state.status == RecipeSearcherStatus.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state.status == RecipeSearcherStatus.error) {
                  return const Center(
                    child: Text('Error'),
                  );
                }
                return _RecipeList(
                  recipes: state.recipes,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class _RecipeList extends StatefulWidget {
  const _RecipeList({Key? key, required this.recipes}) : super(key: key);
  final List<RecipeModel> recipes;

  @override
  State<_RecipeList> createState() => _RecipeListState();
}

class _RecipeListState extends State<_RecipeList> {
  final RefreshController _refreshController = RefreshController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<RecipeSearcherCubit, RecipeSearcherState>(
      listener: (context, state) {
        if (state.status == RecipeSearcherStatus.loaded) {
          _refreshController.loadComplete();
        }
        if (state.status == RecipeSearcherStatus.error) {
          _refreshController.loadFailed();
        }
      },
      child: SmartRefresher(
        controller: _refreshController,
        enablePullUp: true,
        onLoading: () {
          context.read<RecipeSearcherCubit>().loadMoreInformation();
        },
        child: ListView.builder(
          itemCount: widget.recipes.length,
          itemBuilder: (_, index) => ListTile(
            leading: Hero(
              tag: widget.recipes[index].id,
              child: Image.network(
                widget.recipes[index].url,
                fit: BoxFit.contain,
              ),
            ),
            onTap: () {
              // Navigator.push<dynamic>(context, MaterialPageRoute<dynamic>(builder: (_)=> ));
            },
            title: Text(widget.recipes[index].title),
          ),
        ),
      ),
    );
  }
}

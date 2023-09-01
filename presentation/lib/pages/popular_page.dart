import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/bloc/popular_bloc/popular_bloc.dart';
import 'package:presentation/widgets/category_card_item.dart';

class PopularPage extends StatefulWidget {
  static const routeName = '/popular';
  final String? type;

  const PopularPage({Key? key, required this.type}) : super(key: key);

  @override
  PopularPageState createState() => PopularPageState();
}

class PopularPageState extends State<PopularPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => widget.type == movies
          ? context.read<PopularBloc>().add(FetchPopularMovies())
          : context.read<PopularBloc>().add(FetchPopularTvShows()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.type == movies ? 'Popular Movies' : 'Popular Tv Shows',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _setUpList(widget.type),
        ),
      ),
    );
  }

  Widget _setUpList(String? type) {
    return BlocBuilder<PopularBloc, PopularState>(
      builder: (_, state) {
        if (state is PopularLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PopularData) {
          return ListView.builder(
            itemCount: state.result.length,
            itemBuilder: (context, index) {
              final result = state.result[index];
              return CategoryCardItem(
                category: result,
                type: widget.type ?? "",
              );
            },
          );
        } else if (state is PopularError) {
          return Center(
            key: const Key("error_message"),
            child: Text(state.message),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

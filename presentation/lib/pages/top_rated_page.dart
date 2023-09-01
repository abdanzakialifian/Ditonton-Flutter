import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/bloc/top_rated_bloc/top_rated_bloc.dart';
import 'package:presentation/widgets/category_card_item.dart';

class TopRatedPage extends StatefulWidget {
  static const routeName = '/top-rated';
  final String? type;

  const TopRatedPage({Key? key, required this.type}) : super(key: key);

  @override
  TopRatedPageState createState() => TopRatedPageState();
}

class TopRatedPageState extends State<TopRatedPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => widget.type == movies
          ? context.read<TopRatedBloc>().add(FetchTopRatedMovies())
          : context.read<TopRatedBloc>().add(FetchTopRatedTvShows()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.type == movies ? 'Top Rated Movies' : 'Top Rated Tv Shows',
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0), child: _setUpList(widget.type)),
      ),
    );
  }

  Widget _setUpList(String? type) {
    return BlocBuilder<TopRatedBloc, TopRatedState>(
      builder: (_, state) {
        if (state is TopRatedLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TopRatedData) {
          return ListView.builder(
            itemCount: state.result.length,
            itemBuilder: (context, index) {
              final result = state.result[index];
              return CategoryCardItem(
                category: result,
                type: type ?? "",
              );
            },
          );
        } else if (state is TopRatedError) {
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

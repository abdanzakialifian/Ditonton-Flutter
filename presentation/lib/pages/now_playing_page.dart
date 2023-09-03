import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/bloc/now_playing_bloc/now_playing_bloc.dart';
import 'package:presentation/widgets/category_card_item.dart';

class NowPlayingPage extends StatefulWidget {
  static const routeName = "/now-playing";
  final String? type;

  const NowPlayingPage({Key? key, required this.type}) : super(key: key);

  @override
  NowPlayingPageState createState() => NowPlayingPageState();
}

class NowPlayingPageState extends State<NowPlayingPage> {
  @override
  void initState() {
    super.initState();
    widget.type == movies
        ? context.read<NowPlayingBloc>().add(FetchNowPlayingMovies())
        : context.read<NowPlayingBloc>().add(FetchAiringTodayTvShows());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.type == movies
                ? "Now Playing Movies"
                : "Airing Today Tv Shows",
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
    return BlocBuilder<NowPlayingBloc, NowPlayingState>(
      builder: (_, state) {
        if (state is NowPlayingLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is NowPlayingData) {
          return ListView.builder(
            itemCount: state.result.length,
            itemBuilder: (_, index) {
              final result = state.result[index];
              return CategoryCardItem(
                category: result,
                type: widget.type ?? "",
              );
            },
          );
        } else if (state is NowPlayingError) {
          return Center(
            key: const Key('error_message'),
            child: Text(state.message),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

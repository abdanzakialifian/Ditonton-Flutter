import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/provider/movie_notifier.dart';
import 'package:ditonton/presentation/provider/now_playing_notifier.dart';
import 'package:ditonton/presentation/widgets/movie_card_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NowPlayingPage extends StatefulWidget {
  static const ROUTE_NAME = "/now-playing";
  final String? type;

  const NowPlayingPage({Key? key, required this.type}) : super(key: key);

  @override
  _NowPlayingPageState createState() => _NowPlayingPageState();
}

class _NowPlayingPageState extends State<NowPlayingPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<NowPlayingNotifier>(context, listen: false)
          .fetchNowPlayingMovies(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.type == MOVIES ? "Now Playing Movies" : "Now Playing Tv Shows",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<MovieNotifier>(
          builder: (context, data, child) {
            if (data.nowPlayingState == RequestState.Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (data.nowPlayingState == RequestState.Loaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final movie = data.nowPlayingMovies[index];
                  return MovieCard(movie);
                },
                itemCount: data.nowPlayingMovies.length,
              );
            } else {
              return Center(
                key: Key('error_message'),
                child: Text(data.message),
              );
            }
          },
        ),
      ),
    );
  }
}

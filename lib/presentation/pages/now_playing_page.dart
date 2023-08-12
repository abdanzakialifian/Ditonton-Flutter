import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/provider/now_playing_notifier.dart';
import 'package:ditonton/presentation/widgets/category_card_item.dart';
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
    if (widget.type == MOVIES) {
      Future.microtask(
        () => Provider.of<NowPlayingNotifier>(context, listen: false)
            .fetchNowPlayingMovies(),
      );
    } else {
      Future.microtask(
        () => Provider.of<NowPlayingNotifier>(context, listen: false)
            .fetchAiringTodayTvShows(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.type == MOVIES
              ? "Now Playing Movies"
              : "Airing Today Tv Shows",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _setUpList(widget.type),
      ),
    );
  }

  Widget _setUpList(String? type) {
    return Consumer<NowPlayingNotifier>(
      builder: (context, data, child) {
        if (data.state == RequestState.Loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (data.state == RequestState.Loaded) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final result = data.data[index];
              return CategoryCardItem(
                category: result,
                type: widget.type ?? "",
              );
            },
            itemCount: data.data.length,
          );
        } else {
          return Center(
            key: Key('error_message'),
            child: Text(data.message),
          );
        }
      },
    );
  }
}

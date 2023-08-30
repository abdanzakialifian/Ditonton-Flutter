import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/provider/top_rated_notifier.dart';
import 'package:ditonton/presentation/widgets/category_card_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          ? Provider.of<TopRatedNotifier>(context, listen: false)
              .fetchTopRatedMovies()
          : Provider.of<TopRatedNotifier>(context, listen: false)
              .fetchTopRatedTvShows(),
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
    return Consumer<TopRatedNotifier>(
      builder: (_, data, __) {
        if (data.state == RequestState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (data.state == RequestState.loaded) {
          return ListView.builder(
            itemCount: data.data.length,
            itemBuilder: (context, index) {
              final result = data.data[index];
              return CategoryCardItem(
                category: result,
                type: type ?? "",
              );
            },
          );
        } else {
          return Center(
            key: const Key("error_message"),
            child: Text(data.message),
          );
        }
      },
    );
  }
}

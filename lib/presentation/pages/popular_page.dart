import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/provider/popular_notifier.dart';
import 'package:ditonton/presentation/widgets/category_card_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          ? Provider.of<PopularNotifier>(context, listen: false)
              .fetchPopularMovies()
          : Provider.of<PopularNotifier>(context, listen: false)
              .fetchPopularTvShows(),
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
    return Consumer<PopularNotifier>(
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
                type: widget.type ?? "",
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

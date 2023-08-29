import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/provider/search_notifier.dart';
import 'package:ditonton/presentation/widgets/category_card_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  static const routeName = '/search';
  final String? type;

  const SearchPage({Key? key, required this.type}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<SearchNotifier>(context, listen: false).clearSearchResult();
  }

  @override
  Widget build(BuildContext context) {
    SearchNotifier searchNotifier =
        Provider.of<SearchNotifier>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Search'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                onSubmitted: (query) {
                  searchNotifier.setQuerySearch(query);
                  if (widget.type == movies) {
                    searchNotifier.fetchMovieSearch(query);
                  } else {
                    searchNotifier.fetchTvShowSearch(query);
                  }
                },
                decoration: const InputDecoration(
                  hintText: 'Search title',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                textInputAction: TextInputAction.search,
              ),
              const SizedBox(height: 16),
              Text(
                'Search Result',
                style: kHeading6,
              ),
              searchNotifier.querySearch.isEmpty
                  ? Expanded(
                      child: Center(
                        child: Image.asset("assets/search_empty_image.png"),
                      ),
                    )
                  : _setUpList(widget.type)
            ],
          ),
        ),
      ),
    );
  }

  Widget _setUpList(String? type) {
    return Consumer<SearchNotifier>(
      builder: (context, data, child) {
        if (data.state == RequestState.loading) {
          return const Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (data.state == RequestState.loaded) {
          final result = data.searchResult;
          return Expanded(
            child: data.searchResult.isNotEmpty
                ? ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: result.length,
                    itemBuilder: (context, index) {
                      final searchResult = data.searchResult[index];
                      return CategoryCardItem(
                        category: searchResult,
                        type: type ?? "",
                      );
                    },
                  )
                : Center(
                    child: Image.asset("assets/search_empty_image.png"),
                  ),
          );
        } else {
          return Expanded(
            child: Text(data.message),
          );
        }
      },
    );
  }
}

import 'package:core/styles/text_styles.dart';
import 'package:core/utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search/presentation/bloc/search_bloc.dart';
import 'package:search/presentation/bloc/search_event.dart';
import 'package:search/presentation/bloc/search_state.dart';
import '../provider/search_notifier.dart';
import 'package:core/presentation/widgets/category_card_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  final String? type;

  const SearchPage({Key? key, required this.type}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // @override
  // void initState() {
  //   super.initState();
  //   Provider.of<SearchNotifier>(context, listen: false).clearSearchResult();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              // onSubmitted: (query) {
              //   if (widget.type == movies) {
              //     Provider.of<SearchNotifier>(context, listen: false)
              //         .fetchMovieSearch(query);
              //   } else {
              //     Provider.of<SearchNotifier>(context, listen: false)
              //         .fetchTvShowSearch(query);
              //   }
              // },
              onChanged: (value) {
                context.read<SearchBloc>().add(OnQueryChanged(query: value));
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
            _setUpList(widget.type)
          ],
        ),
      ),
    );
  }

  Widget _setUpList(String? type) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SearchHasData) {
          final result = state.result;
          return Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                final searchResult = state.result[index];
                return CategoryCardItem(
                  category: searchResult,
                  type: type ?? "",
                );
              },
              itemCount: result.length,
            ),
          );
        } else if (state is SearchError) {
          return Expanded(
            child: Center(
              child: Text(state.message),
            ),
          );
        } else {
          return Expanded(
            child: Container(),
          );
        }
      },
    );
  }
}

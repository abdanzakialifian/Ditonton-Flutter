import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/bloc/search_bloc/search_bloc.dart';
import 'package:presentation/widgets/category_card_item.dart';

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
    context.read<SearchBloc>().add(ClearResultList());
  }

  @override
  Widget build(BuildContext context) {
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
                onChanged: (value) {
                  if (widget.type == movies) {
                    context
                        .read<SearchBloc>()
                        .add(OnQueryChangedFetchMovies(value));
                  } else {
                    context
                        .read<SearchBloc>()
                        .add(OnQueryChangedFetchTvShows(value));
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
              _setUpList(widget.type)
            ],
          ),
        ),
      ),
    );
  }

  Widget _setUpList(String? type) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (_, state) {
        if (state is SearchLoading) {
          return const Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is SearchData) {
          final result = state.result;
          return Expanded(
            child: result.isNotEmpty
                ? ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: result.length,
                    itemBuilder: (context, index) {
                      final searchResult = result[index];
                      return CategoryCardItem(
                        category: searchResult,
                        type: type ?? "",
                      );
                    },
                  )
                : Center(
                    child: Image.asset(
                      "assets/search_empty_image.png",
                      height: 300,
                      width: 300,
                    ),
                  ),
          );
        } else if (state is SearchError) {
          return Expanded(
            child: Text(state.message),
          );
        } else {
          return Expanded(
            child: Center(
              child: Image.asset("assets/search_empty_image.png"),
            ),
          );
        }
      },
    );
  }
}

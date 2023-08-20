import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/styles/text_styles.dart';
import 'package:core/utils/constants.dart';
import 'package:core/utils/routes.dart';
import 'package:core/utils/state_enum.dart';
import 'package:core/domain/entities/category.dart';
import 'package:core/presentation/provider/tv_show_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TvShowsPage extends StatefulWidget {
  final String? type;

  const TvShowsPage({Key? key, required this.type}) : super(key: key);

  @override
  State<TvShowsPage> createState() => _TvShowsPageState();
}

class _TvShowsPageState extends State<TvShowsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<TvShowNotifier>(context, listen: false)
      ..fetchAiringTodayTvShows()
      ..fetchPopularTvShows()
      ..fetchTopRatedTvShows());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSubHeading(
              title: 'Airing Today',
              onTap: () => Navigator.pushNamed(
                context,
                nowPlayingPageRoute,
                arguments: widget.type,
              ),
            ),
            _getAiringTodayTvShows(),
            _buildSubHeading(
              title: 'Popular',
              onTap: () => Navigator.pushNamed(
                context,
                popularPageRoute,
                arguments: widget.type,
              ),
            ),
            _getPopularTvShows(),
            _buildSubHeading(
              title: 'Top Rated',
              onTap: () => Navigator.pushNamed(
                context,
                topRatedPageRoute,
                arguments: widget.type,
              ),
            ),
            _getTopRatedTvShows(),
          ],
        ),
      ),
    );
  }

  Widget _getAiringTodayTvShows() {
    return Consumer<TvShowNotifier>(
      builder: (context, data, child) {
        final state = data.airingTodayTvShowsState;
        if (state == RequestState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state == RequestState.loaded) {
          return _tvShowsList(data.airingTodayTvShows);
        } else {
          return const Text('Failed');
        }
      },
    );
  }

  Widget _getPopularTvShows() {
    return Consumer<TvShowNotifier>(
      builder: (context, data, child) {
        final state = data.popularTvShowsState;
        if (state == RequestState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state == RequestState.loaded) {
          return _tvShowsList(data.popularTvShows);
        } else {
          return const Text('Failed');
        }
      },
    );
  }

  Widget _getTopRatedTvShows() {
    return Consumer<TvShowNotifier>(
      builder: (context, data, child) {
        final state = data.topRatedTvShowsState;
        if (state == RequestState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state == RequestState.loaded) {
          return _tvShowsList(data.topRatedTvShows);
        } else {
          return const Text('Failed');
        }
      },
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }

  Widget _tvShowsList(List<Category> tvShows) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final tvShow = tvShows[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  detailPageRoute,
                  arguments: [tvShow.id, widget.type],
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$baseImageUrl${tvShow.posterPath}',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: tvShows.length,
      ),
    );
  }
}

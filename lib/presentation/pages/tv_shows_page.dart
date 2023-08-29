import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/category.dart';
import 'package:ditonton/presentation/pages/detail_page.dart';
import 'package:ditonton/presentation/pages/now_playing_page.dart';
import 'package:ditonton/presentation/pages/popular_page.dart';
import 'package:ditonton/presentation/pages/top_rated_page.dart';
import 'package:ditonton/presentation/provider/tv_show_notifier.dart';
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
                NowPlayingPage.routeName,
                arguments: widget.type,
              ),
            ),
            _getAiringTodayTvShows(),
            _buildSubHeading(
              title: 'Popular',
              onTap: () => Navigator.pushNamed(
                context,
                PopularPage.routeName,
                arguments: widget.type,
              ),
            ),
            _getPopularTvShows(),
            _buildSubHeading(
              title: 'Top Rated',
              onTap: () => Navigator.pushNamed(
                context,
                TopRatedPage.routeName,
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
          return _tvShowsLoading();
        } else if (state == RequestState.loaded) {
          return _tvShowsList(data.airingTodayTvShows);
        } else {
          return Center(
            child: Text(data.message),
          );
        }
      },
    );
  }

  Widget _getPopularTvShows() {
    return Consumer<TvShowNotifier>(
      builder: (context, data, child) {
        final state = data.popularTvShowsState;
        if (state == RequestState.loading) {
          return _tvShowsLoading();
        } else if (state == RequestState.loaded) {
          return _tvShowsList(data.popularTvShows);
        } else {
          return Center(
            child: Text(data.message),
          );
        }
      },
    );
  }

  Widget _getTopRatedTvShows() {
    return Consumer<TvShowNotifier>(
      builder: (context, data, child) {
        final state = data.topRatedTvShowsState;
        if (state == RequestState.loading) {
          return _tvShowsLoading();
        } else if (state == RequestState.loaded) {
          return _tvShowsList(data.topRatedTvShows);
        } else {
          return Center(
            child: Text(data.message),
          );
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

  Widget _tvShowsLoading() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const SizedBox(
            width: 140,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }

  Widget _tvShowsList(List<Category> tvShows) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tvShows.length,
        itemBuilder: (context, index) {
          final tvShow = tvShows[index];
          return Container(
            width: 140,
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  DetailPage.routeName,
                  arguments: [tvShow.id, widget.type],
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: '$baseImageUrl${tvShow.posterPath}',
                  placeholder: (context, url) => const SizedBox(
                    width: 140,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) => const SizedBox(
                    width: 140,
                    child: Center(
                      child: Icon(Icons.error),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

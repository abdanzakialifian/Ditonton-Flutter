import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:domain/entities/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/bloc/tv_show_bloc/tv_show_bloc.dart';
import 'package:presentation/pages/detail_page.dart';
import 'package:presentation/pages/now_playing_page.dart';
import 'package:presentation/pages/popular_page.dart';
import 'package:presentation/pages/top_rated_page.dart';

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
    context.read<TvShowBloc>()
      ..add(FetchAiringTodayTvShows())
      ..add(FetchPopularTvShows())
      ..add(FetchTopRatedTvShows());
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
    return BlocBuilder<TvShowBloc, TvShowContainerState>(
      builder: (_, state) {
        if (state.airingTodayTvShowsState is AiringTodayTvShowsLoading) {
          return _tvShowsLoading();
        } else if (state.airingTodayTvShowsState is AiringTodayTvShowsData) {
          final data = state.airingTodayTvShowsState as AiringTodayTvShowsData;
          return _tvShowsList(data.result);
        } else if (state.airingTodayTvShowsState is AiringTodayTvShowsError) {
          final data = state.airingTodayTvShowsState as AiringTodayTvShowsError;
          return Center(
            key: const Key('error_message'),
            child: Text(data.message),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _getPopularTvShows() {
    return BlocBuilder<TvShowBloc, TvShowContainerState>(
      builder: (_, state) {
        if (state.popularTvShowsState is PopularTvShowsLoading) {
          return _tvShowsLoading();
        } else if (state.popularTvShowsState is PopularTvShowsData) {
          final data = state.popularTvShowsState as PopularTvShowsData;
          return _tvShowsList(data.result);
        } else if (state.popularTvShowsState is PopularTvShowsError) {
          final data = state.popularTvShowsState as PopularTvShowsError;
          return Center(
            key: const Key('error_message'),
            child: Text(data.message),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _getTopRatedTvShows() {
    return BlocBuilder<TvShowBloc, TvShowContainerState>(
      builder: (_, state) {
        if (state.topRatedTvShowsState is TopRatedTvShowsLoading) {
          return _tvShowsLoading();
        } else if (state.topRatedTvShowsState is TopRatedTvShowsData) {
          final data = state.topRatedTvShowsState as TopRatedTvShowsData;
          return _tvShowsList(data.result);
        } else if (state.topRatedTvShowsState is TopRatedTvShowsError) {
          final data = state.topRatedTvShowsState as TopRatedTvShowsError;
          return Center(
            key: const Key('error_message'),
            child: Text(data.message),
          );
        } else {
          return const SizedBox.shrink();
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
        GestureDetector(
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
        itemBuilder: (_, __) {
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
            child: GestureDetector(
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
                  placeholder: (_, __) => const SizedBox(
                    width: 140,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  errorWidget: (_, __, ___) => const SizedBox(
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

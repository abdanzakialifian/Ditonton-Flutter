import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:domain/entities/category.dart';
import 'package:flutter/material.dart';
import 'package:presentation/pages/detail_page.dart';
import 'package:presentation/pages/now_playing_page.dart';
import 'package:presentation/pages/popular_page.dart';
import 'package:presentation/pages/top_rated_page.dart';
import 'package:presentation/provider/movie_notifier.dart';
import 'package:provider/provider.dart';

class MoviesPage extends StatefulWidget {
  final String? type;

  const MoviesPage({Key? key, required this.type}) : super(key: key);

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<MovieNotifier>(context, listen: false)
      ..fetchNowPlayingMovies()
      ..fetchPopularMovies()
      ..fetchTopRatedMovies());
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
              title: 'Now Playing',
              onTap: () => Navigator.pushNamed(
                context,
                NowPlayingPage.routeName,
                arguments: widget.type,
              ),
            ),
            _getNowPlayingMovies(),
            _buildSubHeading(
              title: 'Popular',
              onTap: () => Navigator.pushNamed(
                context,
                PopularPage.routeName,
                arguments: widget.type,
              ),
            ),
            _getPopularMovies(),
            _buildSubHeading(
              title: 'Top Rated',
              onTap: () => Navigator.pushNamed(
                context,
                TopRatedPage.routeName,
                arguments: widget.type,
              ),
            ),
            _getTopRatedMovies(),
          ],
        ),
      ),
    );
  }

  Widget _getNowPlayingMovies() {
    return Consumer<MovieNotifier>(
      builder: (_, data, __) {
        final state = data.nowPlayingState;
        if (state == RequestState.loading) {
          return _moviesLoading();
        } else if (state == RequestState.loaded) {
          return _moviesList(data.nowPlayingMovies);
        } else {
          return Center(
            child: Text(data.message),
          );
        }
      },
    );
  }

  Widget _getPopularMovies() {
    return Consumer<MovieNotifier>(
      builder: (_, data, __) {
        final state = data.popularMoviesState;
        if (state == RequestState.loading) {
          return _moviesLoading();
        } else if (state == RequestState.loaded) {
          return _moviesList(data.popularMovies);
        } else {
          return Center(
            child: Text(data.message),
          );
        }
      },
    );
  }

  Widget _getTopRatedMovies() {
    return Consumer<MovieNotifier>(
      builder: (_, data, __) {
        final state = data.topRatedMoviesState;
        if (state == RequestState.loading) {
          return _moviesLoading();
        } else if (state == RequestState.loaded) {
          return _moviesList(data.topRatedMovies);
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

  Widget _moviesLoading() {
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

  Widget _moviesList(List<Category> movies) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Container(
            width: 140,
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  DetailPage.routeName,
                  arguments: [movie.id, widget.type],
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: '$baseImageUrl${movie.posterPath}',
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

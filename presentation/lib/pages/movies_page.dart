import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:domain/entities/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/bloc/movie_bloc/movie_bloc.dart';
import 'package:presentation/pages/detail_page.dart';
import 'package:presentation/pages/now_playing_page.dart';
import 'package:presentation/pages/popular_page.dart';
import 'package:presentation/pages/top_rated_page.dart';

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
    context.read<MovieBloc>()
      ..add(FetchNowPlayingMovies())
      ..add(FetchPopularMovies())
      ..add(FetchTopRatedMovies());
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
    return BlocBuilder<MovieBloc, MovieContainerState>(
      builder: (_, state) {
        if (state.nowPlayingMoviesState is NowPlayingMoviesLoading) {
          return _moviesLoading();
        } else if (state.nowPlayingMoviesState is NowPlayingMoviesData) {
          final data = state.nowPlayingMoviesState as NowPlayingMoviesData;
          return _moviesList(data.result);
        } else if (state.nowPlayingMoviesState is NowPlayingMoviesError) {
          final data = state.nowPlayingMoviesState as NowPlayingMoviesError;
          return Center(
            child: Text(data.message),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _getPopularMovies() {
    return BlocBuilder<MovieBloc, MovieContainerState>(
      builder: (_, state) {
        if (state.popularMoviesState is PopularMoviesLoading) {
          return _moviesLoading();
        } else if (state.popularMoviesState is PopularMoviesData) {
          final data = state.popularMoviesState as PopularMoviesData;
          return _moviesList(data.result);
        } else if (state.popularMoviesState is PopularMoviesError) {
          final data = state.popularMoviesState as NowPlayingMoviesError;
          return Center(
            child: Text(data.message),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _getTopRatedMovies() {
    return BlocBuilder<MovieBloc, MovieContainerState>(
      builder: (_, state) {
        if (state.topRatedMoviesState is TopRatedMoviesLoading) {
          return _moviesLoading();
        } else if (state.topRatedMoviesState is TopRatedMoviesData) {
          final data = state.topRatedMoviesState as TopRatedMoviesData;
          return _moviesList(data.result);
        } else if (state.topRatedMoviesState is TopRatedMoviesError) {
          final data = state.topRatedMoviesState as TopRatedMoviesError;
          return Center(
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

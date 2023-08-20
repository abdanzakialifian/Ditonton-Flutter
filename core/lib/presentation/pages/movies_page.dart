import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/styles/text_styles.dart';
import 'package:core/utils/constants.dart';
import 'package:core/utils/routes.dart';
import 'package:core/utils/state_enum.dart';
import 'package:core/domain/entities/category.dart';
import 'package:core/presentation/provider/movie_notifier.dart';
import 'package:flutter/material.dart';
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
                nowPlayingPageRoute,
                arguments: widget.type,
              ),
            ),
            _getNowPlayingMovies(),
            _buildSubHeading(
              title: 'Popular',
              onTap: () => Navigator.pushNamed(
                context,
                popularPageRoute,
                arguments: widget.type,
              ),
            ),
            _getPopularMovies(),
            _buildSubHeading(
              title: 'Top Rated',
              onTap: () => Navigator.pushNamed(
                context,
                topRatedPageRoute,
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
      builder: (context, data, child) {
        final state = data.nowPlayingState;
        if (state == RequestState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state == RequestState.loaded) {
          return _moviesList(data.nowPlayingMovies);
        } else {
          return const Text('Failed');
        }
      },
    );
  }

  Widget _getPopularMovies() {
    return Consumer<MovieNotifier>(
      builder: (context, data, child) {
        final state = data.popularMoviesState;
        if (state == RequestState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state == RequestState.loaded) {
          return _moviesList(data.popularMovies);
        } else {
          return const Text('Failed');
        }
      },
    );
  }

  Widget _getTopRatedMovies() {
    return Consumer<MovieNotifier>(
      builder: (context, data, child) {
        final state = data.topRatedMoviesState;
        if (state == RequestState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state == RequestState.loaded) {
          return _moviesList(data.topRatedMovies);
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

  Widget _moviesList(List<Category> movies) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  detailPageRoute,
                  arguments: [movie.id, widget.type],
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$baseImageUrl${movie.posterPath}',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: movies.length,
      ),
    );
  }
}

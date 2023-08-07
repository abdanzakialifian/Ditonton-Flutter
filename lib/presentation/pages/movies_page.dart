import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/presentation/pages/detail_page.dart';
import 'package:ditonton/presentation/pages/now_playing_page.dart';
import 'package:ditonton/presentation/pages/popular_page.dart';
import 'package:ditonton/presentation/pages/top_rated_page.dart';
import 'package:ditonton/presentation/provider/movie_notifier.dart';
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
                NowPlayingPage.ROUTE_NAME,
                arguments: widget.type,
              ),
            ),
            Consumer<MovieNotifier>(builder: (context, data, child) {
              final state = data.nowPlayingState;
              if (state == RequestState.Loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state == RequestState.Loaded) {
                return _moviesList(data.nowPlayingMovies);
              } else {
                return Text('Failed');
              }
            }),
            _buildSubHeading(
              title: 'Popular',
              onTap: () => Navigator.pushNamed(
                context,
                PopularPage.ROUTE_NAME,
                arguments: widget.type,
              ),
            ),
            Consumer<MovieNotifier>(builder: (context, data, child) {
              final state = data.popularMoviesState;
              if (state == RequestState.Loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state == RequestState.Loaded) {
                return _moviesList(data.popularMovies);
              } else {
                return Text('Failed');
              }
            }),
            _buildSubHeading(
              title: 'Top Rated',
              onTap: () => Navigator.pushNamed(
                context,
                TopRatedPage.ROUTE_NAME,
                arguments: widget.type,
              ),
            ),
            Consumer<MovieNotifier>(builder: (context, data, child) {
              final state = data.topRatedMoviesState;
              if (state == RequestState.Loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state == RequestState.Loaded) {
                return _moviesList(data.topRatedMovies);
              } else {
                return Text('Failed');
              }
            }),
          ],
        ),
      ),
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }

  Widget _moviesList(List<Movie> movies) {
    return Container(
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
                  DetailPage.ROUTE_NAME,
                  arguments: movie.id,
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${movie.posterPath}',
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
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

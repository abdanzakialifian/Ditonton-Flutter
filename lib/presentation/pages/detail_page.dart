import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/common/constants.dart';
import 'package:ditonton/domain/entities/genre.dart';
import 'package:ditonton/domain/entities/category.dart';
import 'package:ditonton/domain/entities/detail.dart';
import 'package:ditonton/domain/entities/season.dart';
import 'package:ditonton/domain/entities/watchlist.dart';
import 'package:ditonton/presentation/pages/season_page.dart';
import 'package:ditonton/presentation/provider/detail_notifier.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/provider/watchlist_notifier.dart';
import 'package:ditonton/presentation/widgets/season_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  static const routeName = '/category-detail';

  final int id;
  final String type;

  const DetailPage({
    Key? key,
    required this.id,
    required this.type,
  }) : super(key: key);

  @override
  DetailPageState createState() => DetailPageState();
}

class DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (widget.type == movies) {
        Provider.of<DetailNotifier>(context, listen: false)
            .fetchMovieDetail(widget.id);
        Provider.of<WatchlistNotifier>(context, listen: false)
            .loadWatchlistStatus(widget.id);
      } else {
        Provider.of<DetailNotifier>(context, listen: false)
            .fetchTvShowDetail(widget.id);
        Provider.of<WatchlistNotifier>(context, listen: false)
            .loadWatchlistStatus(widget.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<DetailNotifier>(
        builder: (context, provider, child) {
          if (provider.detailState == RequestState.Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (provider.detailState == RequestState.Loaded) {
            return DetailContent(
              provider.detail,
              provider.recommendations,
              Provider.of<WatchlistNotifier>(context).isAddedToWatchlist,
              widget.type,
            );
          } else {
            return Text(provider.message);
          }
        },
      ),
    );
  }
}

class DetailContent extends StatelessWidget {
  final Detail detail;
  final List<Category> recommendations;
  final bool isAddedWatchlist;
  final String type;

  const DetailContent(
      this.detail, this.recommendations, this.isAddedWatchlist, this.type,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: 'https://image.tmdb.org/t/p/w500${detail.posterPath}',
            width: screenWidth,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Container(
            margin: const EdgeInsets.only(top: 48 + 8),
            child: DraggableScrollableSheet(
              builder: (context, scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                    color: kRichBlack,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  padding: const EdgeInsets.only(
                    left: 16,
                    top: 16,
                    right: 16,
                  ),
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 16),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                detail.title ?? "",
                                style: kHeading5,
                              ),
                              ElevatedButton(
                                onPressed: () async => _addWatchlist(context),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    isAddedWatchlist
                                        ? const Icon(Icons.check)
                                        : const Icon(Icons.add),
                                    const Text('Watchlist'),
                                  ],
                                ),
                              ),
                              Text(
                                _showGenres(detail.genres ?? []),
                              ),
                              Text(
                                _showDuration(detail.runtime ?? 0),
                              ),
                              Row(
                                children: [
                                  RatingBarIndicator(
                                    rating: (detail.voteAverage ?? 0) / 2,
                                    itemCount: 5,
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star,
                                      color: kMikadoYellow,
                                    ),
                                    itemSize: 24,
                                  ),
                                  Text('${detail.voteAverage}')
                                ],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Overview',
                                style: kHeading6,
                              ),
                              Text(
                                detail.overview ?? "",
                              ),
                              _setUpRecommenadation(context),
                              type == movies
                                  ? const SizedBox.shrink()
                                  : _setUpSeason(context, detail.seasons),
                              const SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          color: Colors.white,
                          height: 4,
                          width: 48,
                        ),
                      ),
                    ],
                  ),
                );
              },
              // initialChildSize: 0.5,
              minChildSize: 0.25,
              // maxChildSize: 1.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: kRichBlack,
              foregroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _addWatchlist(BuildContext context) async {
    if (!isAddedWatchlist) {
      await Provider.of<WatchlistNotifier>(context, listen: false)
          .addWatchlist(Watchlist.fromDetailToWatchlist(detail, type));
    } else {
      await Provider.of<WatchlistNotifier>(context, listen: false)
          .removeFromWatchlist(Watchlist.fromDetailToWatchlist(detail, type));
    }

    if (!context.mounted) return;

    final message =
        Provider.of<WatchlistNotifier>(context, listen: false).watchlistMessage;

    if (message == WatchlistNotifier.watchlistAddSuccessMessage ||
        message == WatchlistNotifier.watchlistRemoveSuccessMessage) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(message),
            );
          });
    }
  }

  Widget _setUpRecommenadation(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Provider.of<DetailNotifier>(context).recommendations.isNotEmpty
            ? Column(
                children: [
                  const SizedBox(height: 16),
                  Text(
                    'Recommendations',
                    style: kHeading6,
                  ),
                  const SizedBox(height: 10),
                ],
              )
            : const SizedBox.shrink(),
        Consumer<DetailNotifier>(
          builder: (context, data, child) {
            if (data.recommendationState == RequestState.Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (data.recommendationState == RequestState.Error) {
              return Text(data.message);
            } else if (data.recommendationState == RequestState.Loaded) {
              return _setUpListRecommendations();
            } else {
              return Container();
            }
          },
        )
      ],
    );
  }

  Widget _setUpListRecommendations() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final recommendation = recommendations[index];
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  DetailPage.routeName,
                  arguments: recommendation.id,
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
                child: CachedNetworkImage(
                  imageUrl:
                      'https://image.tmdb.org/t/p/w500${recommendation.posterPath}',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: recommendations.length,
      ),
    );
  }

  Widget _setUpSeason(BuildContext context, List<Season>? seasons) {
    if (seasons != null && seasons.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                detail.status == statusEnded ? "Last Season" : "Current Season",
                style: kHeading6,
              ),
              (seasons.length > 1)
                  ? InkWell(
                      onTap: () => Navigator.pushNamed(
                        context,
                        SeasonPage.ROUTE_NAME,
                        arguments: seasons,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('See More'),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 18,
                            )
                          ],
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          const SizedBox(height: 5),
          SeasonCardItem(
            season: detail.seasons?.last,
          ),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  String _showGenres(List<Genre> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name ?? ""}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }
}

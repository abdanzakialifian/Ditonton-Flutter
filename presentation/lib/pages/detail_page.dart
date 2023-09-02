import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:domain/entities/category.dart';
import 'package:domain/entities/detail.dart';
import 'package:domain/entities/genre.dart';
import 'package:domain/entities/season.dart';
import 'package:domain/entities/watchlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:presentation/bloc/detail_bloc/detail_bloc.dart';
import 'package:presentation/bloc/watchlist_bloc/watchlist_bloc.dart';
import 'package:presentation/pages/season_page.dart';
import 'package:presentation/widgets/season_card_item.dart';

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
    if (widget.type == movies) {
      context.read<DetailBloc>().add(FetchMovieDetail(widget.id));
    } else {
      context.read<DetailBloc>().add(FetchTvShowDetail(widget.id));
    }
    context.read<WatchlistBloc>().add(CheckWatchlistStatus(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DetailBloc, DetailContainerState>(
        builder: (_, state) {
          if (state.detailState is DetailLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.detailState is DetailData) {
            final data = state.detailState as DetailData;
            return DetailContent(
              data.detail,
              widget.type,
            );
          } else if (state.detailState is DetailError) {
            final data = state.detailState as DetailError;
            return Center(
              child: Text(
                data.message,
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

class DetailContent extends StatelessWidget {
  final Detail detail;
  final String type;

  const DetailContent(this.detail, this.type, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // avoid duplication appear
    int emitted = 0;

    return SafeArea(
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: 'https://image.tmdb.org/t/p/w500${detail.posterPath}',
            width: screenWidth,
            placeholder: (_, __) => SizedBox(
              width: screenWidth,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            errorWidget: (_, __, ___) => SizedBox(
              width: screenWidth,
              child: const Center(
                child: Icon(Icons.error),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 48 + 8),
            child: DraggableScrollableSheet(
              minChildSize: 0.25,
              builder: (_, scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                    color: kRichBlack,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  padding: const EdgeInsets.only(top: 16),
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 16),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      detail.title ?? "",
                                      style: kHeading5,
                                    ),
                                    BlocConsumer<WatchlistBloc, WatchlistState>(
                                      listenWhen: (_, __) => emitted == 1,
                                      listener: (_, state) {
                                        final message =
                                            state.watchlistMessage.message;

                                        if (message ==
                                                watchlistAddSuccessMessage ||
                                            message ==
                                                watchlistRemoveSuccessMessage) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(message),
                                              duration: const Duration(
                                                milliseconds: 500,
                                              ),
                                            ),
                                          );
                                        } else {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                content: Text(message),
                                              );
                                            },
                                          );
                                        }
                                        emitted++;
                                      },
                                      builder: (_, state) {
                                        final isAdded =
                                            state.watchlistStatus.isAdded;
                                        return ElevatedButton(
                                          onPressed: () async {
                                            _addWatchlist(context, isAdded);
                                            emitted = 1;
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              isAdded
                                                  ? const Icon(Icons.check)
                                                  : const Icon(Icons.add),
                                              const Text('Watchlist'),
                                            ],
                                          ),
                                        );
                                      },
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
                                          itemBuilder: (_, __) => const Icon(
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
                                  ],
                                ),
                              ),
                              _setUpRecommendation(),
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
          ),
        ],
      ),
    );
  }

  void _addWatchlist(BuildContext context, bool isAdded) {
    if (!isAdded) {
      context.read<WatchlistBloc>().add(
            AddWatchlist(
              Watchlist.fromDetailToWatchlist(detail, type),
            ),
          );
    } else {
      context.read<WatchlistBloc>().add(
            RemoveWatchlist(
              Watchlist.fromDetailToWatchlist(detail, type),
            ),
          );
    }
  }

  Widget _setUpRecommendation() {
    return BlocBuilder<DetailBloc, DetailContainerState>(
      builder: (_, state) {
        if (state.recommendationState is RecommendationLoading) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(
                    top: 16, bottom: 10, left: 16, right: 16),
                child: Text(
                  'Recommendations',
                  style: kHeading6,
                ),
              ),
              _setUpLoadingRecommendations()
            ],
          );
        } else if (state.recommendationState is RecommendationData) {
          final data = state.recommendationState as RecommendationData;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(
                    top: 16, bottom: 10, left: 16, right: 16),
                child: Text(
                  'Recommendations',
                  style: kHeading6,
                ),
              ),
              _setUpListRecommendations(data.recommendations)
            ],
          );
        } else if (state.recommendationState is RecommendationError) {
          final data = state.recommendationState as RecommendationError;
          return Center(
            child: Text(data.message),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _setUpLoadingRecommendations() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (_, __) {
          return const SizedBox(
            width: 100,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }

  Widget _setUpListRecommendations(List<Category> recommendations) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: recommendations.length,
        itemBuilder: (context, index) {
          final recommendation = recommendations[index];
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  DetailPage.routeName,
                  arguments: [recommendation.id, type],
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  width: 100,
                  imageUrl:
                      'https://image.tmdb.org/t/p/w500${recommendation.posterPath}',
                  placeholder: (context, url) => const SizedBox(
                    width: 100,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) => const SizedBox(
                    width: 100,
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

  Widget _setUpSeason(BuildContext context, List<Season>? seasons) {
    if (seasons != null && seasons.isNotEmpty) {
      return Container(
        margin: const EdgeInsets.only(
          top: 16,
          bottom: 5,
          left: 16,
          right: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  detail.status == statusEnded
                      ? "Last Season"
                      : "Current Season",
                  style: kHeading6,
                ),
                (seasons.length > 1)
                    ? InkWell(
                        onTap: () => Navigator.pushNamed(
                          context,
                          SeasonPage.routeName,
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
            SeasonCardItem(
              season: detail.seasons?.last,
            ),
          ],
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  String _showGenres(List<Genre> genres) {
    return genres.map((e) => e.name).toList().join(', ');
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

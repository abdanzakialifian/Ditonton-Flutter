import 'package:core/domain/entities/season.dart';
import 'package:core/presentation/widgets/season_card_item.dart';
import 'package:flutter/material.dart';

class SeasonPage extends StatelessWidget {
  final List<Season> seasons;

  const SeasonPage({Key? key, required this.seasons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Season Tv Show"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 6),
          itemCount: seasons.length,
          itemBuilder: (context, index) {
            final season = seasons[index];
            return SeasonCardItem(season: season);
          },
        ),
      ),
    );
  }
}

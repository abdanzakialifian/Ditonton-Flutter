import 'package:ditonton/domain/entities/season.dart';
import 'package:ditonton/presentation/widgets/season_card_item.dart';
import 'package:flutter/material.dart';

class SeasonPage extends StatelessWidget {
  static const ROUTE_NAME = '/season';

  final List<Season> seasons;

  SeasonPage({Key? key, required this.seasons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Season Tv Show"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 6),
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

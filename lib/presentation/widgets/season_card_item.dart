import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/common/constants.dart';
import 'package:ditonton/domain/entities/season.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SeasonCardItem extends StatelessWidget {
  final Season? season;

  SeasonCardItem({Key? key, required this.season}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _setUpImageSeason(),
          Flexible(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    season?.name ?? "",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 13,
                              ),
                              SizedBox(width: 2),
                              Text(
                                (season?.voteAverage ?? 0.0).toString(),
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 6),
                      Text(
                        season?.airDate?.toString().split("-")[0] ?? "",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        " \u2022 ",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        "${season?.episodeCount} Episodes",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    (season?.overview == null ||
                            season?.overview?.isEmpty == true)
                        ? "${season?.name} premiered on ${_dateFormatter()}"
                        : season?.overview ?? "",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _dateFormatter() {
    DateFormat inputFormat = DateFormat("yyyy-MM-dd");
    DateTime date = inputFormat.parse(season?.airDate.toString() ?? "");
    DateFormat outputFormat = DateFormat("MMMM dd, yyyy");
    return outputFormat.format(date);
  }

  Widget _setUpImageSeason() {
    if (season?.posterPath == null) {
      return ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        child: Container(
          width: 110,
          height: 160,
          color: Colors.grey.shade700,
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: "$BASE_IMAGE_URL${season?.posterPath}",
          width: 110,
          height: 160,
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      );
    }
  }
}

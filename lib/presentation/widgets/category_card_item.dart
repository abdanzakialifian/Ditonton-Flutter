import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/common/constants.dart';
import 'package:ditonton/domain/entities/category.dart';
import 'package:ditonton/presentation/pages/detail_page.dart';
import 'package:flutter/material.dart';

class CategoryCardItem extends StatelessWidget {
  final Category category;
  final String type;

  const CategoryCardItem({
    Key? key,
    required this.category,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            DetailPage.routeName,
            arguments: [category.id, type],
          );
        },
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Card(
              child: Container(
                margin: const EdgeInsets.only(
                  left: 16 + 80 + 16,
                  bottom: 8,
                  right: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.title ?? '-',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: kHeading6,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      category.overview ?? '-',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 16,
                bottom: 16,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: '$baseImageUrl${category.posterPath}',
                  width: 80,
                  height: 120,
                  placeholder: (context, url) => const SizedBox(
                    width: 80,
                    height: 120,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) => const SizedBox(
                    width: 80,
                    height: 120,
                    child: Center(
                      child: Icon(Icons.error),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

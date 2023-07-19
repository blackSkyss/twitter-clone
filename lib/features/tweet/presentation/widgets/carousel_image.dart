import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../../util/constants/assets_constants.dart';

class CarouselImage extends HookWidget {
  final List<String> imageLinks;
  const CarouselImage(this.imageLinks, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            CarouselSlider(
              items: imageLinks.map(
                (link) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    margin: const EdgeInsets.all(10),
                    child: CachedNetworkImage(
                      imageUrl: link,
                      placeholder: (_, __) =>
                          Image.asset(AssetsConstants.placeHolder),
                      errorWidget: (_, __, ___) => const Icon(Icons.error),
                    ),
                  );
                },
              ).toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  currentIndex.value = index;
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageLinks.asMap().entries.map((e) {
                return Container(
                  width: 12,
                  height: 12,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 4,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(
                      currentIndex.value == e.key ? 0.9 : 0.4,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        )
      ],
    );
  }
}

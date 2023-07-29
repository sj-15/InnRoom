import 'package:flutter/material.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

class HotelCard extends StatefulWidget {
  final String hotelName;
  final String location;
  final double rating;
  final List<String> imageUrls;

  const HotelCard({
    super.key,
    required this.hotelName,
    required this.location,
    required this.rating,
    required this.imageUrls,
  });

  @override
  State<HotelCard> createState() => _HotelCardState();
}

class _HotelCardState extends State<HotelCard> {
  bool isHovering = false;
  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovering = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovering = false;
        });
      },
      child: SizedBox(
        height: size.height * 0.4, // Set a constant height for the card
        width: size.width * 0.225,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Photos (80% height)
            Expanded(
              flex: isHovering ? 2 : 5,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: widget.imageUrls.length,
                      itemBuilder: (context, index) {
                        return Image.network(
                          widget.imageUrls[index],
                          fit: BoxFit.cover,
                        );
                      },
                      onPageChanged: (int page) {
                        _currentPageNotifier.value = page;
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: CirclePageIndicator(
                        currentPageNotifier: _currentPageNotifier,
                        itemCount: widget.imageUrls.length,
                        dotColor: Colors.white12,
                        selectedDotColor: Colors.deepPurpleAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Hotel details (20% height)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.hotelName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.location,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 10,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        widget.rating.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (isHovering)
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text('Book Now'),
              ),
          ],
        ),
      ),
    );
  }
}

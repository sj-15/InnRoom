import 'dart:async';
import 'package:flutter/material.dart';

class PhotoSlider extends StatefulWidget {
  const PhotoSlider({super.key});

  @override
  State<PhotoSlider> createState() => _PhotoSliderState();
}

class _PhotoSliderState extends State<PhotoSlider> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<String> photoUrls = [
    'https://www.pexels.com/photo/palm-trees-at-night-258154/',
    'https://www.pexels.com/photo/house-on-body-of-water-1450363/',
  ];
  @override
  void initState() {
    super.initState();
    // Start auto-scrolling after a delay of 3 seconds (adjust as needed)
    _startAutoScroll();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    // Set up a timer to auto-scroll every 3 seconds (adjust as needed)
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < photoUrls.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      height: 200, // Adjust the height as needed
      child: PageView.builder(
        controller: _pageController,
        itemCount: photoUrls.length,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          return Image.network(
            photoUrls[index],
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}

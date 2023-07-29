import 'dart:async';
import 'package:flutter/material.dart';

class PhotoSlider extends StatefulWidget {
  const PhotoSlider({super.key});

  @override
  State<PhotoSlider> createState() => _PhotoSliderState();
}

class _PhotoSliderState extends State<PhotoSlider> {
  PageController? _pageController;
  int _currentPage = 0;
  final List<String> photoUrls = [
    'https://images.pexels.com/photos/3887985/pexels-photo-3887985.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/1743231/pexels-photo-1743231.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/2373201/pexels-photo-2373201.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/1134176/pexels-photo-1134176.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/1450363/pexels-photo-1450363.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  ];
  Timer? _autoScrollTimer;

  @override
  void initState() {
    super.initState();
    // Start auto-scrolling after a delay of 3 seconds (adjust as needed)
    _startAutoScroll();
  }

  @override
  void dispose() {
    // Cancel the auto-scrolling timer before disposing of the widget
    _autoScrollTimer?.cancel();
    _pageController?.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    // Set up a timer to auto-scroll every 3 seconds (adjust as needed)
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < photoUrls.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController?.animateToPage(
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
      // Adjust the height as needed
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
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
      ),
    );
  }
}

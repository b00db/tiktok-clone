import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class VidoeTimelineScreen extends StatefulWidget {
  const VidoeTimelineScreen({super.key});

  @override
  State<VidoeTimelineScreen> createState() => _VidoeTimelineScreenState();
}

class _VidoeTimelineScreenState extends State<VidoeTimelineScreen> {
  int _itemCount = 5;

  final PageController _pageController = PageController();

  List<Color> colors = [
    Colors.lightBlue,
    Colors.pink,
    Colors.amber,
    Colors.indigo,
    Colors.teal,
  ];

  void _onPageChanged(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 100),
      curve: Curves.linear,
    );
    if (page == _itemCount - 1) {
      _itemCount = _itemCount + 5;

      colors.addAll([
        Colors.lightBlue,
        Colors.pink,
        Colors.amber,
        Colors.indigo,
        Colors.teal,
      ]);

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      onPageChanged: (page) => _onPageChanged(page),
      itemCount: colors.length,
      itemBuilder: (context, index) => Container(
        color: colors[index],
        child: Center(
          child: Text(
            "Screen $index",
            style: const TextStyle(
              color: Colors.white,
              fontSize: Sizes.size64,
            ),
          ),
        ),
      ),
    );
  }
}

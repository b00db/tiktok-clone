import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/videos/widgets/video_post.dart';

class VidoeTimelineScreen extends StatefulWidget {
  const VidoeTimelineScreen({super.key});

  @override
  State<VidoeTimelineScreen> createState() => _VidoeTimelineScreenState();
}

class _VidoeTimelineScreenState extends State<VidoeTimelineScreen> {
  int _itemCount = 5;

  final PageController _pageController = PageController();

  final Duration _scrollDuration = const Duration(milliseconds: 300);
  final Curve _scrollCurve = Curves.linear;

  void _onPageChanged(int page) {
    _pageController.animateToPage(
      page,
      duration: _scrollDuration,
      curve: _scrollCurve,
    );
    if (page == _itemCount - 1) {
      _itemCount = _itemCount + 5;
      setState(() {});
    }
  }

  void _onVideoFinished() {
    _pageController.nextPage(
      duration: _scrollDuration,
      curve: _scrollCurve,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      onPageChanged: (page) => _onPageChanged(page),
      itemCount: _itemCount,
      itemBuilder: (context, index) =>
          VideoPost(onVideoFinished: _onVideoFinished),
    );
  }
}

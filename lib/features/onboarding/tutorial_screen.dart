import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/navigation/main_navigation_screen.dart';
import 'package:tiktok_clone/features/onboarding/widgets/tutorial_text.dart';

enum Direction { up, down }

enum Page { first, second }

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Direction _direction = Direction.up;
  Page _showingPage = Page.first;

  void _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dy > 0) {
      if (_direction == Direction.down) return;
      setState(() {
        _direction = Direction.down;
      });
    } else {
      if (_direction == Direction.up) return;
      setState(() {
        _direction = Direction.up;
      });
    }
  }

  void _onPanEnd(DragEndDetails details) {
    if (_direction == Direction.up) {
      if (_showingPage == Page.second) return;
      setState(() {
        _showingPage = Page.second;
      });
    } else {
      if (_showingPage == Page.first) return;
      setState(() {
        _showingPage = Page.first;
      });
    }
  }

  void _onTap() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const MainNavigationScreen(),
        ),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
            child: AnimatedCrossFade(
              firstChild: const TutorialText(text: "Swipe up"),
              secondChild: const TutorialText(text: "Start watching"),
              crossFadeState: _showingPage == Page.first
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 300),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size24,
              horizontal: Sizes.size24,
            ),
            child: AnimatedOpacity(
              opacity: _showingPage == Page.first ? 0 : 1,
              duration: const Duration(milliseconds: 300),
              child: GestureDetector(
                onTap: _onTap,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: Sizes.size16,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                  child: const Text(
                    'Start watching',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: Sizes.size16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class TutorialText extends StatelessWidget {
  final String text;

  const TutorialText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gaps.v80,
        Text(
          text,
          style: const TextStyle(
            fontSize: Sizes.size40,
            fontWeight: FontWeight.bold,
          ),
        ),
        Gaps.v16,
        const Text(
          "Videos are personalized for you based on what you watch, like, and share.",
          style: TextStyle(
            fontSize: Sizes.size20,
          ),
        ),
      ],
    );
  }
}

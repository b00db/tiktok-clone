import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class PostVideoButton extends StatelessWidget {
  const PostVideoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Sizes.size16),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: 12,
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: const Color(0xff61D4F0),
                borderRadius: BorderRadius.circular(Sizes.size10),
              ),
            ),
          ),
          Positioned(
            left: 12,
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(Sizes.size10),
              ),
            ),
          ),
          Container(
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Sizes.size8),
            ),
            child: const Center(
              child: FaIcon(
                FontAwesomeIcons.plus,
                color: Colors.black,
                size: Sizes.size16,
              ),
            ),
          )
        ],
      ),
    );
  }
}

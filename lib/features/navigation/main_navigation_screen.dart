import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/navigation/widgets/nav_tab.dart';
import 'package:tiktok_clone/features/navigation/widgets/post_video_button.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  void _onTap(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostVideoButtonTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: const Text('Record video')),
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const Center(
              child: Text('0'),
            ),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const Center(
              child: Text('1'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavTab(
                icon: FontAwesomeIcons.house,
                text: "Home",
                isSelected: _selectedIndex == 0,
                onTab: () => _onTap(0),
              ),
              NavTab(
                icon: FontAwesomeIcons.magnifyingGlass,
                text: "Discover",
                isSelected: _selectedIndex == 1,
                onTab: () => _onTap(1),
              ),
              Gaps.h24,
              GestureDetector(
                onTap: _onPostVideoButtonTap,
                child: const PostVideoButton(),
              ),
              Gaps.h24,
              NavTab(
                icon: FontAwesomeIcons.message,
                text: "Inbox",
                isSelected: _selectedIndex == 3,
                onTab: () => _onTap(3),
              ),
              NavTab(
                icon: FontAwesomeIcons.user,
                text: "Profile",
                isSelected: _selectedIndex == 4,
                onTab: () => _onTap(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:academix/core/constants/asset_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ScaffoldWithBottomNavbar extends ConsumerStatefulWidget {
  const ScaffoldWithBottomNavbar({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  ConsumerState<ScaffoldWithBottomNavbar> createState() =>
      _ScaffoldWithBottomNavbarState();
}

class _ScaffoldWithBottomNavbarState
    extends ConsumerState<ScaffoldWithBottomNavbar> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    void _onChangeTab(int index) {
      widget.navigationShell.goBranch(
        index,
        initialLocation: index == widget.navigationShell.currentIndex,
      );
    }

    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.navigationShell.currentIndex,
        onTap: _onChangeTab,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              widget.navigationShell.currentIndex == 0
                  ? AssetConstants.homeSolidSVG
                  : AssetConstants.homeSVG,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                widget.navigationShell.currentIndex == 0
                    ? Colors.blue
                    : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              widget.navigationShell.currentIndex == 1
                  ? AssetConstants.chatSolidSVG
                  : AssetConstants.chatSVG,
              colorFilter: ColorFilter.mode(
                widget.navigationShell.currentIndex == 1
                    ? Colors.blue
                    : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              widget.navigationShell.currentIndex == 2
                  ? AssetConstants.favoriteSolidSVG
                  : AssetConstants.favoriteSVG,
              colorFilter: ColorFilter.mode(
                widget.navigationShell.currentIndex == 2
                    ? Colors.blue
                    : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            label: 'Favoris',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              widget.navigationShell.currentIndex == 3
                  ? AssetConstants.profileSolidSVG
                  : AssetConstants.profileSVG,
              colorFilter: ColorFilter.mode(
                widget.navigationShell.currentIndex == 3
                    ? Colors.blue
                    : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

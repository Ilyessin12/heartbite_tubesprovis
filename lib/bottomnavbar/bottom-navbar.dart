import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';

class BottomNavBar extends StatelessWidget{
  final int currentIndex;
  final Function(int) onTap;
  final Function()? onFabPressed;

  const BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
    this.onFabPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color(0xFF8E1616),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, SolarIconsOutline.homeAngle),
              const SizedBox(width: 40), // Space for FAB
              _buildNavItem(1, SolarIconsOutline.bookmark),
            ],
          ),
        ),
        // FAB positioned on top of navbar
        Positioned(
          top: 5, // Move up to overlap with the navbar
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            elevation: 0,
            shape: const CircleBorder(),
            child: const Icon(Icons.add, color: Color(0xFF8E1616)),
            onPressed: onFabPressed ?? (){},
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(int index, IconData icon){
    final bool isActive = currentIndex == index;
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(
            icon,
            color: Colors.white,
          ),
          onPressed: () => onTap(index),
        ),
        // Active indicator
        Container(
          height: 2,
          width: 20,
          color: isActive ? Colors.white : Colors.transparent,
        ),
      ],
    );
  }
}
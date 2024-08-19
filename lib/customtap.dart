import 'package:flutter/material.dart';
import 'package:shazamclome/customta.dart';

class CustomTabBar extends StatelessWidget {
  final List<String> tabTexts = ['Tab 1', 'Tab 2'];

  final Function(int) onTabSelected;
  final int selectedIndex;

  CustomTabBar({
    required this.onTabSelected,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      color: Colors.deepPurple, // Customize the color as needed
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (int index = 0; index < tabTexts.length; index++)
            CustomTab(
              text: tabTexts[index],
              isSelected: index == selectedIndex,
              onTap: () {
                onTabSelected(index);
              },
              icon: Icons.abc,
            ),
        ],
      ),
    );
  }
}

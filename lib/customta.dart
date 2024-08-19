import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isSelected;

  CustomTab({
    required this.text,
    required this.icon,
    required this.isSelected,
    required Null Function() onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isSelected
                ? Colors.white
                : Colors.transparent, // Border color for selected tab
            width: 2, // Border width
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: isSelected
                ? Colors.white
                : Colors.grey, // Icon color for selected tab
          ),
          SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              color: isSelected
                  ? Colors.white
                  : Colors.grey, // Text color for selected tab
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

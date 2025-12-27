// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class CustomIconForOnboarding extends StatelessWidget {
  // icon to be shown inside the container
  final icon;

  // Get horizontal and vertical positions of the container or icon
  final double
  icon_horizontal_pos; // it will be used to get either left or right
  final double icon_vertical_pos; // it will be responsible to get top or bottom

  // Get the size of the icon, width and height for its parent container
  final double size_of_icon;
  final double height_of_container;
  final double width_of_container;

  // Get the color for the icon and its background container
  final Color color_of_icon;
  final Color color_of_parent_box;

  // Get the Radius of the parent container
  final double border_radius_of_parent;

  // If "useRight" is true, the icon's horizontal positioning values would measured from right side
  final bool useRight;

  // if "useTop" is true, the icon's vertical positioning values would measured from top
  final bool useTop;

  const CustomIconForOnboarding({
    super.key,
    required this.icon,
    required this.icon_horizontal_pos,
    required this.icon_vertical_pos,
    required this.size_of_icon,
    required this.color_of_icon,
    required this.height_of_container,
    required this.width_of_container,
    required this.color_of_parent_box,
    required this.border_radius_of_parent,
    this.useRight = true,
    this.useTop = true,
  });

  // Return custom Icon that can be used as specified postion horizontal and vertical via paramerter values.
  @override
  Widget build(BuildContext context) {
    return Positioned(
      // if "useRight = true" start position from right side otherwise left side
      right: useRight ? icon_horizontal_pos : null,
      left: !useRight ? icon_horizontal_pos : null,

      // if "useTop = true" start position from top otherwise bottom
      top: useTop ? icon_vertical_pos : null,
      bottom: !useTop ? icon_vertical_pos : null,

      child: Container(
        height: height_of_container,
        width: width_of_container,
        decoration: BoxDecoration(
          color: color_of_parent_box,
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 231, 233, 255),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
          borderRadius: BorderRadius.circular(border_radius_of_parent),
        ),
        child: Icon(icon, size: size_of_icon, color: color_of_icon),
      ),
    );
  }
}

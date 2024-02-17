import 'package:flutter/material.dart';

class TopOvalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 120); // Move to the left-middle
    path.quadraticBezierTo(size.width * 0.5, 0, size.width,
        120); // Draw an oval curve to the right-middle
    path.lineTo(size.width, size.height); // Draw a line to the bottom-right
    path.lineTo(0, size.height); // Draw a line to the bottom-left
    path.close(); // Close the path to complete the clip shape
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
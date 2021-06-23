import 'package:flutter/material.dart';

class PokeHeader extends StatelessWidget {
  final String ?imageUrl;
  final double ?radius;
  final double ?height;
  final BoxDecoration ?decoration;

  const PokeHeader({
    Key ? key,
    required this.imageUrl,
    this.height = 220.0,
    this.radius = 80.0, required this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: height,
      decoration: decoration,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: radius,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(radius!),
                  topRight: Radius.circular(radius!),
                ),
              ),
            ),
          ),
          Container(
            height: height,
            width: size.width,
            child: Image.network(imageUrl!, fit: BoxFit.fitHeight),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Touchable extends StatelessWidget {
  final Widget child;
  final Function()? onPressed;
  final double radius;
  final Color? color;

  const Touchable({
    Key? key,
    required this.child,
    this.onPressed,
    this.radius = 0,
    this.color,
  }) : super(key: key);

  Color _getColor() => color != null ? color! : Colors.white.withOpacity(0.5);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                radius,
              ),
            ),
            child: InkWell(
              highlightColor: Colors.transparent,
              onTap: onPressed,
              splashColor: _getColor(),
            ),
          ),
        ),
      ],
    );
  }
}

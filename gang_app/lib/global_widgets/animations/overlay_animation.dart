import 'package:flutter/material.dart';

import 'overlay_animation_widgets/build_overlay_content.dart';

class OverlayAnimation extends ModalRoute<void> {
  @override
  // TODO: implement barrierColor
  Color? get barrierColor => Colors.black.withOpacity(0.6);

  @override
  // TODO: implement barrierDismissible
  bool get barrierDismissible => true;

  @override
  // TODO: implement barrierLabel
  String? get barrierLabel => null;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return Material(
      type: MaterialType.transparency,
      child: SafeArea(
        child: BuildOverlayContent(),
      ),
    );
  }

  @override
  bool get maintainState => true;

  @override
  bool get opaque => false;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position:
          Tween(begin: const Offset(0.0, -1.0), end: const Offset(0.0, 0.0))
              .animate(animation),
      child: child,
    );
  }
}
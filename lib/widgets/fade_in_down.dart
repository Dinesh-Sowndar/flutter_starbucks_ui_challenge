import 'package:flutter/material.dart';

class FadeInDown extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double from;
  final Function(AnimateDoDirection direction)? onFinish;
  final Curve curve;

  FadeInDown(
      {key,
      required this.child,
      this.duration = const Duration(milliseconds: 800),
      this.delay = Duration.zero,
      this.controller,
      this.manualTrigger = false,
      this.animate = true,
      this.from = 100,
      this.onFinish,
      this.curve = Curves.easeOut})
      : super(key: key) {
    if (manualTrigger == true && controller == null) {
      throw FlutterError('If you want to use manualTrigger:true, \n\n'
          'Then you must provide the controller property, that is a callback like:\n\n'
          ' ( controller: AnimationController) => yourController = controller \n\n');
    }
  }

  @override
  FadeInDownState createState() => FadeInDownState();
}

/// FadeState class
/// The animation magic happens here
class FadeInDownState extends State<FadeInDown>
    with SingleTickerProviderStateMixin, AnimateDoState {
  /// animation movement
  late Animation<double> animation;

  /// animation opacity
  late Animation<double> opacity;

  @override
  void dispose() {
    disposed = true;
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    animation = Tween<double>(begin: widget.from * -1, end: 0)
        .animate(CurvedAnimation(parent: controller, curve: widget.curve));

    opacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0, 0.65)));

    /// Provided by the mixing [AnimateDoState] class
    configAnimation(
      delay: widget.delay,
      animate: widget.animate,
      manualTrigger: widget.manualTrigger,
      infinite: false,
      onFinish: widget.onFinish,
      controllerCallback: widget.controller,
    );
  }

  @override
  Widget build(BuildContext context) {
    /// Provided by the mixing [AnimateDoState] class
    buildAnimation(
      delay: widget.delay,
      animate: widget.animate,
      manualTrigger: widget.manualTrigger,
      infinite: false,
      onFinish: widget.onFinish,
      controllerCallback: widget.controller,
    );

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
              offset: Offset(0, animation.value),
              child: Opacity(
                opacity: opacity.value,
                child: widget.child,
              ));
        });
  }
}

mixin AnimateDoState {
  late AnimationController controller;
  bool disposed = false;

  /// All the animations are controlled by a [AnimationController]
  /// The controller is created in the [initState] method of the parent AnimatedWidget
  /// This method controls the flow of the animation

  void configAnimation({
    required Duration delay,
    required bool animate,
    required bool manualTrigger,
    required bool infinite,
    Function? onFinish,
    Function(AnimationController controller)? controllerCallback,
  }) {
    /// If the user wants to check if the animation finished, we add a listener
    if (onFinish != null) {
      controller.addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          onFinish(AnimateDoDirection.forward);
        } else if (status == AnimationStatus.dismissed) {
          onFinish(AnimateDoDirection.backward);
        }
      });
    }

    /// If the user wants to trigger the animation manually, we expose the controller
    if (!manualTrigger && animate) {
      Future.delayed(delay, () {
        if (disposed) return;
        (infinite) ? controller.repeat() : controller.forward();
      });
    }

    /// Returns the controller if the user requires it
    if (controllerCallback != null) {
      controllerCallback(controller);
    }
  }

  void buildAnimation({
    required Duration delay,
    required bool animate,
    required bool manualTrigger,
    required bool infinite,
    Function? onFinish,
    Function(AnimationController controller)? controllerCallback,
  }) {
    /// Launch the animation ASAP or wait until needed
    if (animate && !manualTrigger) {
      Future.delayed(delay, () {
        if (disposed) return;
        if (infinite) {
          controller.repeat();
          return;
        }

        (animate) ? controller.forward() : controller.animateBack(0);
      });
    }

    /// If the animation already happen, we can animate it back
    if (!animate) {
      if (disposed) return;
      if (infinite) {
        controller.stop();
        return;
      }
      controller.animateBack(0);
    }
  }
}

enum AnimateDoDirection {
  forward,
  backward,
}

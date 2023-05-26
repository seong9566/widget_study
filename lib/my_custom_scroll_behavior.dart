import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// class MyCustomScrollBehavior extends MaterialScrollBehavior {
//   @override
//   Set<PointerDeviceKind> get dragDevices => {
//         PointerDeviceKind.touch,
//         PointerDeviceKind.mouse,
//       };
// }

class MyCustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }

  @override
  Widget buildScrollbar(BuildContext context, Widget child, ScrollableDetails details) {
    if (kIsWeb) {
      return Listener(
        onPointerSignal: (PointerSignalEvent event) {
          if (event is PointerScrollEvent && event.scrollDelta.dy != 0) {
            final ScrollableState? scrollableState = Scrollable.of(context)?.position as ScrollableState?;
            scrollableState?.position.moveTo(
              scrollableState.position.pixels + event.scrollDelta.dy,
            );
          }
        },
        child: child,
      );
    } else {
      return super.buildScrollbar(context, child, details);
    }
  }

  @override
  double applyViewportDimension(BuildContext context, double viewportDimension) {
    if (kIsWeb) {
      return viewportDimension;
    } else {
      return applyViewportDimension(context, viewportDimension);
    }
  }
}

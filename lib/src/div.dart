import 'package:flutter/material.dart';

import '../responsive_ui.dart';

/// Use this inside `Responsive()`
///
/// This Widget requires `Finite width`
class Div extends StatelessWidget {
  final Widget child;
  final Division divison;

  const Div({
    Key? key,
    this.divison = const Division(),
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int col = 0;
    int offset = 0;
    final double width = MediaQuery.of(context).size.width;
    if (width < Responsive.startColS) {
      col = divison.colXS;
      offset = divison.offsetXS;
    } else if (width < Responsive.startColM) {
      col = divison.widthS;
      offset = divison.offsetS;
    } else if (width < Responsive.startColL) {
      col = divison.widthM;
      offset = divison.offsetM;
    } else if (width < Responsive.startColXL) {
      col = divison.widthL;
      offset = divison.offsetL;
    } else {
      col = divison.widthXL;
      offset = divison.offsetXL;
    }

    if (col == 0) {
      return const SizedBox.shrink();
    }

    return LayoutBuilder(
      builder: (ctx, box) {
        final double singleBox = box.maxWidth / 12;
        final double childWidth = singleBox * col;
        final double childOffset = singleBox * offset;
        final double otherWidths = (12 - col) * singleBox;
        final double recalculatedChildWidth =
            (childWidth + otherWidths) > box.maxWidth
                ? childWidth - ((childWidth + otherWidths) - box.maxWidth)
                : childWidth;

        return SizedBox(
          width: recalculatedChildWidth + childOffset,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                width: recalculatedChildWidth,
                child: child,
              ),
            ],
          ),
        );
      },
    );
  }
}

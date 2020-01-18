import 'package:flutter/material.dart';

class ResponsiveChild extends StatelessWidget {
  final Widget child;

  /// Small screen
  ///
  /// input range [0 -12]
  ///
  /// `0` ~ 0.0 width / gone
  ///i
  /// `12` ~ full width
  ///
  /// `null` ~ takes [defaultColS] value from `Responsive()` Widget
  final int colS;

  /// Medium screen
  ///
  /// input range [0 -12]
  ///
  /// `0` ~ 0.0 width / gone
  ///
  /// `12` ~ full width
  ///
  /// `null` ~ takes [defaultColM] value from `Responsive()` Widget
  final int colM;

  /// Large screen
  ///
  /// input range [0 -12]
  ///
  /// `0` ~ 0.0 width / gone
  ///
  /// `12` ~ full width
  ///
  /// `null` ~ takes [defaultColL] value from `Responsive()` Widget
  final int colL;

  final int offsetS;

  final int offsetM;

  final int offsetL;

  /// ### This Widget works only as direct children of `Responsive()` Widget
  ///
  /// [Ex]
  /// ```dart
  ///   Responsive(        // Parent Responsive Widget
  ///     children:[
  ///       ResponsiveChild(
  ///         colS : 12,
  ///         colm : 6,
  ///         colS : 4,
  ///         child : Container(),
  ///       ),
  ///       ResponsiveChild(
  ///           colS : 12,
  ///           colm : 6,
  ///           colS : 4,
  ///           child : Container(),
  ///       ),
  ///     ],
  ///   )
  /// ```
  const ResponsiveChild(
      {this.colS,
      this.colM,
      this.colL,
      @required this.child,
      this.offsetS = 0,
      this.offsetM = 0,
      this.offsetL = 0})
      : assert(child != null, "children shoud not be Null"),
        assert(colS == null || (colS >= 0 && colS <= 12)),
        assert(colM == null || (colM >= 0 && colM <= 12)),
        assert(colL == null || (colL >= 0 && colL <= 12)),
        assert(offsetS >= 0 && offsetS <= 11),
        assert(offsetM >= 0 && offsetM <= 11),
        assert(offsetL >= 0 && offsetL <= 11),
        assert(offsetS > 0 ? colS != null : true,
            "colS shouldn't be null as offsetS greater than zero"),
        assert(offsetM > 0 ? colM != null : true,
            "colM shouldn't be null as offsetM greater than zero"),
        assert(offsetL > 0 ? colL != null : true,
            "colL shouldn't be null as offsetL greater than zero"),
        assert(colS == null || (colS + offsetS <= 12),
            "sum of the col and the respective offset should be less than or equal to 12"),
        assert(colM == null || (colM + offsetM <= 12),
            "sum of the col and the respective offset should be less than or equal to 12"),
        assert(colL == null || (colL + offsetL <= 12),
            "sum of the col and the respective offset should be less than or equal to 12");

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

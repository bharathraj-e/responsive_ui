import 'package:flutter/material.dart';

/// This widget requires `Finite width`
///
/// The default breakpoints are:
///
/// colXS < ColS < ColM < ColL < ColXL
///
///  0 < 375.0 < 596.0 < 897.0 < 1232.0 < xl
///
/// To change the breakpoints, use `Responsive.setGlobalBreakPoints` in `main()`
class Responsive extends StatelessWidget {
  const Responsive({
    Key? key,
    required this.children,
    this.runSpacing = 0.0,
    this.alignment = WrapAlignment.start,
    this.runAlignment = WrapAlignment.start,
    this.crossAxisAlignment = WrapCrossAlignment.start,
  }) : super(key: key);

  static double startColS = 375.0;
  static double startColM = 596.0;
  static double startColL = 897.0;
  static double startColXL = 1232.0;

  /// Use this to set your own break points
  ///
  /// this applies throughout the entire app
  ///
  /// Use in main()
  ///
  /// colXS < ColS < ColM < ColL < ColXL
  ///
  ///  0 < 375 < 596 < 897 < 1232 < xl
  static void setGlobalBreakPoints(
      double colSstartingWidth,
      double colMstartingWidth,
      double colLstartingWidth,
      double colXLstartingWidth) {
    startColS = colSstartingWidth;
    startColM = colMstartingWidth;
    startColL = colLstartingWidth;
    startColXL = colXLstartingWidth;
  }

  /// Use `Div()` as a Widget
  final List<Widget> children;

  /// How the children within a run should be placed in the main axis.
  ///
  /// For example, if [alignment] is [WrapAlignment.center], the children in
  /// each run are grouped together in the center of their run in the main axis.
  ///
  /// Defaults to [WrapAlignment.start].
  final WrapAlignment alignment;

  /// How the runs themselves should be placed in the cross axis.
  ///
  /// For example, if [runAlignment] is [WrapAlignment.center], the runs are
  /// grouped together in the center of the overall [Wrap] in the cross axis.
  ///
  /// Defaults to [WrapAlignment.start].
  ///
  final WrapAlignment runAlignment;

  /// How the children within a run should be aligned relative to each other in
  /// the cross axis.
  ///
  /// For example, if this is set to [WrapCrossAlignment.end], and the
  /// [direction] is [Axis.horizontal], then the children within each
  /// run will have their bottom edges aligned to the bottom edge of the run.
  ///
  /// Defaults to [WrapCrossAlignment.start].
  ///
  final WrapCrossAlignment crossAxisAlignment;

  /// How much space to place between the runs themselves in the cross axis.
  ///
  /// For example, if [runSpacing] is 10.0, the runs will be spaced at least
  /// 10.0 logical pixels apart in the cross axis.
  ///
  /// If there is additional free space in the overall [Wrap] (e.g., because
  /// the wrap has a minimum size that is not filled), the additional free space
  /// will be allocated according to the [runAlignment].
  ///
  /// Defaults to 0.0.
  final double runSpacing;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: alignment,
      runSpacing: runSpacing,
      runAlignment: runAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: children,
    );
  }
}

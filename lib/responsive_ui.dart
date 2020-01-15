library responsive_ui;

import 'package:flutter/material.dart';

enum _Screen { SMALL, MEDIUM, LARGE }

class ResponsiveRow extends StatelessWidget {
  ///
  /// Create an Responsive Widget.
  ///
  /// ## ResponsiveRow's grid system allows up to 12 columns across the page (like Bootstrap, Materialize css grid system)
  ///
  /// `defaultColS` ~ [0 - 12] (for phones - screens <= 600px wide) default `12`
  ///
  /// `defaultColM` ~ [0 - 12] (for tablets - screens > 600px wide && <= 990 px wide) default `12`
  ///
  /// `defaultColL` ~ [0 - 12] (for laptops - screens > 990px wide)  ( > 990.0 px ) default `12`
  ///
  /// (0 - 0.0 px width (gone / no visibility))
  ///
  /// This default column size applies to all children widget.
  ///
  /// ### To use individual column size for a widget try `ResponsiveColumn()` widget
  ///
  /// `children` takes [List<Widget>] or [List<ResponsiveColumn>]
  ///
  /// ```dart
  ///  ResponsiveColumn(
  ///     colS: 12 // 0 - 12 if `null` takes defaultColS
  ///     colM: 6, // 0 - 12 if `null` takes defaultColM
  ///     colL: 4, // 0 - 12 if `null` takes defaultColL
  ///     child: Container(),
  ///   )
  /// ```
  /// `ResponsiveColumn()` column sizes overrides the defaultCol sizes of `ResponsiveRow()` widget
  ///
  /// [Example]
  /// ```dart
  ///   ResponsiveRow(
  ///      defaultColS: 12,
  ///      defaultColM: 6,
  ///      defaultColL: 3,
  ///      children: <Widget>[
  ///
  ///        Container(),
  ///
  ///        ResponsiveColumn(
  ///          colS: 12,
  ///          colM: 8,
  ///          colL: 4,
  ///          child: Container(),
  ///        ),
  ///
  ///        Container(),
  ///
  ///        ResponsiveColumn(              // nested `ResponsiveColumn` takes a width allocated by its parent ResponsiveRow
  ///          defaultColM: 6,
  ///          defaultColL: 3,
  ///          children: <Widget>[
  ///            Container(),
  ///            ResponsiveColumn(
  ///              colS: 12,
  ///              colM: 8,
  ///              colL: 4,
  ///              child: Container(),
  ///            ),
  ///          ],
  ///        )
  ///
  ///     ],
  ///   )
  ///
  /// ```

  ResponsiveRow({
    @required this.children,
    this.defaultColS = 12,
    this.defaultColM = 12,
    this.defaultColL = 12,
    this.direction = Axis.horizontal,
    this.alignment = WrapAlignment.start,
    this.spacing = 0.0,
    this.runAlignment = WrapAlignment.start,
    this.runSpacing = 0.0,
    this.crossAxisAlignment = WrapCrossAlignment.start,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
  })  : assert(children != null, "children shoud not be Null"),
        assert(defaultColS >= 0 && defaultColS <= 12),
        assert(defaultColM >= 0 && defaultColM <= 12),
        assert(defaultColL >= 0 && defaultColL <= 12);

  final List<Widget> children;

  /// input range [0 -12]
  ///
  /// `0` ~ 0.0 width / gone
  ///
  /// `12` ~ full width
  final int defaultColS;

  /// input range [0 -12]
  ///
  /// `0` ~ 0.0 width / gone
  ///
  /// `12` ~ full width
  final int defaultColM;

  /// input range [0 -12]
  ///
  /// `0` ~ 0.0 width / gone
  ///
  /// `12` ~ full width
  final int defaultColL;

  /// The direction to use as the main axis.
  ///
  /// For example, if [direction] is [Axis.horizontal], the default, the
  /// children are placed adjacent to one another in a horizontal run until the
  /// available horizontal space is consumed, at which point a subsequent
  /// children are placed in a new run vertically adjacent to the previous run.
  final Axis direction;

  /// How the children within a run should be placed in the main axis.
  ///
  /// For example, if [alignment] is [WrapAlignment.center], the children in
  /// each run are grouped together in the center of their run in the main axis.
  ///
  /// Defaults to [WrapAlignment.start].
  ///
  /// See also:
  ///
  ///  * [runAlignment], which controls how the runs are placed relative to each
  ///    other in the cross axis.
  ///  * [crossAxisAlignment], which controls how the children within each run
  ///    are placed relative to each other in the cross axis.
  final WrapAlignment alignment;

  /// How much space to place between children in a run in the main axis.
  ///
  /// For example, if [spacing] is 10.0, the children will be spaced at least
  /// 10.0 logical pixels apart in the main axis.
  ///
  /// If there is additional free space in a run (e.g., because the wrap has a
  /// minimum size that is not filled or because some runs are longer than
  /// others), the additional free space will be allocated according to the
  /// [alignment].
  ///
  /// Defaults to 0.0.
  final double spacing;

  /// How the runs themselves should be placed in the cross axis.
  ///
  /// For example, if [runAlignment] is [WrapAlignment.center], the runs are
  /// grouped together in the center of the overall [Wrap] in the cross axis.
  ///
  /// Defaults to [WrapAlignment.start].
  ///
  /// See also:
  ///
  ///  * [alignment], which controls how the children within each run are placed
  ///    relative to each other in the main axis.
  ///  * [crossAxisAlignment], which controls how the children within each run
  ///    are placed relative to each other in the cross axis.
  final WrapAlignment runAlignment;

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

  /// How the children within a run should be aligned relative to each other in
  /// the cross axis.
  ///
  /// For example, if this is set to [WrapCrossAlignment.end], and the
  /// [direction] is [Axis.horizontal], then the children within each
  /// run will have their bottom edges aligned to the bottom edge of the run.
  ///
  /// Defaults to [WrapCrossAlignment.start].
  ///
  /// See also:
  ///
  ///  * [alignment], which controls how the children within each run are placed
  ///    relative to each other in the main axis.
  ///  * [runAlignment], which controls how the runs are placed relative to each
  ///    other in the cross axis.
  final WrapCrossAlignment crossAxisAlignment;

  /// Determines the order to lay children out horizontally and how to interpret
  /// `start` and `end` in the horizontal direction.
  ///
  /// Defaults to the ambient [Directionality].
  ///
  /// If the [direction] is [Axis.horizontal], this controls order in which the
  /// children are positioned (left-to-right or right-to-left), and the meaning
  /// of the [alignment] property's [WrapAlignment.start] and
  /// [WrapAlignment.end] values.
  ///
  /// If the [direction] is [Axis.horizontal], and either the
  /// [alignment] is either [WrapAlignment.start] or [WrapAlignment.end], or
  /// there's more than one child, then the [textDirection] (or the ambient
  /// [Directionality]) must not be null.
  ///
  /// If the [direction] is [Axis.vertical], this controls the order in which
  /// runs are positioned, the meaning of the [runAlignment] property's
  /// [WrapAlignment.start] and [WrapAlignment.end] values, as well as the
  /// [crossAxisAlignment] property's [WrapCrossAlignment.start] and
  /// [WrapCrossAlignment.end] values.
  ///
  /// If the [direction] is [Axis.vertical], and either the
  /// [runAlignment] is either [WrapAlignment.start] or [WrapAlignment.end], the
  /// [crossAxisAlignment] is either [WrapCrossAlignment.start] or
  /// [WrapCrossAlignment.end], or there's more than one child, then the
  /// [textDirection] (or the ambient [Directionality]) must not be null.
  final TextDirection textDirection;

  /// Determines the order to lay children out vertically and how to interpret
  /// `start` and `end` in the vertical direction.
  ///
  /// If the [direction] is [Axis.vertical], this controls which order children
  /// are painted in (down or up), the meaning of the [alignment] property's
  /// [WrapAlignment.start] and [WrapAlignment.end] values.
  ///
  /// If the [direction] is [Axis.vertical], and either the [alignment]
  /// is either [WrapAlignment.start] or [WrapAlignment.end], or there's
  /// more than one child, then the [verticalDirection] must not be null.
  ///
  /// If the [direction] is [Axis.horizontal], this controls the order in which
  /// runs are positioned, the meaning of the [runAlignment] property's
  /// [WrapAlignment.start] and [WrapAlignment.end] values, as well as the
  /// [crossAxisAlignment] property's [WrapCrossAlignment.start] and
  /// [WrapCrossAlignment.end] values.
  ///
  /// If the [direction] is [Axis.horizontal], and either the
  /// [runAlignment] is either [WrapAlignment.start] or [WrapAlignment.end], the
  /// [crossAxisAlignment] is either [WrapCrossAlignment.start] or
  /// [WrapCrossAlignment.end], or there's more than one child, then the
  /// [verticalDirection] must not be null.
  final VerticalDirection verticalDirection;

  final double _widthMobile = 600.0;
  final double _widthTab = 990;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    _Screen screen = screenWidth < _widthMobile
        ? _Screen.SMALL
        : screenWidth < _widthTab ? _Screen.MEDIUM : _Screen.LARGE;

    return Wrap(
      alignment: alignment,
      direction: direction,
      spacing: spacing,
      runAlignment: runAlignment,
      runSpacing: runSpacing,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      children: children.map((child) {
        return LayoutBuilder(builder: (ctx, box) {
          double _width = box.maxWidth;
          if (child is ResponsiveColumn) {
            ResponsiveColumn responsiveColumn = child;
            _width = _calulateWidth(
                screen,
                _width,
                responsiveColumn.colS ?? defaultColS,
                responsiveColumn.colM ?? defaultColM,
                responsiveColumn.colL ?? defaultColL);
          } else {
            _width = _calulateWidth(
                screen, _width, defaultColS, defaultColM, defaultColL);
          }
          return SizedBox(
            width: _width,
            child: child,
          );
        });
      }).toList(),
    );
  }

  double _calulateWidth(
      _Screen screen, double maxWidth, int _colS, int _colM, int _colL) {
    double width = maxWidth;
    if (screen == _Screen.SMALL) {
      width = (maxWidth / 12) * _colS;
    } else if (screen == _Screen.MEDIUM) {
      width = (maxWidth / 12) * _colM;
    } else {
      width = (maxWidth / 12) * _colL;
    }
    return width;
  }
}

class ResponsiveColumn extends StatelessWidget {
  final Widget child;

  /// input range [0 -12]
  ///
  /// `0` ~ 0.0 width / gone
  ///
  /// `12` ~ full width
  ///
  /// `null` ~ takes [defaultColS] value from `ResponsiveRow` Widget
  final int colS;

  /// input range [0 -12]
  ///
  /// `0` ~ 0.0 width / gone
  ///
  /// `12` ~ full width
  ///
  /// `null` ~ takes [defaultColM] value from `ResponsiveRow` Widget
  final int colM;

  /// input range [0 -12]
  ///
  /// `0` ~ 0.0 width / gone
  ///
  /// `12` ~ full width
  ///
  /// `null` ~ takes [defaultColL] value from `ResponsiveRow` Widget
  final int colL;

  /// ### This Widget works only as direct children of `ResponsiveRow` Widget
  ///
  /// [Ex]
  /// ```dart
  ///   ResponsiveRow(        // Parent ResponsiveRow Widget
  ///     children:[
  ///       ResponsiveColumn( // Direct child of ResponsiveRow (works as mentioned col values)
  ///         colS : 12,
  ///         colm : 6,
  ///         colS : 4,
  ///         child : Container(),
  ///       ),
  ///       Container(
  ///         child : ResponsiveColumn( // not a Direct child of ResponsiveRow (so it doesn't works)
  ///           colS : 12,
  ///           colm : 6,
  ///           colS : 4,
  ///           child : Container(),
  ///         ),
  ///       ),
  ///     ],
  ///   )
  /// ```
  const ResponsiveColumn(
      {this.colS, this.colM, this.colL, @required this.child})
      : assert(child != null, "children shoud not be Null"),
        assert(colS == null || (colS >= 0 && colS <= 12)),
        assert(colM == null || (colM >= 0 && colM <= 12)),
        assert(colL == null || (colL >= 0 && colL <= 12));

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

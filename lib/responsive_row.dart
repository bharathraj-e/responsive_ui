import 'package:flutter/material.dart';

import 'responsive_column.dart';

enum _Screen { SMALL, MEDIUM, LARGE }

class ResponsiveRow extends StatelessWidget {
  ///
  /// Create an Responsive Widget.
  ///
  /// ## ResponsiveRow's grid system allows up to 12 columns across the page (like Bootstrap, Materialize css grid system)
  ///
  /// `defaultColS` ~ [0 - 12] (for phones - screens <= 600px wide) default `12`
  ///
  /// `defaultColM` ~ [0 - 12] (for tablets - screens > 600px wide && <= 990 px wide) defaults `defaultColS`
  ///
  /// `defaultColL` ~ [0 - 12] (for laptops - screens > 990px wide) defaults to `defaultColM`
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
    this.defaultColM,
    this.defaultColL,
    this.alignment = WrapAlignment.start,
    this.runAlignment = WrapAlignment.start,
    this.crossAxisAlignment = WrapCrossAlignment.start,
  })  : assert(children != null, "children shoud not be Null"),
        assert(defaultColS != null || (defaultColS >= 0 && defaultColS <= 12)),
        assert(defaultColM == null || (defaultColM >= 0 && defaultColM <= 12)),
        assert(defaultColL == null || (defaultColL >= 0 && defaultColL <= 12));

  /// List<Widget> || List<ResponsiveColumn>
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
  ///
  /// `null` / defaults to [defaultColS] value
  final int defaultColM;

  /// input range [0 -12]
  ///
  /// `0` ~ 0.0 width / gone
  ///
  /// `12` ~ full width
  ///
  /// `null` / defaults to [defaultColM] value
  final int defaultColL;

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

  final double _widthMobile = 600.0;
  final double _widthTab = 990;

  @override
  Widget build(BuildContext context) {
    int s = defaultColS;
    int m = defaultColM ?? s;
    int l = defaultColL ?? m;

    double screenWidth = MediaQuery.of(context).size.width;

    _Screen screen = screenWidth < _widthMobile
        ? _Screen.SMALL
        : screenWidth < _widthTab ? _Screen.MEDIUM : _Screen.LARGE;

    return Wrap(
      alignment: alignment,
      runAlignment: runAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: children.map((child) {
        return LayoutBuilder(builder: (ctx, box) {
          if (child is ResponsiveColumn) {
            ResponsiveColumn c = child;

            int kS = (c.offsetS + (c.colS ?? defaultColS) >= 12)
                ? 12
                : c.offsetS + (c.colS ?? defaultColS);
            int kM = (c.offsetM + (c.colM ?? defaultColM) >= 12)
                ? 12
                : c.offsetM + (c.colM ?? defaultColM);
            int kL = (c.offsetL + (c.colL ?? defaultColL) >= 12)
                ? 12
                : c.offsetL + (c.colL ?? defaultColL);

            return SizedBox(
              width: _calulateWidth(screen, box.maxWidth, kS, kM, kL),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  SizedBox(
                      width: _calulateWidth(screen, box.maxWidth, c.colS ?? s,
                          c.colM ?? m, c.colL ?? l),
                      child: child),
                ],
              ),
            );
          }

          return SizedBox(
            width: _calulateWidth(screen, box.maxWidth, s, m, l),
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

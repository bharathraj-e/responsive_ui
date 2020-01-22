import 'package:flutter/material.dart';

import 'responsive_child.dart';

enum _Screen { SMALL, MEDIUM, LARGE }

class Responsive extends StatelessWidget {
  ///
  /// Create an Responsive Widget.
  ///
  /// ## Responsive's grid system allows up to 12 columns across the page (like Bootstrap, Materialize css grid system)
  ///
  /// `defaultColS` ~ [0 - 12] (for phones - screens <= 600px wide) default `12`
  ///
  /// `defaultColM` ~ [0 - 12] (for tablets - screens > 600px wide && <= 990 px wide) defaults `defaultColS`
  ///
  /// `defaultColL` ~ [0 - 12] (for laptops - screens > 990px wide) defaults to `defaultColM`
  ///
  /// (0 - 0.0 px width (gone / no visibility))
  ///
  /// This default column size applies to all ResponsiveChild() widget.
  ///
  /// ### Individual column size for a ResponsiveChild() can be mentioned
  ///
  /// `children` takes  [List<ResponsiveChild>]
  ///
  /// ```dart
  ///  ResponsiveChild(
  ///     colS: 12 // 0 - 12 if `null` takes defaultColS
  ///     colM: 6, // 0 - 12 if `null` takes defaultColM
  ///     colL: 4, // 0 - 12 if `null` takes defaultColL
  ///     child: Container(),
  ///   )
  /// ```
  /// `ResponsiveChild()` column sizes overrides the defaultCol sizes of `Responsive()` widget
  ///
  /// [Example]
  /// ```dart
  ///   Responsive(
  ///      defaultColS: 12,
  ///      defaultColM: 6,
  ///      defaultColL: 3,
  ///      children: <Widget>[
  ///        ResponsiveChild( // overrides defaultCol values
  ///          colS: 12,
  ///          colM: 8,
  ///          colL: 4,
  ///          child: Container(),
  ///        ),
  ///        ResponsiveChild( // takes defaultCol values
  ///          child: Container(),
  ///        ),
  ///     ],
  ///   )
  ///
  /// ```

  Responsive({
    @required this.children,
    this.defaultColS = 12,
    this.defaultColM,
    this.defaultColL,
    this.runSpacing = 0.0,
    this.padding = const EdgeInsets.all(0),
    this.alignment = WrapAlignment.start,
    this.runAlignment = WrapAlignment.start,
    this.crossAxisAlignment = WrapCrossAlignment.start,
  })  : assert(children != null, "children shoud not be Null"),
        assert(defaultColS != null || (defaultColS >= 0 && defaultColS <= 12)),
        assert(defaultColM == null || (defaultColM >= 0 && defaultColM <= 12)),
        assert(defaultColL == null || (defaultColL >= 0 && defaultColL <= 12));

  /// List<ResponsiveChild> children : [ResponsiveChild(),ResponsiveChild(),..]
  final List<ResponsiveChild> children;

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

  final double _widthMobile = 600.0;
  final double _widthTab = 990;

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    int s = defaultColS;
    int m = defaultColM ?? s;
    int l = defaultColL ?? m;

    double screenWidth = MediaQuery.of(context).size.width;

    _Screen screen = screenWidth < _widthMobile
        ? _Screen.SMALL
        : screenWidth < _widthTab ? _Screen.MEDIUM : _Screen.LARGE;

    return Padding(
        padding: padding,
        child: Wrap(
          alignment: alignment,
          runSpacing: runSpacing,
          runAlignment: runAlignment,
          crossAxisAlignment: crossAxisAlignment,
          children: children.map((c) {
            return LayoutBuilder(builder: (ctx, box) {
              int kS = (c.offsetS + (c.colS ?? s) >= 12)
                  ? 12
                  : c.offsetS + (c.colS ?? s);
              int kM = (c.offsetM + (c.colM ?? m) >= 12)
                  ? 12
                  : c.offsetM + (c.colM ?? m);
              int kL = (c.offsetL + (c.colL ?? l) >= 12)
                  ? 12
                  : c.offsetL + (c.colL ?? l);
              double w = _calulateWidth(screen, box.maxWidth, kS, kM, kL);

              return w == 0
                  ? SizedBox(
                      width: 0,
                      height: 0,
                    )
                  : SizedBox(
                      width: w,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          SizedBox(
                              width: _calulateWidth(screen, box.maxWidth,
                                  c.colS ?? s, c.colM ?? m, c.colL ?? l),
                              child: c),
                        ],
                      ),
                    );
            });
          }).toList(),
        ));
  }

  double _calulateWidth(
      _Screen screen, double maxWidth, int _colS, int _colM, int _colL) {
    return screen == _Screen.SMALL
        ? (maxWidth / 12) * _colS
        : screen == _Screen.MEDIUM
            ? (maxWidth / 12) * _colM
            : (maxWidth / 12) * _colL;
  }
}

/// Set col and offset
class Division {
  /// Extra Small screen `< 375.0`
  ///
  /// input range [0 -12]
  ///
  /// `0` ~ 0.0 width ~ replaced with SizedBox.shrink()
  ///
  /// `12` ~ full width
  ///
  /// default `12`
  final int colXS;

  /// Small screen `375.0 to 596.0`
  ///
  /// input range [0 -12]
  ///
  /// `0` ~ 0.0 width ~ replaced with SizedBox.shrink()
  ///
  /// `12` ~ full width
  ///
  /// `null` / `default` ~ takes [ColXS] value
  final int? colS;

  /// Medium screen `596.0 to 897.0`
  ///
  /// input range [0 -12]
  ///
  /// `0` ~ 0.0 width ~ replaced with SizedBox.shrink()
  ///
  /// `12` ~ full width
  ///
  /// `null` / `default` ~ takes [ColS] value
  final int? colM;

  /// Large screen `897.0 to 1232.0`
  ///
  /// input range [0 -12]
  ///
  /// `0` ~ 0.0 width / gone
  ///
  /// `12` ~ full width
  ///
  /// `null` / `default` ~  takes [ColM] value
  final int? colL;

  /// Very Large screen `> 1232.0`
  ///
  /// input range [0 -12]
  ///
  /// `0` ~ 0.0 width / gone
  ///
  /// `12` ~ full width
  ///
  /// `null` / `default` ~  takes [ColL] value
  final int? colXL;

  /// input range [0 -12]
  ///
  /// default `0`
  final int offsetXS;

  /// input range [0 -12]
  ///
  /// default `0`
  final int offsetS;

  /// input range [0 -12]
  ///
  /// default `0`
  final int offsetM;

  /// input range [0 -12]
  ///
  /// default `0`
  final int offsetL;

  /// input range [0 -12]
  ///
  /// default `0`
  final int offsetXL;

  const Division({
    this.colXS = 12,
    this.colS,
    this.colM,
    this.colL,
    this.colXL,
    this.offsetXS = 0,
    this.offsetS = 0,
    this.offsetM = 0,
    this.offsetL = 0,
    this.offsetXL = 0,
  })  : assert(colXS >= 0 && colXS <= 12),
        assert(colS == null || (colS >= 0 && colS <= 12)),
        assert(colM == null || (colM >= 0 && colM <= 12)),
        assert(colL == null || (colL >= 0 && colL <= 12)),
        assert(colXL == null || (colXL >= 0 && colXL <= 12)),
        assert(offsetXS >= 0 && offsetXS <= 11),
        assert(offsetS >= 0 && offsetS <= 11),
        assert(offsetM >= 0 && offsetM <= 11),
        assert(offsetL >= 0 && offsetL <= 11),
        assert(offsetXL >= 0 && offsetXL <= 11),
        assert((colXS + offsetXS <= 12),
            "sum of the colXS and the respective offsetXS should be less than or equal to 12"),
        assert(colS == null || (colS + offsetS <= 12),
            "sum of the colS and the respective offsetS should be less than or equal to 12"),
        assert(colM == null || (colM + offsetM <= 12),
            "sum of the colM and the respective offsetM should be less than or equal to 12"),
        assert(colL == null || (colL + offsetL <= 12),
            "sum of the colL and the respective offsetL should be less than or equal to 12"),
        assert(colXL == null || (colXL + offsetXL <= 12),
            "sum of the colXL and the respective offsetXL should be less than or equal to 12");

  /// Returns the width of the column for the given screen size
  ///
  /// internal use only
  int get widthS => colS ?? colXS;

  /// Returns the width of the column for the given screen size
  ///
  /// internal use only
  int get widthM => colM ?? widthS;

  /// Returns the width of the column for the given screen size
  ///
  /// internal use only
  int get widthL => colL ?? widthM;

  /// Returns the width of the column for the given screen size
  ///
  /// internal use only
  int get widthXL => colXL ?? widthL;

  // copy with method
  Division copyWith({
    int? colXS,
    int? colS,
    int? colM,
    int? colL,
    int? colXL,
    int? offsetXS,
    int? offsetS,
    int? offsetM,
    int? offsetL,
    int? offsetXL,
  }) {
    return Division(
      colXS: colXS ?? this.colXS,
      colS: colS ?? this.colS,
      colM: colM ?? this.colM,
      colL: colL ?? this.colL,
      colXL: colXL ?? this.colXL,
      offsetXS: offsetXS ?? this.offsetXS,
      offsetS: offsetS ?? this.offsetS,
      offsetM: offsetM ?? this.offsetM,
      offsetL: offsetL ?? this.offsetL,
      offsetXL: offsetXL ?? this.offsetXL,
    );
  }
}

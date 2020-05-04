# Responsive UI

[![Pub](https://img.shields.io/pub/v/responsive_ui.svg?style=flat-square)](https://pub.dartlang.org/packages/responsive_ui)

`responsive_ui` package helps you to create a responsive widget and Nested responsive widgets. Works on Android,iOS, **Web** with both Portrait and LandScape mode.


## Getting Started

It works as same as Bootstrap / Materialize Row Column method, Splitting screen into 12 columns and placing widget by combining column based on screen size.

## Screens

 - **For mobiles ( screen size <= 600px wide )**

 - **For tablets ( screen size > 600px wide - 990 px wide )**

 - **For laptops ( screen size > 990px wide )**

# Widgets

The Responsive UI Package contains two simple widgets.

1. Div() 
2. Responsive() 


## 1. Div()

Div() intakes child & column sizes.

| Arguments | inputs     | if null / default to |
|-----------|------------|----------------------|
| `child`   | Widget     | not null / required  |
| `colS`    | (int) 0-12 | `12`                 |
| `colM`    | (int) 0-12 | `ColS` value         |
| `colL`    | (int) 0-12 | `ColM` value         |
| `offsetS` | (int) 0-12 | 0                    |
| `offsetM` | (int) 0-12 | 0                    |
| `offsetL` | (int) 0-12 | 0                    |


### (S = small, M = medium, L = large) 

- 0 - 0.0 width (gone) (replaced with `SizedBox.shrink()`)

- 12 - full width (provided by `parent widget` not screen width) 

- `Parent widget` should not be a `horizontal scroll` type widget

### Offset (for creating blank space before the Div())

- To offset, simply add `offsetS` / `offsetM` / `offsetL` to the Div() widget with `colS` / `colM` / `colL` respectively.
- if `offset`  is not null , then the respective `col` shouldn't be null
- sum of the `offset` and the respective `col` should be <= to `12`

## 2. Responsive()

Responsive intakes `List<Widget>` or `List<Div>` with default column/screen size for each widget can be declared.

| Arguments            | inputs                   | if null / default             |
|----------------------|--------------------------|-------------------------------|
| `children`           | List<Widget> / List<Div> | not null / required / empty[] |
| `alignment`          | WrapAlignment            | WrapAlignment.start           |
| `runAlignment`       | WrapAlignment            | WrapAlignment.start           |
| `crossAxisAlignment` | WrapCrossAlignment       | WrapCrossAlignment.start      |
| `runSpacing`         | double                   | 0.0                           |

### Lite Example

```dart
    Responsive(
        children: <Widget>[
            Div(
                colS: 5,
                offsetL: 2,
                child: Card(child: Icon(Icons.game))
            ),
            Div(
                colS: 12,
                colM: 6,
                colL: 4,
                child: Text('responsive ui')
            )          
        ]
    )
```

## Flutter Web Sample

### [https://bharathraj-e.github.io/responsive_ui_example/](https://bharathraj-e.github.io/responsive_ui_example/) Have a look!

# Note 
- `Div()` works with `vertical scroll` not in` horizontal scroll`, as it calculations are base on width only.

- `Div()` works as expected when it placed as a direct child of `Responsive()` widget's children.

- Sum of the `offset` and the respective `col` should be <= to `12`

## Nested Responsive

Placing a `Responsive()` widget into a `Div()`.

The nested `Responsive()` widget takes the width provided by parent `Div()` widget and **not the screen width**

## sample 

<img src='https://raw.githubusercontent.com/bharathraj-e/responsive_ui/master/pics/out.gif' width='80%' >


**responsive_ui** is made simply using Wrap() and LayoutBuilder() with a bits of logics.

# Responsive UI

[![Pub](https://img.shields.io/pub/v/responsive_ui.svg?style=flat-square)](https://pub.dartlang.org/packages/responsive_ui)

### `responsive_ui` package helps you to create a responsive widget and Nested responsive widget too. Works on all flutter platform (android, iOs ,**web** ) with both Portrait and LandScape mode.

## sample video

[https://youtu.be/2koIFANjJZg](https://youtu.be/2koIFANjJZg)

[<img src='https://img.youtube.com/vi/2koIFANjJZg/maxresdefault.jpg' width='50%'>](https://youtu.be/2koIFANjJZg)

## Getting Started

It works as same as Bootstrap Row Column method, Splitting screen into 12 columns and placing widget by combining column based on screen size.

## Screens

### **For mobiles ( screen size <= 600px wide )**

### **For tablets ( screen size > 600px wide && <= 990 px wide )**

### **For laptops ( screen size > 990px wide )**

### (S = small, M = medium, L = large) 

# Widgets

The Responsive UI Package contains two simple widgets.

1. Responsive() 
2. ResponsiveChild() 

## 1. Responsive()

Responsive intakes `List<ResponsiveChild>` with default column/screen size for each widget can be declared.

| Arguments            | inputs                  | if null                       |
|----------------------|-------------------------|-------------------------------|
| `defaultColS`        | (int) 0-12              | 12                            |
| `defaultColL`        | (int) 0-12              | `defaultColM` value           |
| `defaultColM`        | (int) 0-12              | `defaultColS` value           |
| `children`           | List[ResponsiveChild()] | not null / required / empty[] |
| `alignment`          | WrapAlignment           | WrapAlignment.start           |
| `runAlignment`       | WrapAlignment           | WrapAlignment.start           |
| `crossAxisAlignment` | WrapCrossAlignment      | WrapCrossAlignment.start      |
| `runSpacing`         | double                  | 0.0                           |


 0 - 0.0 width (gone) (replaced with empty SizedBox() of width,height as 0.0)

 12 - full width (provided by parent widget not screen width) 

## 2. ResponsiveChild()

To Override the `defaultCol` size use ResponsiveChild() `col` value.

ResponsiveChild() intakes child & column sizes.

| Arguments | inputs     | if null             |
|-----------|------------|---------------------|
| `colS`    | (int) 0-12 | `defaultColS` value |
| `colM`    | (int) 0-12 | `defaultColM` value |
| `colL`    | (int) 0-12 | `defaultColL` value |
| `child`   | Widget     | not null / required |
| `offsetS` | (int) 0-12 | 0                   |
| `offsetM` | (int) 0-12 | 0                   |
| `offsetL` | (int) 0-12 | 0                   |



### Offset

- To offset, simply add `offsetS` /`offsetM` /`offsetL` to the ResponsiveChild() widget with respective size.
- if `offset`  is not null , then the respective `col` shouldn't be null
- sum of the `offset` and the respective `col` should be <= to `12`

### Lite Example

```dart
    Responsive(
        defaultColS : 12, //defaults to 12
        defaultColM : 6, //defaults to 12
        defaultColL : 4, //defaults to 12
        children:<Widget>[
          ResponsiveChild(           
            colS: 10,  // colS & ColL override the defaultCol size
            colL: 3,
            offsetS :2 // added offset 
            child:  Container(
              color: Colors.amber,
              alignment: Alignment.center,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('child 1'),
              ),
            ),
          ),
          ResponsiveChild( // as colM not mentioned, it takes the defaulColM size
            colS: 10, 
            colL: 3,
            child: Container(
            alignment: Alignment.center,
            color: Colors.redAccent,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Child 2'),
                ),
            ),
          ),
        ]
    )    

```

## Note 
- `ResponsiveChild()` works only as direct child of `Responsive()` widget
- Sum of the `offset` and the respective `col` should be <= to `12`

## Nested Responsive

Placing a Responsive() widget into a Responsive().

The child Responsive() widget takes a width provided by Parent Responsive() widget and **not the screen width**

# Screens

<img src="https://raw.githubusercontent.com/bharathraj-e/responsive_ui/master/pics/c1.png" width="100%">

<img src="https://raw.githubusercontent.com/bharathraj-e/responsive_ui/master/pics/lap.png" width="100%">

<img src='https://raw.githubusercontent.com/bharathraj-e/responsive_ui/master/pics/out.gif' width='100%' >

```dart
class ResponsiveExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[350],
        appBar: AppBar(
          title: Text('Responsive Example'),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.pink,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Responsive(
                  defaultColS: 12,
                  defaultColM: 6,
                  defaultColL: 3,
                  children: <ResponsiveChild>[
                    ResponsiveChild(
                      child: Card(
                        color: Colors.amber,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('S12 M6 L3'),
                        ),
                      ),
                    ),
                    ResponsiveChild(
                      child: Card(
                        color: Colors.blue,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('S12 M6 L3'),
                        ),
                      ),
                    ),
                    ResponsiveChild(
                      child: Card(
                        color: Colors.grey,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('S12 M6 L3'),
                        ),
                      ),
                    ),
                    ResponsiveChild(
                      child: Card(
                        child: Container(
                            padding: EdgeInsets.all(10),
                            color: Colors.orangeAccent,
                            child: Column(
                              children: <Widget>[
                                Responsive(
                                  // nested Col12 widget
                                  defaultColS: 4,
                                  defaultColM: 4,
                                  defaultColL: 4,
                                  children: <ResponsiveChild>[
                                    ResponsiveChild(
                                      child: Card(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('S4 M4 L4 Nested'),
                                        ),
                                      ),
                                    ),
                                    ResponsiveChild(
                                      child: Card(
                                        color: Colors.lime,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('S4 M4 L4 Nested'),
                                        ),
                                      ),
                                    ),
                                    ResponsiveChild(
                                      child: Card(
                                        color: Colors.indigo,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('S4 M4 L4 Nested'),
                                        ),
                                      ),
                                    ),
                                    ResponsiveChild(
                                      colS: 12,
                                      colM: 12,
                                      colL: 12,
                                      child: Card(
                                        color: Colors.redAccent,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('S12 M7 L12 Nested'),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      Text('S12 M6 L3 (Nested Responsive Row)'),
                                )
                              ],
                            )),
                      ),
                    ),
                    ResponsiveChild(
                      colL: 4,
                      colS: 2,
                      colM: 5,
                      offsetS: 4,
                      offsetM: 1,
                      offsetL: 2,
                      child: Card(
                        color: Colors.cyan,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('S2 M5 L4 \noffset S4 M1 L2 '),
                        ),
                      ),
                    ),
                    ResponsiveChild(
                      colL: 2,
                      colS: 2,
                      colM: 2,
                      child: Card(
                        color: Colors.deepPurpleAccent,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('S2 M2 L2'),
                        ),
                      ),
                    ),
                    ResponsiveChild(
                      colL: 4,
                      colS: 4,
                      colM: 4,
                      child: Card(
                        color: Colors.cyanAccent,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('S4 M4 L4'),
                        ),
                      ),
                    ),
                    ResponsiveChild(
                      child: Card(
                        color: Colors.green,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('S12 M6 L3'),
                        ),
                      ),
                    ),
                    ResponsiveChild(
                      child: Card(
                        color: Colors.deepPurple,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('S12 M6 L3'),
                        ),
                      ),
                    ),
                  ]),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Responsive'),
              )
            ],
          ),
        ));
  }
}
```
**responsive_ui** is made simply using Wrap() and LayoutBuilder() with a bits of logics.

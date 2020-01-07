# Responsive UI

[![Pub](https://img.shields.io/pub/v/responsive_ui.svg?style=flat-square)](https://pub.dartlang.org/packages/responsive_ui)

responsive_ui Flutter package helps you to create a responsive widget and Nested responsive widget too. Works on all flutter platform (android, iOs ,**web** ) with both portrait and LandScape mode.

## Getting Started

It works as same as Bootstrap Row Column method, Splitting screen into 12 columns and placing widget by combining column based on screen size.

# Screens

**For phones ~ screen size <= 600px wide**

<img src="https://raw.githubusercontent.com/bharathraj-e/responsive_ui/master/pics/mobile.png" width="50%">

**For tablets - screen size > 600px wide && <= 990 px wide**

<img src="https://raw.githubusercontent.com/bharathraj-e/responsive_ui/master/pics/tab.png" width="75%">


**For laptops ~ screen size > 990px wide

<img src="https://raw.githubusercontent.com/bharathraj-e/responsive_ui/master/pics/lap.png" width="100%">



# Widgets

## 1. Responsive()

Responsive intakes List\<Widget> & default column size for each widget can be declared.

```dart
    Responsive(
        defaultColS : 12,//default column size for Small screen 12
        defaultColM : 6, //default column size for Medium screen 12
        defaultColL : 4, //default column size for Large screen 12
        children:<Widget>[
            Container(
                color: Colors.amber,
                alignment: Alignment.center,
                child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('child 1'),
                ),
            ),
            Container(
                color: Colors.blue,
                alignment: Alignment.center,
                child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('child 2'),
                ),
            ),
        ]
    )    
```

 `defaultColS`, `defaultColM`, `defaultColL` default to  `12` & various from [0-12] 

 0 - 0.0 width (gone)

 12 - full width (provided by parent widget not screen width) 

## 2. Col()

To Override the `defaultCol` size use Col() as a widget in Responsive().

Col() intakes child & column sizes.


## Lite Example

```dart
    Responsive(
        defaultColS : 12, //defaults to 12
        defaultColM : 6, //defaults to 12
        defaultColL : 4, //defaults to 12
        children:<Widget>[
             Container(
                color: Colors.amber,
                alignment: Alignment.center,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('child 1'),
                ),
            ),
            Col(           // as colM not mentioned, it takes the defaulColM size
                colS: 10,  // colS & ColL override the defaultCol size
                colL: 3,
                child: Container(
                alignment: Alignment.center,
                color: Colors.redAccent,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Col Child'),
                    ),
                ),
            ),
            Container(
                color: Colors.blue,
                alignment: Alignment.center,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('child 3'),
                ),
            ),
        ]
    )    

```
**Col() works only as direct child of Responsive() widget**

## Nested Responsive

Placing a Responsive() widget into a Responsive().

The child Responsive() widget takes a width provided by Parent Responsive() widget and **not the screen width**

## Complete Example

<img src='https://raw.githubusercontent.com/bharathraj-e/responsive_ui/master/pics/out.gif' width='90%' >

```dart
class FullExample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  children: <Widget>[
                    Container(
                      color: Colors.amber,
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('child 1'),
                      ),
                    ),
                    Container(
                      color: Colors.blue,
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('child 2'),
                      ),
                    ),
                    Container(
                      color: Colors.grey,
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('child 3'),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.orangeAccent,
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Responsive(
                              // nested Responsive widget
                              defaultColS: 4,
                              defaultColM: 4,
                              defaultColL: 4,
                              children: <Widget>[
                                Container(
                                  color: Colors.white,
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Nested child 1'),
                                  ),
                                ),
                                Container(
                                  color: Colors.lime,
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Nested child 2'),
                                  ),
                                ),
                                Container(
                                  color: Colors.indigo,
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Nested child 3'),
                                  ),
                                ),
                                Col(
                                  colS: 12,
                                  colM: 12,
                                  colL: 12,
                                  child: Container(
                                    alignment: Alignment.center,
                                    color: Colors.redAccent,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Nested Col'),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('child 4 ~ Nested Responsive Widget'),
                            )
                          ],
                        )),
                    Col(
                      colL: 6,
                      colS: 6,
                      colM: 6,
                      child: Container(
                        color: Colors.cyan,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Col 1'),
                        ),
                      ),
                    ),
                    Col(
                      colL: 6,
                      colS: 6,
                      colM: 6,
                      child: Container(
                        color: Colors.cyanAccent,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Col 2'),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.green,
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('child 5'),
                      ),
                    ),
                    Container(
                      color: Colors.deepPurple,
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('child 6'),
                      ),
                    ),
                  ]),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Responsive Widget'),
              )
            ],
          ),
        ),
    );
  }
}
```

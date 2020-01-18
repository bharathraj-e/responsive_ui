# Responsive UI

### [responsive_ui](https://pub.dev/packages/responsive_ui)  package helps you to create a responsive widget and Nested responsive widget too. Works on all flutter platform (android, iOs ,**web** ) with both Portrait and LandScape mode.

## sample video

[https://youtu.be/2koIFANjJZg](https://youtu.be/2koIFANjJZg)

[![Watch the video](https://img.youtube.com/vi/2koIFANjJZg/maxresdefault.jpg)](https://youtu.be/2koIFANjJZg)


## Lite Example

```dart
    Responsive(
        defaultColS: 12, //defaults to 12
        defaultColM: 6, //defaults to 12
        defaultColL: 4, //defaults to 12
        children: <ResponsiveChild>[
          ResponsiveChild(
            child: Container(
              color: Colors.amber,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('child 1'),
              ),
            ),
          ),
          ResponsiveChild(
            // as colM not mentioned, it takes the defaulColM size
            colS: 10, // colS & ColL override the defaultCol size
            colL: 3,
            child: Container(
              alignment: Alignment.center,
              color: Colors.redAccent,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('ResponsiveColumn Child'),
              ),
            ),
          ),
          ResponsiveChild(
            child: Container(
              color: Colors.blue,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('child 2'),
              ),
            ),
          ),
          ResponsiveChild(
            child: Responsive(   //nested Responsive()
                defaultColS: 12, //column size for Small screen
                defaultColM: 6, //column size for Medium screen
                defaultColL: 4, //column size for Large screen
                children: <ResponsiveChild>[
                  ResponsiveChild(
                    child: Container(
                      color: Colors.amber,
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('child 1'),
                      ),
                    ),
                  ),
                  ResponsiveChild(
                    child: Container(
                      color: Colors.blue,
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('child 2'),
                      ),
                    ),
                  ),
                ]),
          )
        ]);    
```

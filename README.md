# PhoneNumberInput Flutter Widget
Welcome to the initial release of PhoneNumberInput, a Flutter widget that allows users to input phone numbers with country code selection. Stay tuned for more exciting features in future releases!

## Demo




| 	Demo 1	 | 	Demo 2	 |
| 	![Demo 1](./example/assets/phoneNumber_InputDemo%20(3).jpeg)	 | 	![Demo 2](./example/assets/phoneNumber_InputDemo%20(2).jpeg)	 |

| 	Demo 3	 | 	Demo 4	 |
| 	![Demo 3](./example/assets/phoneNumber_InputDemo%20(1).jpeg)	 | 	![Demo 4](./example/assets/phoneNumber_InputDemo%20(4).jpeg)	 |

## Features
Phone number input with country code selection
Customizable label, styles, and dark mode support
Callbacks for country code and phone number changes.

## Installation
To use this widget in your Flutter project, add the following to your `pubspec.yaml` file:
```yaml
dependencies:
  phonenumber_input: ^1.0.0
```
Then, run:
```js
flutter pub get
```

## Usage

```dart
import 'package:flutter/material.dart';
import 'package:phonenumber_input/phonenumber_input.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('PhoneNumberInput Demo'),
        ),
        body: Center(
          child: PhoneNumberInput(
            labelText: 'Phone Number',
            isDarkMode: false,
            onCountryCodeChanged: (code) {
              print('Country code changed: $code');
            },
            onPhoneNumberChanged: (phoneNumber) {
              print('Phone number changed: $phoneNumber');
            },
          ),
        ),
      ),
    );
  }
}
```

## Widget Properties
- `labelText (String)`: The label text for the phone number input.
- `padding (EdgeInsetsGeometry)`: Padding for the widget.
- `labelStyle (TextStyle)`: Style for the label text.
- `countryCodeStyle (TextStyle)`: Style for the country code text.
- `isDarkMode (bool)`: Set to true for dark mode, false for light mode.
- `onCountryCodeChanged (Function(String)?)`: Callback for country code changes.
- `onPhoneNumberChanged (Function(String)?)`: Callback for phone number changes.

## Example

```dart
PhoneNumberInput(
  labelText: 'Phone Number',
  isDarkMode: false,
  onCountryCodeChanged: (code) {
    print('Country code changed: $code');
  },
  onPhoneNumberChanged: (phoneNumber) {
    print('Phone number changed: $phoneNumber');
  },
)
```
Thank you for using PhoneNumberInput! Feel free to contribute, report issues, or suggest new features. Enjoy coding with Flutter!
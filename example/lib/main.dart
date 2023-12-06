import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:phonenumber_input/phonenumber_input.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Brightness brightness =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;
  bool darkModeOn = false;

  @override
  void initState() {
    super.initState();
    darkModeOn = brightness == Brightness.dark;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          darkModeOn ? const Color.fromARGB(221, 48, 48, 48) : Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            PhoneNumberInput(
              labelText: "Phone Number",
              isDarkMode: darkModeOn,
              onCountryCodeChanged: (value) {
                print(value);
              },
              onPhoneNumberChanged: (value) {
                print(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}

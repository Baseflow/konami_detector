import 'package:example/konami_codes/show_device_info_konami_code.dart';
import 'package:example/konami_codes/test_crash_konami_code.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:konami_detector/konami_detector.dart';

void main() {
  const enviroment = Environment.development;
  runApp(const MyApp(
    enviroment: enviroment,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.enviroment,
  }) : super(key: key);

  final Environment enviroment;

  @override
  Widget build(
    BuildContext context,
  ) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(enviroment: enviroment),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    Key? key,
    required this.enviroment,
  }) : super(key: key);

  final Environment enviroment;

  @override
  Widget build(
    BuildContext context,
  ) {
    return KonamiDetector(
      codes: [
        if (enviroment != Environment.production) TestCrashKonamiCode(),
        ShowDeviceInfoKonamiCode(),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo Home Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                height: MediaQuery.of(context).size.width * 0.75,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.greenAccent,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Show Device Info: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      ShowDeviceInfoKonamiCode()
                          .codes
                          .map(describeEnum)
                          .join(', '),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Test Crash",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      TestCrashKonamiCode().codes.map(describeEnum).join(', '),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum Environment { development, staging, production }

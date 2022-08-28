import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  const myApp = MyApp();
  runApp(
    const ProviderScope(child: myApp),
  );
}
//bima pus tgl 28
//bima push 28(2)
//bima push 28(33)
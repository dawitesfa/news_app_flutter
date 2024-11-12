import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/src/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  registerErrorHandling();
  runApp(const ProviderScope(child: NewsApp()));
}

void registerErrorHandling() {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    debugPrint(details.toString());
  };
  PlatformDispatcher.instance.onError = (Object error, StackTrace stk) {
    debugPrint(error.toString());
    return true;
  };

  ErrorWidget.builder = (FlutterErrorDetails details) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('An Error occured'),
        ),
        body: Center(
          child: Text(
            details.toString(),
          ),
        ),
      );
}

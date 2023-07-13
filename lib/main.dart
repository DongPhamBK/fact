import 'package:fact/fact_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MaterialApp(
        home: Scaffold(
          body: MyApp(),
        ),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fact = ref.watch(factFutureProvider);
    /*
    Automatically get API and display data every 10 seconds
     */
    return fact.when(
      data: (data) => Text(data),
      error: (error, stackTrace) => const Text("Error"),
      loading: () => const CircularProgressIndicator(),
    );
  }
}

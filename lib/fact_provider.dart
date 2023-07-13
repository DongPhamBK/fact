import 'package:fact/fact_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final factFutureProvider = FutureProvider((ref) {
  return ref.watch(factProvider).factData;
});

final factProvider = ChangeNotifierProvider((ref) {
  final factService = ref.read(factServiceProvider);
  return FactProvider(factService: factService);
});

class FactProvider extends ChangeNotifier {
  String factData = "";
  late FactService factService;

  FactProvider({
    required this.factService,
  });

  void getNewFact() async {
    factData = await factService.getFact();
    notifyListeners();
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeController extends StateNotifier<List<Map<String, dynamic>?>> {
  HomeController() : super([]);

  void add(String category, dynamic value) {
    var myState = [...state];
    var findIndex = myState.indexWhere(
      (element) => element!['category'] == category && element['value'] == value,
    );
    if (findIndex == -1) {
      myState.add({
        'category': category,
        'value': value,
      });
    }
    state = myState;
  }
}

final homeController = StateNotifierProvider<HomeController, List<Map<String, dynamic>?>>(
  (ref) => HomeController(),
);

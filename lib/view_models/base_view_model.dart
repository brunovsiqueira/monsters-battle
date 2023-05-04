import 'package:flutter/widgets.dart';

class BaseViewModel extends ChangeNotifier {
  bool isDisposed = false;
  //TODO: create viewmodelstatusenum

  @override
  void dispose() {
    isDisposed = true;
    super.dispose();
  }

  void notify() {
    if (!isDisposed) {
      notifyListeners();
    }
  }
}

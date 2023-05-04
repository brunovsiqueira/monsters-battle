import 'package:flutter/widgets.dart';
import 'package:monsters_battle/enums/view_model_status_enum.dart';

class BaseViewModel extends ChangeNotifier {
  ViewModelStatusEnum status = ViewModelStatusEnum.idle;
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

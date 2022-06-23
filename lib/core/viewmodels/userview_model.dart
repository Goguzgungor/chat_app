import 'package:chat_app/core/memory/hive_constant.dart';
import 'package:chat_app/core/memory/hive_menager.dart';
import 'package:mobx/mobx.dart';
part 'userview_model.g.dart';

class UserViewModel = _UserViewModelBase with _$UserViewModel;

abstract class _UserViewModelBase with Store {
  @observable
  ObservableList userList = ObservableList.of([]);

  @action
  void getData() {
    List temp = HiveManager.instance.getListFromBox(HiveBoxes.USER);
    if (temp.isNotEmpty) userList = ObservableList.of(temp);
  }
}

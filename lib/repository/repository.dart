import 'package:tp_groupe5/models/userModel.dart';

abstract class Repository {
  //get
  Future<List<UserModel>> getAllUsers();
  //path
  Future<String> patchCompleted(UserModel userModel);
  Future<String> putCompleted(UserModel user);
  Future<String> delectedUser(UserModel user);

  Future<String> postUser(UserModel user);
}

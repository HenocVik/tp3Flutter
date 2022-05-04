import 'package:tp_groupe5/models/userModel.dart';
import 'package:tp_groupe5/repository/repository.dart';

class UserController {
  final Repository _repository;
  UserController(this._repository);
  Future<List<UserModel>> fetchUserlist() async {
    return _repository.getAllUsers();
  }

  Future<String> updatedPathCompleted(UserModel user) async {
    return _repository.patchCompleted(user);
  }

  Future<String> updatedPutCompleted(UserModel user) async {
    return _repository.putCompleted(user);
  }

  Future<String> delecteUser(UserModel user) async {
    return _repository.delectedUser(user);
  }

  /*Future<String> addUser(UserModel user) async {
    return _repository.postUser(user.id, user.firstname, user.lastname,
        user.gender, user.adress, user.phone, user.picture, user.citation);
  }*/

  Future<String> addUser(UserModel user) async {
    return _repository.postUser(user);
  }
}

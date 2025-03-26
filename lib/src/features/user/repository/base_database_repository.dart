import '../model/user_model.dart';

abstract class BaseDatabaseRepository {
  Stream<UserModel> getUser(String userId);
  Future<void> createUser(UserModel user);
  Future<void> updateUser(UserModel user);
}

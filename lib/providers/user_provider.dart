import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_practice/models/user.dart';

part 'user_provider.g.dart';

@riverpod
class UserNotifier extends _$UserNotifier {
  @override
  User build() {
    return User(id: 0, height: 0, weight: 0);
  }

  void updateUser(User user) {}
}

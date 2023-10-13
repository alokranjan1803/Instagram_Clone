import 'package:flutter/widgets.dart';
import 'package:instagram_clone/models/user.dart';
import 'package:instagram_clone/resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AuthMethods _authMethods = AuthMethods();

  User get getUser {
    if (_user != null) {
      return _user!;
    } else {
      // Handle the null case here, such as returning a default user or throwing an error.
      // For example, you can return a default user with empty values:
      return const User(
        username: '',
        uid: '',
        email: '',
        photoUrl: '',
        bio: '',
        followers: [],
        following: [],
      );
    }
  }

  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
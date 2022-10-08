import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_http_get_request/models/user_model.dart';
import '../services/services.dart';

final userDataProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.watch(userProvider).getUsers();
});

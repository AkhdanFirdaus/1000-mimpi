import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/network/api.dart';
import '../models/user.dart';

// final favoriteUserFutureProvider =
//     FutureProviderFamily<List<User>, int>((ref, userId) async {
//   final api = ref.read(apiProvider);
//   final response = await api.get(ApiConst.favoriteWebinar(userId));
//   return (response.data['data'] as List)
//       .map<User>((e) => User.fromJson(e as Json))
//       .toList();
// });

final userProvider = StateNotifierProvider<UserNotifier, UserState>((ref) {
  final _api = ref.read(apiProvider);
  return UserNotifier(_api);
});

class UserNotifier extends StateNotifier<UserState> {
  final Dio api;

  UserNotifier(this.api) : super(UserState.unauthenticated());

  void loadUser(UserState data) {
    state = data.map(
      userGuest: (value) => value,
      user: (value) => value,
      eventOrganizer: (value) => value,
      error: (value) => value,
      unauthenticated: (value) => value,
    );
  }

  void loginGuest({
    required String firstName,
    required String lastName,
    required int role,
  }) {
    final user = UserState.userGuest(
      firstName: firstName,
      lastName: lastName,
      role: role,
    );
    state = user;
  }

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    final response = await api.post(ApiConst.login, data: {
      'email': email,
      'password': password,
    });
    try {
      final user = User.fromJson(response.data['data']);
      state = UserState.user(
        id: user.id,
        name: user.name,
        email: user.email,
        notelp: user.notelp,
        asal: user.asal,
        role: user.role,
      );
    } catch (_) {
      state = UserState.error("Invalid credential");
    }
  }

  Future<void> loginEventOrganizer({
    required String email,
    required String password,
  }) async {
    final response = await api.post(ApiConst.login, data: {
      'email': email,
      'password': password,
    });
    try {
      final user = User.fromJson(response.data['data']);
      state = UserState.eventOrganizer(
        id: user.id,
        name: user.name,
        email: user.email,
        notelp: user.notelp,
        asal: user.asal,
        role: user.role,
      );
    } catch (_) {
      state = UserState.error("Invalid credential");
    }
  }

  Future<UserState> loginWithId(int id) async {
    final response = await api.post(ApiConst.loginWithId, data: {
      'user_id': id,
    });
    try {
      final user = User.fromJson(response.data['data']);
      state = user;
      return state;
    } catch (_) {
      state = UserState.error("User Not Found");
      return state;
    }
  }

  Future<void> registerUser({
    required String name,
    required String email,
    required String nomorTelp,
    required String password,
    required String asal,
    required int role,
  }) async {
    try {
      final response = await api.post(ApiConst.register, data: {
        'name': name,
        'nomor_telp': nomorTelp,
        'email': email,
        'password': password,
        'asal': asal,
        'role': role,
      });

      if (response.statusCode == 200) {
        final user = await loginWithId(response.data['user_id'] as int);
        state = user;
      } else {
        state = UserState.error(response.data['message'] as String);
      }
    } catch (e) {
      state = UserState.error("Gagal register");
    }
  }

  void logout() async {
    state = UserState.unauthenticated();
  }

  Future<String> favorite(int userId, int penyelenggaraId) async {
    try {
      final response = await api.post(ApiConst.favorite, data: {
        'user_id': userId,
        'penyelenggara_id': penyelenggaraId,
      });
      return response.data['message'] as String;
    } catch (e) {
      throw ErrorMessage("Gagal Favorite");
    }
  }
}

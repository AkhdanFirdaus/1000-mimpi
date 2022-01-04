import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:seribu_mimpi/features/event/index.dart';

import '../../../core/network/api.dart';
import '../../auth/index.dart';

final creatorFutureProvider = FutureProvider<List<User>>((ref) async {
  final api = ref.read(apiProvider);
  final response = await api.get(ApiConst.penyelenggara);
  return (response.data['data'] as List)
      .map<User>((e) => User.fromJson(e as Json))
      .toList();
});

final creatorDetailFutureProvider =
    FutureProviderFamily<User, int>((ref, id) async {
  final api = ref.read(apiProvider);
  final response = await api.get(ApiConst.penyelenggaraDetail(id));
  return User.fromJson(response.data['data'] as Json);
});

final creatorEventsFutureProvider =
    FutureProviderFamily<List<Event>, int>((ref, userId) async {
  final api = ref.read(apiProvider);
  final response = await api.get(ApiConst.penyelenggaraWebinar(userId));
  return (response.data['data'] as List)
      .map<Event>((e) => Event.fromJson(e as Json))
      .toList();
});

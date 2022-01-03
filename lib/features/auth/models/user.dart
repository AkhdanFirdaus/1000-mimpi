import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'user.freezed.dart';
part 'user.g.dart';

typedef Json = Map<String, dynamic>;

final userState = Provider<UserState>((ref) {
  return UserState.unauthenticated();
});

@freezed
class UserState with _$UserState {
  factory UserState.userGuest({
    required final String firstName,
    required final String lastName,
    required final int role,
  }) = UserGuest;

  factory UserState.user({
    @JsonKey(name: 'id') required final int id,
    @JsonKey(name: 'name') required final String name,
    @JsonKey(name: 'email') required final String email,
    @JsonKey(name: 'nomor_telp') required final String notelp,
    @JsonKey(name: 'asal') required final String asal,
    @JsonKey(name: 'role') required final int role,
  }) = User;

  factory UserState.eventOrganizer({
    @JsonKey(name: 'id') required final int id,
    @JsonKey(name: 'name') required final String name,
    @JsonKey(name: 'email') required final String email,
    @JsonKey(name: 'nomor_telp') required final String notelp,
    @JsonKey(name: 'asal') required final String asal,
    @JsonKey(name: 'role') required final int role,
  }) = UserEventOrganizer;

  factory UserState.error(String message) = Error;

  factory UserState.unauthenticated() = Unauthenticated;

  factory UserState.fromJson(Json json) => _$UserStateFromJson(json);
}

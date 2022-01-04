// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserState _$UserStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'userGuest':
      return UserGuest.fromJson(json);
    case 'user':
      return User.fromJson(json);
    case 'error':
      return Error.fromJson(json);
    case 'unauthenticated':
      return Unauthenticated.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'UserState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
class _$UserStateTearOff {
  const _$UserStateTearOff();

  UserGuest userGuest() {
    return UserGuest();
  }

  User user(
      {@JsonKey(name: 'id') required int id,
      @JsonKey(name: 'name') required String name,
      @JsonKey(name: 'email') required String email,
      @JsonKey(name: 'nomor_telp') required String notelp,
      @JsonKey(name: 'asal') required String asal,
      @JsonKey(name: 'role') required int role}) {
    return User(
      id: id,
      name: name,
      email: email,
      notelp: notelp,
      asal: asal,
      role: role,
    );
  }

  Error error(String message) {
    return Error(
      message,
    );
  }

  Unauthenticated unauthenticated() {
    return Unauthenticated();
  }

  UserState fromJson(Map<String, Object?> json) {
    return UserState.fromJson(json);
  }
}

/// @nodoc
const $UserState = _$UserStateTearOff();

/// @nodoc
mixin _$UserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() userGuest,
    required TResult Function(
            @JsonKey(name: 'id') int id,
            @JsonKey(name: 'name') String name,
            @JsonKey(name: 'email') String email,
            @JsonKey(name: 'nomor_telp') String notelp,
            @JsonKey(name: 'asal') String asal,
            @JsonKey(name: 'role') int role)
        user,
    required TResult Function(String message) error,
    required TResult Function() unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? userGuest,
    TResult Function(
            @JsonKey(name: 'id') int id,
            @JsonKey(name: 'name') String name,
            @JsonKey(name: 'email') String email,
            @JsonKey(name: 'nomor_telp') String notelp,
            @JsonKey(name: 'asal') String asal,
            @JsonKey(name: 'role') int role)?
        user,
    TResult Function(String message)? error,
    TResult Function()? unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? userGuest,
    TResult Function(
            @JsonKey(name: 'id') int id,
            @JsonKey(name: 'name') String name,
            @JsonKey(name: 'email') String email,
            @JsonKey(name: 'nomor_telp') String notelp,
            @JsonKey(name: 'asal') String asal,
            @JsonKey(name: 'role') int role)?
        user,
    TResult Function(String message)? error,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserGuest value) userGuest,
    required TResult Function(User value) user,
    required TResult Function(Error value) error,
    required TResult Function(Unauthenticated value) unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserGuest value)? userGuest,
    TResult Function(User value)? user,
    TResult Function(Error value)? error,
    TResult Function(Unauthenticated value)? unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserGuest value)? userGuest,
    TResult Function(User value)? user,
    TResult Function(Error value)? error,
    TResult Function(Unauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res> implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  final UserState _value;
  // ignore: unused_field
  final $Res Function(UserState) _then;
}

/// @nodoc
abstract class $UserGuestCopyWith<$Res> {
  factory $UserGuestCopyWith(UserGuest value, $Res Function(UserGuest) then) =
      _$UserGuestCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserGuestCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements $UserGuestCopyWith<$Res> {
  _$UserGuestCopyWithImpl(UserGuest _value, $Res Function(UserGuest) _then)
      : super(_value, (v) => _then(v as UserGuest));

  @override
  UserGuest get _value => super._value as UserGuest;
}

/// @nodoc
@JsonSerializable()
class _$UserGuest implements UserGuest {
  _$UserGuest({String? $type}) : $type = $type ?? 'userGuest';

  factory _$UserGuest.fromJson(Map<String, dynamic> json) =>
      _$$UserGuestFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'UserState.userGuest()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UserGuest);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() userGuest,
    required TResult Function(
            @JsonKey(name: 'id') int id,
            @JsonKey(name: 'name') String name,
            @JsonKey(name: 'email') String email,
            @JsonKey(name: 'nomor_telp') String notelp,
            @JsonKey(name: 'asal') String asal,
            @JsonKey(name: 'role') int role)
        user,
    required TResult Function(String message) error,
    required TResult Function() unauthenticated,
  }) {
    return userGuest();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? userGuest,
    TResult Function(
            @JsonKey(name: 'id') int id,
            @JsonKey(name: 'name') String name,
            @JsonKey(name: 'email') String email,
            @JsonKey(name: 'nomor_telp') String notelp,
            @JsonKey(name: 'asal') String asal,
            @JsonKey(name: 'role') int role)?
        user,
    TResult Function(String message)? error,
    TResult Function()? unauthenticated,
  }) {
    return userGuest?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? userGuest,
    TResult Function(
            @JsonKey(name: 'id') int id,
            @JsonKey(name: 'name') String name,
            @JsonKey(name: 'email') String email,
            @JsonKey(name: 'nomor_telp') String notelp,
            @JsonKey(name: 'asal') String asal,
            @JsonKey(name: 'role') int role)?
        user,
    TResult Function(String message)? error,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (userGuest != null) {
      return userGuest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserGuest value) userGuest,
    required TResult Function(User value) user,
    required TResult Function(Error value) error,
    required TResult Function(Unauthenticated value) unauthenticated,
  }) {
    return userGuest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserGuest value)? userGuest,
    TResult Function(User value)? user,
    TResult Function(Error value)? error,
    TResult Function(Unauthenticated value)? unauthenticated,
  }) {
    return userGuest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserGuest value)? userGuest,
    TResult Function(User value)? user,
    TResult Function(Error value)? error,
    TResult Function(Unauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (userGuest != null) {
      return userGuest(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UserGuestToJson(this);
  }
}

abstract class UserGuest implements UserState {
  factory UserGuest() = _$UserGuest;

  factory UserGuest.fromJson(Map<String, dynamic> json) = _$UserGuest.fromJson;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'nomor_telp') String notelp,
      @JsonKey(name: 'asal') String asal,
      @JsonKey(name: 'role') int role});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(User _value, $Res Function(User) _then)
      : super(_value, (v) => _then(v as User));

  @override
  User get _value => super._value as User;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? notelp = freezed,
    Object? asal = freezed,
    Object? role = freezed,
  }) {
    return _then(User(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      notelp: notelp == freezed
          ? _value.notelp
          : notelp // ignore: cast_nullable_to_non_nullable
              as String,
      asal: asal == freezed
          ? _value.asal
          : asal // ignore: cast_nullable_to_non_nullable
              as String,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$User implements User {
  _$User(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'email') required this.email,
      @JsonKey(name: 'nomor_telp') required this.notelp,
      @JsonKey(name: 'asal') required this.asal,
      @JsonKey(name: 'role') required this.role,
      String? $type})
      : $type = $type ?? 'user';

  factory _$User.fromJson(Map<String, dynamic> json) => _$$UserFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'email')
  final String email;
  @override
  @JsonKey(name: 'nomor_telp')
  final String notelp;
  @override
  @JsonKey(name: 'asal')
  final String asal;
  @override
  @JsonKey(name: 'role')
  final int role;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'UserState.user(id: $id, name: $name, email: $email, notelp: $notelp, asal: $asal, role: $role)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is User &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.notelp, notelp) &&
            const DeepCollectionEquality().equals(other.asal, asal) &&
            const DeepCollectionEquality().equals(other.role, role));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(notelp),
      const DeepCollectionEquality().hash(asal),
      const DeepCollectionEquality().hash(role));

  @JsonKey(ignore: true)
  @override
  $UserCopyWith<User> get copyWith =>
      _$UserCopyWithImpl<User>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() userGuest,
    required TResult Function(
            @JsonKey(name: 'id') int id,
            @JsonKey(name: 'name') String name,
            @JsonKey(name: 'email') String email,
            @JsonKey(name: 'nomor_telp') String notelp,
            @JsonKey(name: 'asal') String asal,
            @JsonKey(name: 'role') int role)
        user,
    required TResult Function(String message) error,
    required TResult Function() unauthenticated,
  }) {
    return user(id, name, email, notelp, asal, role);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? userGuest,
    TResult Function(
            @JsonKey(name: 'id') int id,
            @JsonKey(name: 'name') String name,
            @JsonKey(name: 'email') String email,
            @JsonKey(name: 'nomor_telp') String notelp,
            @JsonKey(name: 'asal') String asal,
            @JsonKey(name: 'role') int role)?
        user,
    TResult Function(String message)? error,
    TResult Function()? unauthenticated,
  }) {
    return user?.call(id, name, email, notelp, asal, role);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? userGuest,
    TResult Function(
            @JsonKey(name: 'id') int id,
            @JsonKey(name: 'name') String name,
            @JsonKey(name: 'email') String email,
            @JsonKey(name: 'nomor_telp') String notelp,
            @JsonKey(name: 'asal') String asal,
            @JsonKey(name: 'role') int role)?
        user,
    TResult Function(String message)? error,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (user != null) {
      return user(id, name, email, notelp, asal, role);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserGuest value) userGuest,
    required TResult Function(User value) user,
    required TResult Function(Error value) error,
    required TResult Function(Unauthenticated value) unauthenticated,
  }) {
    return user(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserGuest value)? userGuest,
    TResult Function(User value)? user,
    TResult Function(Error value)? error,
    TResult Function(Unauthenticated value)? unauthenticated,
  }) {
    return user?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserGuest value)? userGuest,
    TResult Function(User value)? user,
    TResult Function(Error value)? error,
    TResult Function(Unauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (user != null) {
      return user(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UserToJson(this);
  }
}

abstract class User implements UserState {
  factory User(
      {@JsonKey(name: 'id') required int id,
      @JsonKey(name: 'name') required String name,
      @JsonKey(name: 'email') required String email,
      @JsonKey(name: 'nomor_telp') required String notelp,
      @JsonKey(name: 'asal') required String asal,
      @JsonKey(name: 'role') required int role}) = _$User;

  factory User.fromJson(Map<String, dynamic> json) = _$User.fromJson;

  @JsonKey(name: 'id')
  int get id;
  @JsonKey(name: 'name')
  String get name;
  @JsonKey(name: 'email')
  String get email;
  @JsonKey(name: 'nomor_telp')
  String get notelp;
  @JsonKey(name: 'asal')
  String get asal;
  @JsonKey(name: 'role')
  int get role;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) then) =
      _$ErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$ErrorCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(Error _value, $Res Function(Error) _then)
      : super(_value, (v) => _then(v as Error));

  @override
  Error get _value => super._value as Error;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(Error(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Error implements Error {
  _$Error(this.message, {String? $type}) : $type = $type ?? 'error';

  factory _$Error.fromJson(Map<String, dynamic> json) => _$$ErrorFromJson(json);

  @override
  final String message;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'UserState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Error &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  $ErrorCopyWith<Error> get copyWith =>
      _$ErrorCopyWithImpl<Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() userGuest,
    required TResult Function(
            @JsonKey(name: 'id') int id,
            @JsonKey(name: 'name') String name,
            @JsonKey(name: 'email') String email,
            @JsonKey(name: 'nomor_telp') String notelp,
            @JsonKey(name: 'asal') String asal,
            @JsonKey(name: 'role') int role)
        user,
    required TResult Function(String message) error,
    required TResult Function() unauthenticated,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? userGuest,
    TResult Function(
            @JsonKey(name: 'id') int id,
            @JsonKey(name: 'name') String name,
            @JsonKey(name: 'email') String email,
            @JsonKey(name: 'nomor_telp') String notelp,
            @JsonKey(name: 'asal') String asal,
            @JsonKey(name: 'role') int role)?
        user,
    TResult Function(String message)? error,
    TResult Function()? unauthenticated,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? userGuest,
    TResult Function(
            @JsonKey(name: 'id') int id,
            @JsonKey(name: 'name') String name,
            @JsonKey(name: 'email') String email,
            @JsonKey(name: 'nomor_telp') String notelp,
            @JsonKey(name: 'asal') String asal,
            @JsonKey(name: 'role') int role)?
        user,
    TResult Function(String message)? error,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserGuest value) userGuest,
    required TResult Function(User value) user,
    required TResult Function(Error value) error,
    required TResult Function(Unauthenticated value) unauthenticated,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserGuest value)? userGuest,
    TResult Function(User value)? user,
    TResult Function(Error value)? error,
    TResult Function(Unauthenticated value)? unauthenticated,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserGuest value)? userGuest,
    TResult Function(User value)? user,
    TResult Function(Error value)? error,
    TResult Function(Unauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ErrorToJson(this);
  }
}

abstract class Error implements UserState {
  factory Error(String message) = _$Error;

  factory Error.fromJson(Map<String, dynamic> json) = _$Error.fromJson;

  String get message;
  @JsonKey(ignore: true)
  $ErrorCopyWith<Error> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnauthenticatedCopyWith<$Res> {
  factory $UnauthenticatedCopyWith(
          Unauthenticated value, $Res Function(Unauthenticated) then) =
      _$UnauthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnauthenticatedCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements $UnauthenticatedCopyWith<$Res> {
  _$UnauthenticatedCopyWithImpl(
      Unauthenticated _value, $Res Function(Unauthenticated) _then)
      : super(_value, (v) => _then(v as Unauthenticated));

  @override
  Unauthenticated get _value => super._value as Unauthenticated;
}

/// @nodoc
@JsonSerializable()
class _$Unauthenticated implements Unauthenticated {
  _$Unauthenticated({String? $type}) : $type = $type ?? 'unauthenticated';

  factory _$Unauthenticated.fromJson(Map<String, dynamic> json) =>
      _$$UnauthenticatedFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'UserState.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Unauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() userGuest,
    required TResult Function(
            @JsonKey(name: 'id') int id,
            @JsonKey(name: 'name') String name,
            @JsonKey(name: 'email') String email,
            @JsonKey(name: 'nomor_telp') String notelp,
            @JsonKey(name: 'asal') String asal,
            @JsonKey(name: 'role') int role)
        user,
    required TResult Function(String message) error,
    required TResult Function() unauthenticated,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? userGuest,
    TResult Function(
            @JsonKey(name: 'id') int id,
            @JsonKey(name: 'name') String name,
            @JsonKey(name: 'email') String email,
            @JsonKey(name: 'nomor_telp') String notelp,
            @JsonKey(name: 'asal') String asal,
            @JsonKey(name: 'role') int role)?
        user,
    TResult Function(String message)? error,
    TResult Function()? unauthenticated,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? userGuest,
    TResult Function(
            @JsonKey(name: 'id') int id,
            @JsonKey(name: 'name') String name,
            @JsonKey(name: 'email') String email,
            @JsonKey(name: 'nomor_telp') String notelp,
            @JsonKey(name: 'asal') String asal,
            @JsonKey(name: 'role') int role)?
        user,
    TResult Function(String message)? error,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserGuest value) userGuest,
    required TResult Function(User value) user,
    required TResult Function(Error value) error,
    required TResult Function(Unauthenticated value) unauthenticated,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UserGuest value)? userGuest,
    TResult Function(User value)? user,
    TResult Function(Error value)? error,
    TResult Function(Unauthenticated value)? unauthenticated,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserGuest value)? userGuest,
    TResult Function(User value)? user,
    TResult Function(Error value)? error,
    TResult Function(Unauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UnauthenticatedToJson(this);
  }
}

abstract class Unauthenticated implements UserState {
  factory Unauthenticated() = _$Unauthenticated;

  factory Unauthenticated.fromJson(Map<String, dynamic> json) =
      _$Unauthenticated.fromJson;
}

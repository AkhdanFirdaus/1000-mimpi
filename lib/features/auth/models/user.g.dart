// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserGuest _$$UserGuestFromJson(Map<String, dynamic> json) => _$UserGuest(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      role: json['role'] as int,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UserGuestToJson(_$UserGuest instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'role': instance.role,
      'runtimeType': instance.$type,
    };

_$User _$$UserFromJson(Map<String, dynamic> json) => _$User(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      notelp: json['nomor_telp'] as String,
      asal: json['asal'] as String,
      role: json['role'] as int,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UserToJson(_$User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'nomor_telp': instance.notelp,
      'asal': instance.asal,
      'role': instance.role,
      'runtimeType': instance.$type,
    };

_$UserEventOrganizer _$$UserEventOrganizerFromJson(Map<String, dynamic> json) =>
    _$UserEventOrganizer(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      notelp: json['nomor_telp'] as String,
      asal: json['asal'] as String,
      role: json['role'] as int,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UserEventOrganizerToJson(
        _$UserEventOrganizer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'nomor_telp': instance.notelp,
      'asal': instance.asal,
      'role': instance.role,
      'runtimeType': instance.$type,
    };

_$Error _$$ErrorFromJson(Map<String, dynamic> json) => _$Error(
      json['message'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ErrorToJson(_$Error instance) => <String, dynamic>{
      'message': instance.message,
      'runtimeType': instance.$type,
    };

_$Unauthenticated _$$UnauthenticatedFromJson(Map<String, dynamic> json) =>
    _$Unauthenticated(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UnauthenticatedToJson(_$Unauthenticated instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

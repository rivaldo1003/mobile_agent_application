import 'package:hive/hive.dart';

part 'profile.g.dart';

class ProfileAccount {
  Profile profile;
  List<Account> accounts;

  ProfileAccount({required this.profile, required this.accounts});
}

@HiveType(typeId: 1)
class Profile {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String username;

  @HiveField(3)
  String email;

  @HiveField(4)
  String createdAt;

  @HiveField(5)
  String? mobilePhoneNumber;

  @HiveField(6)
  String? mobilePhoneCountry;

  @HiveField(7)
  String? profilePictureUrl;

  Profile({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.createdAt,
    this.mobilePhoneNumber,
    this.mobilePhoneCountry,
    this.profilePictureUrl,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        email: json['email'],
        createdAt: json['createdAt'],
        mobilePhoneNumber: json['mobilePhoneNumber'],
        mobilePhoneCountry: json['mobilePhoneCountry'],
      );
}

@HiveType(typeId: 2)
class Account {
  @HiveField(0)
  String id;

  @HiveField(1)
  String type;

  @HiveField(2)
  String provider;

  @HiveField(3)
  String createdAt;

  Account({
    required this.id,
    required this.type,
    required this.provider,
    required this.createdAt,
  });

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json['id'],
        type: json['type'],
        provider: json['provider'],
        createdAt: json['createdAt'],
      );
}

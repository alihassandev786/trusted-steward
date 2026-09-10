import 'dart:io';

class ProfileData {
  const ProfileData({
    required this.name,
    required this.email,
    required this.country,
    required this.timezone,
    this.photo,
    this.photoAsset,
  });

  final String name;
  final String email;
  final String country;
  final String timezone;
  final File? photo;
  final String? photoAsset;
}
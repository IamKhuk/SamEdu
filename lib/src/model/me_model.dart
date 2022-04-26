class MeModel {
  String firstName;
  String lastName;
  String bio;
  String email;
  String avatar;
  String birthDate;
  String gender;

  MeModel({
    required this.firstName,
    required this.lastName,
    required this.bio,
    required this.email,
    this.avatar = 'assets/images/me.jpg',
    required this.birthDate,
    required this.gender,
  });
}

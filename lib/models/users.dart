class Users {
    final String id;
    final String email;
    final String firstName;
    final String lastName;
    final String avatar;

    Users({
        required this.id,
        required this.email,
        required this.firstName,
        required this.lastName,
        required this.avatar,
    });

    factory Users.createUser(Map<String, dynamic> object) {
      return Users(
        id: object["id"].toString(),
        email: object["email"],
        firstName: object["first_name"],
        lastName: object["last_name"],
        avatar: object["avatar"],
      );
    }
}

class UninitializedUser extends Users {
  UninitializedUser({required super.id, required super.email, required super.firstName, required super.lastName, required super.avatar});
}

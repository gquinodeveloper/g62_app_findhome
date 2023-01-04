class RequestAuthenticationModel {
  RequestAuthenticationModel({
    required this.email,
    required this.password,
  });

  String email;
  String password;

  Map<String, dynamic> toMap() => {
        "email": email,
        "password": password,
      };
}

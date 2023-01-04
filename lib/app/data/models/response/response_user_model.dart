class ResponseUserModel {
  ResponseUserModel({
    this.success,
    this.message,
  });

  bool? success;
  String? message;

  factory ResponseUserModel.fromJson(Map<String, dynamic> json) =>
      ResponseUserModel(
        success: json["success"] ?? false,
        message: json["message"] ?? "",
      );
}

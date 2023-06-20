class TodoModel {
  String? firstName;
  String? lastName;

  TodoModel({required this.firstName,required this.lastName});

  TodoModel.fromMap(Map<String, dynamic> res) {
    firstName = res['firstName'];
    lastName = res['lastName'];
  }

  Map<String, Object?> toMap() {
    return {
      'firstName' : firstName,
      'lastName' : lastName,
    };
  }
}

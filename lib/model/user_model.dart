class UserModel {
  int? id;
  String? name;

  UserModel({this.id, this.name});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map["id"],
      name: map["name"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
    };
  }
}


// class UserModel {
//   String? userID;
//   String? name;
//   String? email;
//   String? country;
//   String? avatarKey;
//   int? score;
//   int? level;

//   UserModel({
//     this.userID,
//     this.name,
//     this.email,
//     this.country,
//     this.avatarKey,
//     this.score,
//     this.level,
//   });
// }

// To parse this JSON data, do
//
//     final getUsers = getUsersFromJson(jsonString);

import 'dart:convert';

GetUsers getUsersFromJson(String str) => GetUsers.fromJson(json.decode(str));

String getUsersToJson(GetUsers data) => json.encode(data.toJson());

class GetUsers {
    int? statusCode;
    List<Datum>? data;

    GetUsers({
        this.statusCode,
        this.data,
    });

    factory GetUsers.fromJson(Map<String, dynamic> json) => GetUsers(
        statusCode: json["status_code"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    String? id;
    Role? role;
    String? name;
    String? email;
    String? password;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Datum({
        this.id,
        this.role,
        this.name,
        this.email,
        this.password,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        role: roleValues.map[json["role"]]!,
        name: json["name"],
        email: json["email"],
        password: json["password"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "role": roleValues.reverse[role],
        "name": name,
        "email": email,
        "password": password,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

enum Role {
    ADMIN,
    GENERAL,
    MEMBER
}

final roleValues = EnumValues({
    "admin": Role.ADMIN,
    "general": Role.GENERAL,
    "member": Role.MEMBER
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}

import 'dart:convert';

TabelModel tabelModelFromJson(String str) => TabelModel.fromJson(json.decode(str));

String tabelModelToJson(TabelModel data) => json.encode(data.toJson());

class TabelModel {
    bool status;
    String message;
    String token;

    TabelModel({
        required this.status,
        required this.message,
        required this.token,
    });

    factory TabelModel.fromJson(Map<String, dynamic> json) => TabelModel(
        status: json["status"],
        message: json["message"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "token": token,
    };
}

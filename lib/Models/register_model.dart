import 'dart:convert';

TabelModel tabelModelFromJson(String str) => TabelModel.fromJson(json.decode(str));

String tabelModelToJson(TabelModel data) => json.encode(data.toJson());

class TabelModel {
    bool status;
    String message;

    TabelModel({
        required this.status,
        required this.message,
    });

    factory TabelModel.fromJson(Map<String, dynamic> json) => TabelModel(
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}

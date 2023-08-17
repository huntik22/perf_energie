// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

UserModel usersFromJson(String str) => UserModel.fromJson(json.decode(str));

String usersToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    String email;
    String? password;
    String? nom;
    String? prenom;
    String? accesPilotage;
    String? accesEvaluation;
    String? fonction;
    String? entreprise;
    String? langue;
    String? addresse;
    String? ville;
    String? pays;
    String? numero;
    String? photoProfil;
    String? tokenCode;
    String? expirationTime;

    UserModel({
        required this.email,
         this.password,
         this.nom,
         this.prenom,
         this.accesPilotage,
         this.accesEvaluation,
         this.fonction,
         this.entreprise,
         this.langue,
         this.addresse,
         this.ville,
         this.pays,
         this.numero,
         this.photoProfil,
         this.tokenCode,
         this.expirationTime,
    });

  factory UserModel.init() => UserModel(email: "");

  factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json["email"],
        password: json["password"],
        nom: json["nom"],
        prenom: json["prenom"],
        accesPilotage: json["acces_pilotage"],
        accesEvaluation: json["acces_evaluation"],
        fonction: json["fonction"],
        entreprise: json["entreprise"],
        langue: json["langue"],
        addresse: json["addresse"],
        ville: json["ville"],
        pays: json["pays"],
        numero: json["numero"],
        photoProfil: json["photo_profil"],
        tokenCode: json["token_code"],
        expirationTime: json["expiration_time"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "nom": nom,
        "prenom": prenom,
        "acces_pilotage": accesPilotage,
        "acces_evaluation": accesEvaluation,
        "fonction": fonction,
        "entreprise": entreprise,
        "langue": langue,
        "addresse": addresse,
        "ville": ville,
        "pays": pays,
        "numero": numero,
        "photo_profil": photoProfil,
        "token_code": tokenCode,
        "expiration_time": expirationTime,
    };
}

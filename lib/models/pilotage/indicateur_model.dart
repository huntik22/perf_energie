List<IndicateurModel> listIndicateursFromJson(List indicateurs) =>
    List<IndicateurModel>.from(
        indicateurs.map((indicateur) => IndicateurModel.fromJson(indicateur)));

class IndicateurModel {
  String? id;
  String? reference;
  String? terminologie;
  String? intitule;
  String? type;
  String? unite;
  String? ipe;
  String? definition;
  List<String>? processus;
  String? gri;
  dynamic? odd;
  String? formule;
  String? color;
  String? idPilier;
  String? idEnjeu;
  int? frequence;
  int? numero;
  num? data;
  bool? validated;

  IndicateurModel(
      {this.id,
      this.reference,
      this.terminologie,
      this.intitule,
      this.type,
      this.unite,
      this.ipe,
      this.definition,
      this.processus,
      this.gri,
      this.odd,
      this.formule,
      this.color,
      this.idPilier,
      this.idEnjeu,
      this.data,
      this.validated,
      this.frequence,
      this.numero});

  IndicateurModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reference = json['reference'];
    terminologie = json['terminologie'];
    intitule = json['intitule'];
    type = json['type'];
    unite = json['unite'];
    definition = json['definition'];
    processus = json['processus'].cast<String>();
    gri = json['gri'];
    odd = json['odd'];
    formule = json['formule'];
    color = json['color'];
    idPilier = json['id_pilier'];
    idEnjeu = json['id_enjeu'];
    frequence = json['frequence'];
    numero = json['numero'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['reference'] = this.reference;
    data['terminologie'] = this.terminologie;
    data['intitule'] = this.intitule;
    data['type'] = this.type;
    data['unite'] = this.unite;
    data['definition'] = this.definition;
    data['processus'] = this.processus;
    data['gri'] = this.gri;
    data['odd'] = this.odd;
    data['formule'] = this.formule;
    data['color'] = this.color;
    data['id_pilier'] = this.idPilier;
    data['id_enjeu'] = this.idEnjeu;
    data['frequence'] = this.frequence;
    data['numero'] = this.numero;
    return data;
  }
}

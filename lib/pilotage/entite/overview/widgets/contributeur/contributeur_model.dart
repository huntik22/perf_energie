class ContributeurModel {
  final String? photo_url, name, entite, access;

  ContributeurModel({this.photo_url, this.name, this.entite, this.access});
}

List demoContributeurs = [
  ContributeurModel(
    photo_url: "assets/images/person1.png",
    name: "Serge EBRA",
    entite: "Ayamé",
    access: "Collecteur",
  ),
  ContributeurModel(
    photo_url: "assets/images/person2.png",
    name: "Jean KOUASSI",
    entite: "Buyo",
    access: "Spectateur",
  ),
  ContributeurModel(
    photo_url: "assets/images/person5.png",
    name: "Anne DUPONT",
    entite: "Kossou",
    access: "Collecteur",
  ),
  ContributeurModel(
    photo_url: "assets/images/person3.png",
    name: "Marc NAMARA",
    entite: "Taabo",
    access: "Administrateur",
  ),
  ContributeurModel(
    photo_url: "assets/images/person4.png",
    name: "Lucie Koffi",
    entite: "UTGA",
    access: "Collecteur",
  ),
];

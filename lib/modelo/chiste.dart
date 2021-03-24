class Chiste {
  Chiste({this.chiste, this.remate});

  factory Chiste.fromJson(Map<String, dynamic> json) {
    final String setup = json['setup'];
    final String punchline = json['punchline'];

    return Chiste(chiste: setup, remate: punchline);
  }

  final String chiste;
  final String remate;
}

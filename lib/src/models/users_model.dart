/*
**************************************
Model User
**************************************
*/
class User {
  final String? idPlan;
  final String? gmail;
  final String? role;
  final String? name;
  final String? photo;

  //Construcctor
  User({this.idPlan, this.gmail, this.role, this.name, this.photo});

  // Método de fábrica para crear un usuario desde un mapa (JSON)
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      idPlan: json['idPlan'],
      gmail: json['gmail'],
      role: json['role'],
      name: json['name'],
      photo: json['photo'],
    );
  }

  // Método para convertir el usuario a un mapa (JSON)
  Map<String, dynamic> toJson() {
    return {
      'idPlan': idPlan,
      'gmail': gmail,
      'role': role,
      'name': name,
      'photo': photo
    };
  }
}

class Plan {
  final String? basic;
  final String? premium;

  Plan({this.basic, this.premium});

  // Método de fábrica para crear un usuario desde un mapa (JSON)
  factory Plan.fromJson(Map<String, dynamic> json) {
    return Plan(
      basic: json['basic'],
      premium: json['premium'],
    );
  }

  // Método para convertir el usuario a un mapa (JSON)
  Map<String, dynamic> toJson() {
    return {'basic': basic, 'premium': premium};
  }
}

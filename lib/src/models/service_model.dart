/*
**************************************
Model Categories
**************************************
*/
class Categories {
  final String? name;
  final String? description;
  final String? state;

  //Construcctor
  Categories({this.name, this.description, this.state});

  // Método de fábrica para crear un usuario desde un mapa (JSON)
  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
        name: json['name'],
        description: json['description'],
        state: json['state']);
  }

  // Método para convertir el usuario a un mapa (JSON)
  Map<String, dynamic> toJson() {
    return {'name': name, 'description': description, 'state': state};
  }
}

/*
**************************************
Model Service
**************************************
*/

class Services {
  final String? idCategory;
  final String? idCustomer;
  final String? idBiker;
  final String? address;
  final String? dateRequest;
  final String? dateCompleted;
  final String? state;

  //Construcctor
  Services(
      {this.idCategory,
      this.idCustomer,
      this.idBiker,
      this.address,
      this.dateRequest,
      this.dateCompleted,
      this.state});

  // Método de fábrica para crear un usuario desde un mapa (JSON)
  factory Services.fromJson(Map<String, dynamic> json) {
    return Services(
        idCategory: json['idCategory'],
        idCustomer: json['idCustomer'],
        idBiker: json['idBiker'],
        address: json['address'],
        dateRequest: json['dateRequest'],
        dateCompleted: json['dateCompleted'],
        state: json['state']);
  }

  // Método para convertir el usuario a un mapa (JSON)
  Map<String, dynamic> toJson() {
    return {
      'idCategory': idCategory,
      'idCustomer': idCustomer,
      'idBiker': idBiker,
      'address': address,
      'dateRequest': dateRequest,
      'dateCompleted': dateCompleted,
      'state': state,
    };
  }
}

/*
**************************************
Model Favorites
**************************************
*/
class Favorites {
  final String? idCustomer;
  final String? idBiker;
  final String? idCategory;

  //Construcctor
  Favorites({this.idCustomer, this.idBiker, this.idCategory});

  // Método de fábrica para crear un usuario desde un mapa (JSON)
  factory Favorites.fromJson(Map<String, dynamic> json) {
    return Favorites(
        idCustomer: json['idCustomer'],
        idBiker: json['idBiker'],
        idCategory: json['idCategory']);
  }

  // Método para convertir el usuario a un mapa (JSON)
  Map<String, dynamic> toJson() {
    return {
      'idCustomer': idCustomer,
      'idBiker': idBiker,
      'idCategory': idCategory
    };
  }
}

/*
**************************************
Model Reviews
**************************************
*/
class Reviews {
  final String? idCustomer;
  final String? idBiker;
  final String? date;
  final String? comment;

  //Construcctor
  Reviews({this.idCustomer, this.idBiker, this.date, this.comment});

  // Método de fábrica para crear un usuario desde un mapa (JSON)
  factory Reviews.fromJson(Map<String, dynamic> json) {
    return Reviews(
      idCustomer: json['idCustomer'],
      idBiker: json['idBiker'],
      date: json['date'],
      comment: json['comment'],
    );
  }

  // Método para convertir el usuario a un mapa (JSON)
  Map<String, dynamic> toJson() {
    return {
      'idCustomer': idCustomer,
      'idBiker': idBiker,
      'idCategory': date,
      'comment': comment
    };
  }
}

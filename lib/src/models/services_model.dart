class ServiceModel {
  final int? id;
  final String? descripcion;
  final String? direccion;
  final DateTime? fechServicio;
  final String? nombre;
  final int? numMotorista;
  final int? precio;
  final String? url;

//Construcctor
  ServiceModel(
      {this.id,
      this.descripcion,
      this.direccion,
      this.fechServicio,
      this.nombre,
      this.numMotorista,
      this.precio,
      this.url});

// Método de fábrica para crear un usuario desde un mapa (JSON)
  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
        id: json['id'],
        descripcion: json['descripcion'],
        direccion: json['direccion'],
        fechServicio: json['fechServicio'],
        nombre: json['nombre'],
        numMotorista: json['numMotorista'],
        precio: json['precio'],
        url: json['url']);
  }

  // Método para convertir el usuario a un mapa (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'descripcion': descripcion,
      'direccion': direccion,
      'fechServicio': fechServicio,
      'nombre': nombre,
      'numMotorista': numMotorista,
      'precio': precio,
      'url': url,
    };
  }
}

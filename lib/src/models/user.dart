import 'dart:convert';

/* En resumen, este código define una clase User que representa un usuario. 
La clase tiene propiedades para almacenar la información del usuario, como el identificador
, la imagen, el nombre, el apellido, el número de teléfono, el correo electrónico y la contraseña.
 También proporciona métodos para convertir entre objetos User y cadenas JSON. 
 La función userFromJson se utiliza para analizar una cadena JSON y crear un objeto User, 
 mientras que la función userToJson se utiliza para convertir un objeto User en una cadena JSON. */

// Función para convertir una cadena JSON en un objeto User
User userFromJson(String str) => User.fromJson(json.decode(str));

// Función para convertir un objeto User en una cadena JSON
String userToJson(User data) => json.encode(data.toJson());

// Clase que representa un usuario
class User {
  String? id; // Identificador del usuario
  String? imagen; // URL de la imagen del usuario
  String? name; // Nombre del usuario
  String? lastname; // Apellido del usuario
  String? phone; // Número de teléfono del usuario
  String? email; // Correo electrónico del usuario
  String? password; // Contraseña del usuario

  // Constructor de la clase
  User({
    this.id,
    this.imagen,
    this.name,
    this.lastname,
    this.phone,
    this.email,
    this.password,
  });

  // Método factory para crear un objeto User a partir de un mapa (JSON)
  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        imagen: json["imagen"],
        name: json["name"],
        lastname: json["lastname"],
        phone: json["phone"],
        email: json["email"],
        password: json["password"],
      );

  // Método para convertir un objeto User en un mapa (JSON)
  Map<String, dynamic> toJson() => {
        "id": id,
        "imagen": imagen,
        "name": name,
        "lastname": lastname,
        "phone": phone,
        "email": email,
        "password": password,
      };
}

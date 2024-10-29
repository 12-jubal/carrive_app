class Car {
  late String id;
  late String idCar;
  late String matriculation;
  late String carModel;
  late String carColor;

  Car({
    required this.id,
    required this.idCar,
    required this.matriculation,
    required this.carModel,
    required this.carColor,
  });

  Car.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idCar = json['idCar'];
    matriculation = json['matriculation'];
    carModel = json['carModel'];
    carColor = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['idCar'] = idCar;
    data['matriculation'] = matriculation;
    data['carModel'] = carModel;
    data['color'] = carColor;

    return data;
  }
}

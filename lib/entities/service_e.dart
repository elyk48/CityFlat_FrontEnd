class service {
  late String _id;
  late String _name;
  late String _description;
  late double _pricePerNight;
  late String _img;

  service(
      this._id, this._name, this._description, this._pricePerNight, this._img);

  service.name(
      this._id, this._name, this._description, this._pricePerNight, this._img);

  String get img => _img;

  set img(String value) {
    _img = value;
  }

  double get pricePerNight => _pricePerNight;

  set pricePerNight(double value) {
    _pricePerNight = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}
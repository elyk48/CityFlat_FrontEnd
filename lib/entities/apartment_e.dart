


import 'package:cityflat/entities/service_e.dart';

class   Apartment{
  late String _id;
 late String _name;
 late String _description;
 late double _pricePerNight;

  String get type => _type;

  set type(String value) {
    _type = value;
  }

  late List<BookedDates> _bookeddates;
  late List<service> _services;
String _type ;
late String _location;
late int _rooms;
late String _img;


  Apartment(
      this._id,
      this._name,
      this._description,
      this._pricePerNight,
      this._bookeddates,
      this._services,
      this._type,
      this._location,
      this._rooms,
      this._img);
  Apartment.Booked(
      this._id,
      this._name,
      this._description,
      this._pricePerNight,


      this._type,
      this._location,
      this._rooms,
      this._img);

  List<service> get services => _services;

  set services(List<service> value) {
    _services = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String get img => _img;

  set img(String value) {
    _img = value;
  }

  int get rooms => _rooms;

  set rooms(int value) {
    _rooms = value;
  }

  String get location => _location;

  set location(String value) {
    _location = value;
  }

  List<BookedDates> get bookeddates => _bookeddates;

  set bookeddates(List<BookedDates> value) {
    _bookeddates = value;
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

 @override
  String toString() {
    return 'apartment{_name: $_name, _description: $_description, _pricePerNight: $_pricePerNight, _bookeddates: $_bookeddates, _type: $_type, _location: $_location, _rooms: $_rooms, _img: $_img}';
 }
}



class BookedDates{

  late DateTime startDate;
  late DateTime endDate;

  BookedDates(this.startDate, this.endDate);



}

enum ApartmentType{

  STANDARD,
PREMIUM,
LUXURY,

}
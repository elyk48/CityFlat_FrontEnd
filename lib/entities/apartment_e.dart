


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

  List<BookedDates> _bookeddates = [];
  late List<service> _services;
late String _type ;
late String _location;
late int _rooms;
late List<dynamic> _img;


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

  Apartment.no();
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




  Map<String, dynamic> toJson() {
    return {
      'id': _id,
      'name': _name,
      'description': _description,
      'pricePerNight': _pricePerNight,
      'bookeddates': _bookeddates.map((date) => {
        'startDate': date.startDate.toIso8601String(),
        'endDate': date.endDate.toIso8601String(),
      }).toList(),
      'services': _services.map((service) => service.toJson()).toList(),
      'type': _type,
      'location': _location,
      'rooms': _rooms,
      'img': _img,
    };
  }


  factory Apartment.fromJson(Map<String, dynamic> json) {
    final List<dynamic>? bookedDatesJson = json['bookeddates'] as List<dynamic>?;
    final List<BookedDates>? bookedDates = bookedDatesJson?.map((date) => BookedDates(
      DateTime.parse(date['startDate']),
      DateTime.parse(date['endDate']),
    )).toList();

    final List<dynamic> servicesJson = json['services'] as List<dynamic>;
    final List<service> services = servicesJson.map((serviceJson) => service.fromJson(serviceJson)).toList();

    final pricePerNight = json['pricePerNight'];
    final double price = pricePerNight is int ? pricePerNight.toDouble() : pricePerNight;

    return Apartment(
      json['_id'],
      json['name'],
      json['description'],
      price,
      bookedDates ?? [],
      services,
      json['type'],
      json['location'],
      json['rooms'],
      json['img'],
    );
  }
  set services(List<service> value) {
    _services = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
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

import 'package:cityflat/entities/service_e.dart';
import 'package:cityflat/entities/user_e.dart';

import 'apartment_e.dart';

class Order{
  late String _id;
  late  UserE _user;
  late Apartment _apartment;
  late   String _description;
  late double _totalprice;
  late String _checkin;
  late String _checkout;
  late double _servicesFees;
  late double _nightsFees;
  late bool _isPaied;
  late List<service> services;
  late String state;


  Order(
      this._id,
      this._user,
      this._apartment,
      this._description,
      this._totalprice,
      this._checkin,
      this._checkout,
      this._servicesFees,
      this._nightsFees,
      this._isPaied,
      this.services,
      this.state);

  Order.name(
      this._id,
      this._user,
      this._apartment,
      this._description,
      this._totalprice,
      this._checkin,
      this._checkout,
      this._servicesFees,
      this._nightsFees,
      this._isPaied);
  Order.noArg(
      );

  String get id => _id;

  set id(String value) {
    _id = value;
  }


  bool get isPaied => _isPaied;

  set isPaied(bool value) {
    _isPaied = value;
  }

  double get nightsFees => _nightsFees;

  set nightsFees(double value) {
    _nightsFees = value;
  }

  double get servicesFees => _servicesFees;

  @override
  String toString() {
    return 'Order{_user: $_user, _apartment: $_apartment, _totalprice: $_totalprice, _checkin: $_checkin, _checkout: $_checkout, _servicesFees: $_servicesFees, _nightsFees: $_nightsFees, , services: $services, }';
  }

  set servicesFees(double value) {
    _servicesFees = value;
  }


  double get totalprice => _totalprice;

  set totalprice(double value) {
    _totalprice = value;
  }

  String get checkin => _checkin;

  set checkin(String value) {
    _checkin = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  Apartment get apartment => _apartment;

  set apartment(Apartment value) {
    _apartment = value;
  }

  UserE get user => _user;

  set user(UserE value) {
    _user = value;
  }


  Map<String, dynamic> toJson() {
    return {
      'id': _id,
      'user': _user.id.toString(),
      'apartment': _apartment..id.toString(),
      'description': _description,
      'totalprice': _totalprice,
      'checkin': _checkin,
      'checkout': _checkout,
      'servicesFees': _servicesFees,
      'nightsFees': _nightsFees,
      'isPaied': _isPaied,
      'services': services.map((service) => service.toJson()).toList(),
      'state': state,
    };
  }
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      json['_id'],
      UserE.fromJson(json['User']),
      Apartment.fromJson(json['appartment']),
      json['description'],
      json['totalPrice'] != null ? json['totalPrice'].toDouble() : 0.0,
      json['checkIn'],
      json['checkOut'],
      json['servicesFee'] != null ? json['servicesFee'].toDouble() : 0.0,
      json['nightsFee'] != null ? json['nightsFee'].toDouble() : 0.0,
      json['isPaied'],
      (json['services'] as List<dynamic>)
          .map((serviceJson) => service.fromJson(serviceJson))
          .toList(),
      json['state'],
    );
  }
  String get checkout => _checkout;

  set checkout(String value) {
    _checkout = value;
  }
}
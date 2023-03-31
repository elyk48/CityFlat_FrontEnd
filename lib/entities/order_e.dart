
import 'package:cityflat/entities/user_e.dart';

import 'apartment_e.dart';

class Order{
  late String _id;
  late  UserE _user;
  late Apartment _apartment;
  late String _description;
  late double _totalprice;
  late DateTime _checkin;
  late DateTime _checkout;
  late double _servicesFees;
  late double _nightsFees;
  late bool _isConfirmed;


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
      this._isConfirmed);


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
      this._isConfirmed);


  String get id => _id;

  set id(String value) {
    _id = value;
  }

  bool get isConfirmed => _isConfirmed;

  set isConfirmed(bool value) {
    _isConfirmed = value;
  }

  double get nightsFees => _nightsFees;

  set nightsFees(double value) {
    _nightsFees = value;
  }

  double get servicesFees => _servicesFees;

  set servicesFees(double value) {
    _servicesFees = value;
  }

  DateTime get checkout => _checkout;

  set checkout(DateTime value) {
    _checkout = value;
  }

  DateTime get checkin => _checkin;

  set checkin(DateTime value) {
    _checkin = value;
  }

  double get totalprice => _totalprice;

  set totalprice(double value) {
    _totalprice = value;
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
}
import 'package:flutter/material.dart';

class UserCard {

  late String _number;
  late String _exp_month;
  late String _exp_year;
  late String _cvc;

  UserCard(this._number, this._exp_month, this._exp_year, this._cvc);

  String get cvc => _cvc;

  @override
  String toString() {
    return 'card{_number: $_number, _exp_month: $_exp_month, _exp_year: $_exp_year, _cvc: $_cvc}';
  }

  set cvc(String value) {
    _cvc = value;
  }

  String get exp_year => _exp_year;

  set exp_year(String value) {
    _exp_year = value;
  }

  String get exp_month => _exp_month;

  set exp_month(String value) {
    _exp_month = value;
  }

  String get number => _number;

  set number(String value) {
    _number = value;
  }

  factory UserCard.fromJson(Map<String, dynamic> json) {
    return UserCard(
      json['number'],
      json['exp_month'],
      json['exp_year'],
      json['cvc'],
    );
  }
}
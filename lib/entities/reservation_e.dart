import 'package:cityflat/entities/card_e.dart';
import 'package:flutter/material.dart';


import 'order_e.dart';


import 'package:cityflat/entities/card_e.dart';
import 'package:flutter/material.dart';
import 'order_e.dart';

class Reservation {
  late Order? _order;
  late int _code;
  late bool _paied;
  late UserCard? _userCard;

  Reservation(this._order, this._code, this._paied, this._userCard);

  UserCard? get userCard => _userCard;
  set userCard(UserCard? value) {
    _userCard = value;
  }

  bool get paied => _paied;
  set paied(bool value) {
    _paied = value;
  }

  int get code => _code;
  set code(int value) {
    _code = value;
  }

  Order? get order => _order;
  set order(Order? value) {
    _order = value;
  }

  @override
  String toString() {
    return 'Reservation{_order: $_order, _code: $_code, _paied: $_paied, _userCard: $_userCard}';
  }
}
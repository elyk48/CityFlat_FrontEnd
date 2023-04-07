import 'dart:convert';

class UserE {
  late String _id;
  late String _name;
  late String _email;
  late String _password;
  late String _phoneNumber;
  late String _address;
  late DateTime _Birthdate;
  late String _role;
  late String _img;
  late String _token;
  late String _stripeCustomerID;
  late bool _isVerified;

  bool get isVerified => _isVerified;

  set isVerified(bool value) {
    _isVerified = value;
  }


  UserE.signup(this._id, this._name, this._email, this._password,
      this._phoneNumber,  this._role, this._isVerified);

  UserE(
      this._id,
      this._name,
      this._email,
      this._password,
      this._phoneNumber,
      this._address,
      this._Birthdate,
      this._role,
      this._img,
      this._token,
      this._stripeCustomerID,
      this._isVerified);

  UserE.noarg();
  UserE.name(
      this._id,
      this._name,
      this._email,
      this._password,
      this._phoneNumber,
      this._address,
      this._Birthdate,
      this._role,
      this._img,
      this._token,
      this._stripeCustomerID,
      this._isVerified);

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get stripeCustomerID => _stripeCustomerID;

  set stripeCustomerID(String value) {
    _stripeCustomerID = value;
  }

  @override
  String toString() {
    return 'UserE{_id: $_id, _name: $_name, _email: $_email, _phoneNumber: $_phoneNumber, _address: $_address, _Birthdate: $_Birthdate, _role: $_role, _img: $_img, _token: $_token}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserE &&
          runtimeType == other.runtimeType &&
          _id == other._id &&
          _name == other._name &&
          _email == other._email &&
          _phoneNumber == other._phoneNumber &&
          _address == other._address &&
          _Birthdate == other._Birthdate &&
          _role == other._role &&
          _img == other._img &&
          _token == other._token;

  @override
  int get hashCode =>
      _id.hashCode ^
      _name.hashCode ^
      _email.hashCode ^
      _phoneNumber.hashCode ^
      _address.hashCode ^
      _Birthdate.hashCode ^
      _role.hashCode ^
      _img.hashCode ^
      _token.hashCode;

  String get token => _token;

  set token(String value) {
    _token = value;
  }

  String get img => _img;

  set img(String value) {
    _img = value;
  }

  String get role => _role;

  set role(String value) {
    _role = value;
  }

  DateTime get Birthdate => _Birthdate;

  set Birthdate(DateTime value) {
    _Birthdate = value;
  }

  String get address => _address;

  set address(String value) {
    _address = value;
  }

  String get phoneNumber => _phoneNumber;

  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  Map<String, dynamic> toJson() {
    return {
      "name": _name,
      "email": _email,
      "number": _phoneNumber,
      "password": _password,
    };
  }

  String singleUserToJson(UserE data) => json.encode(data.toJson());

  String userModelToJson(List<UserE> data) {
    return json.encode(
      List<dynamic>.from(
        data.map(
          (x) {
            return x.toJson();
          },
        ),
      ),
    );
  }
}

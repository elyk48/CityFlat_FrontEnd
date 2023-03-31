import 'package:shared_preferences/shared_preferences.dart';

import 'entities/user_e.dart';

class Session {
  static Future<UserE> getUser_from_prefs(UserE user) async {
    var prefs = await SharedPreferences.getInstance().then((value) {
      return value;
    });
    user.id = prefs.getString("user_id")!;
    user.name = prefs.getString("user_name")!;
    user.role = prefs.getString("user_role")!;
    user.email = prefs.getString("user_email")!;
    user.address = prefs.getString("user_address")!;
    user.phoneNumber = prefs.getString("user_phoneNumber")!;
    user.Birthdate = DateTime.parse(prefs.getString("user_birthdate")!);
    user.img = prefs.getString("user_image")!;
    user.token = prefs.getString("user_token")!;
    user.stripeCustomerID = prefs.getString("user_StripeId")!;
    user.isVerified = prefs.getBool("user_isVerified")!;

    print("From Session class  user is : " + user.id + " name: " + user.name);

    return user;
  }

  static Future<UserE> setUser_prefs(Map<String, dynamic> user) async {
    var prefs = await SharedPreferences.getInstance().then((value) {
      return value;
    });

    UserE userFromServer = new UserE(
        user["id"],
        user["name"],
        user["email"],
        user['password'],
        user['number'],
        user['address'],
        DateTime.parse(user['birthdate']),
        user['role'],
        user['img'],
        user['token'],
        user['stripeCustomerID'],
        user['isVerified']);
    prefs.setString("user_id", userFromServer.id)!;

    prefs.setString("user_name", userFromServer.name)!;

    prefs.setString("user_role", userFromServer.role)!;

    prefs.setString("user_email", userFromServer.email)!;

    prefs.setString("user_address", userFromServer.address)!;

    prefs.setString("user_phoneNumber", userFromServer.phoneNumber)!;

    prefs.setString("user_birthdate",userFromServer.toString())!;
    prefs.setString("user_image",userFromServer.img)!;
    prefs.setString("user_token",userFromServer.token)!;
    prefs.setString("user_StripeId",userFromServer.stripeCustomerID)!;
    prefs.setBool("user_isVerified",userFromServer.isVerified)!;

    print("User session updated to user  : " + userFromServer.id + " name: " + userFromServer.name);

    return userFromServer;
  }
}

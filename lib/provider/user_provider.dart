
import 'package:flutter/cupertino.dart';

import '../model/product.dart';
import '../model/user.dart';
class UserProvider extends ChangeNotifier {
  User? user;
  void setUser(User item) {
    user = item;
    notifyListeners();
  }
  List<Product>? products;
  void setProducts(List<Product> items) {
    products = items;
    notifyListeners();
  }
}
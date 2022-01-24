import 'product.dart';

class ShoppingBasketData {
  static ShoppingBasketData _instance=ShoppingBasketData();
  List<Product>_basketItems=[];





  static ShoppingBasketData getInstance() {
    if (_instance == null) {
      _instance = ShoppingBasketData();
    }

    return _instance;
  }

  List<Product> get basketItems => _basketItems;

  set basketItems(List<Product> value) {
    _basketItems = value;
  }
}

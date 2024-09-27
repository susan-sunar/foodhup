import 'package:foodhup/Food%20model/hotel_class.dart';
import 'package:get/get.dart';

class ManageState extends GetxController {

  ///Counter
  int _counter = 0;

  set counter(int value) {
    _counter = value;
    update();
  }

  int get counter => _counter;

  void increment() {
    _counter++;
    update();
  }
  ///Counter2
  int _counter2 = 0;

  set counter2(int value) {
    _counter2 = value;
    update();
  }

  int get counter2 => _counter2;

  void increment2() {
    _counter2++;
    update();
  }


  ///radio selection

  int selectedIndex = -1;

  void selectItem(int index) {
    selectedIndex = index;
    update();
  }


  ///fav
  List<HotelClass> _favoriteProduct = [];

  bool addtoFav(HotelClass product) {
    if (!_favoriteProduct.contains(product)) {
      _favoriteProduct.add(product);
      _counter2++;
      update();
      return true;
    }
    else {
      return false;
    }
  }

  List<HotelClass> get favproduct => _favoriteProduct;

  ///cart
  List<HotelClass> _cartProduct = [];

  bool addtoCart(HotelClass product) {
    if (!_cartProduct.contains(product)) {
      _cartProduct.add(product);
      _counter++;
      update();
      return true;
    }
    else {
      return false;
    }
  }

  List<HotelClass> get cartproduct => _cartProduct;


  List<HotelClass> get cartProduct => _cartProduct;

  void increaseQuantity(HotelClass product) {
    product.quantity++;
    update();
  }

  void decrease(HotelClass product) {
    if (product.quantity > 1) {
      product.quantity--;
      update();
    }
    else {

    }
  }

  void delete(HotelClass product) {
    _cartProduct.remove(product);
    product.quantity = 1;
    _counter--;

    update();
  }

  ///bottom
  int currentIndex = 0;

  void setCurrentIndex(int index) {
    currentIndex = index;
    update(); // Notify listeners to rebuild
  }
  ///sub total
  double calculate() {
    double total = 0;
    for (var product in _cartProduct) {
      total = total + product.price * product.quantity;
    }
    return total;
  }

  ///tax
  double Tax() {
    double total = 0;
    for (var product in _cartProduct) {
      total = total + product.price * product.quantity;
    }
    return total+5+1;
  }

}






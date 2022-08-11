
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:kiosk_consumer_app/democlass/allData.dart';

class CartController extends GetxController{

  var guestcounts = 0.obs;
  var cartItems = <AllData>[].obs;
  int get count => cartItems.length;
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + (item.itemPrice * item.qty));

  addToCart(AllData product){
    cartItems.add(product);
  }

  removeFromCart(AllData product){
    cartItems.remove(product);
  }

  deleteAll(){
    cartItems.clear();
  }
}
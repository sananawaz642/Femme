import 'package:get/get.dart';
import '../models/BaseModel.dart';

class CartController extends GetxController {

  double calculateTotalPrice() {
    double total = 0.0;
    if (itemsOnCart.isEmpty) {
      total = 0;
    } else {
      for (BaseModel data in itemsOnCart) {
        total = total + data.price * data.value;
      }
    }
    return total;
  }
  //WIll  be used to store cart items
  List<BaseModel> itemsOnCart =[];

  addItemToCart(BaseModel item){
    itemsOnCart.add(item);
    update();
  }
}
import 'package:advance_notification/advance_notification.dart';
import 'package:flutter/material.dart';

import '../dataApp/data.dart';
import '../models/ShirtModel.dart';


class ShirtAddToCart {
  static void shirtaddtocart(ShirtModel data1, BuildContext context) {
    bool contains = itemsOnCart.contains(data1);

    if (contains == true) {
      const AdvanceSnackBar(
        textSize: 14.0,
        bgColor: Colors.red,
        message: 'You have added this item to cart before',
        mode: Mode.ADVANCE,
        duration: Duration(seconds: 5),
      ).show(context);
    } else {
      shirtitemsOnCart.add(data1);

      const AdvanceSnackBar(
        textSize: 14.0,
        message: 'Successfully added to your cart',
        mode: Mode.ADVANCE,
        duration: Duration(seconds: 5),
      ).show(context);
    }
  }
}

import 'package:flutter/material.dart';


class ReuseableText extends StatelessWidget {
  const ReuseableText({super.key, required this.price});

  final double price;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return RichText(
      text: TextSpan(
        text: "Rs ",
        style: textTheme.titleSmall?.copyWith(
          fontSize: 21,
          // color: primaryColor,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: price.toString(),
            style: textTheme.titleSmall?.copyWith(
              fontSize: 18,
              // fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_ecom/commons/constants.dart';
import 'package:flutter_ecom/commons/custom_text.dart';
import 'package:flutter_ecom/commons/images.dart';
import 'package:flutter_ecom/widgets/category_widgets.dart';

class HorizontalListViewWidgets extends StatelessWidget {
  final categories = <Map>[
    {"image": Images.accessories, "name": "Accessories"},
    {"image": Images.dress, "name": "Dress"},
    {"image": Images.formal, "name": "Formal"},
    {"image": Images.informal, "name": "Informal"},
    {"image": Images.jeans, "name": "Jeans"},
    {"image": Images.shoe, "name": "Shoe"},
    {"image": Images.tshirt, "name": "Tshirt"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          Map category = categories[index];
          return CategoryWidget(
            imageLocation: category["image"],
            imageCaption: CustomText(
              text: category["name"],
              fontSize: 12.0,
              color: kRed,
            ),
          );
        },
      ),
    );
  }
}

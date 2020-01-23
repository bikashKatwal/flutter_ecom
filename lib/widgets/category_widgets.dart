import 'package:flutter/material.dart';
import 'package:flutter_ecom/commons/custom_text.dart';

class CategoryWidget extends StatelessWidget {
  final String imageLocation;
  final CustomText imageCaption;

  const CategoryWidget(
      {@required this.imageLocation, @required this.imageCaption});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 110,
          child: ListTile(
            title: Image.asset(
              imageLocation,
              width: 110,
              height: 80,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: imageCaption,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_ecom/commons/constants.dart';
import 'package:flutter_ecom/commons/custom_text.dart';
import 'package:flutter_ecom/pages/product_details.dart';

class SingleProductWidget extends StatelessWidget {
  final String prodName;
  final String prodPicture;
  final double prodOldPrice;
  final double prodPrice;

  const SingleProductWidget(
      {@required this.prodName,
      @required this.prodPicture,
      @required this.prodOldPrice,
      @required this.prodPrice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Hero(
          tag: prodName,
          child: InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductDetails(
                  prodName: prodName,
                  prodPrice: prodPrice,
                  prodPicture: prodPicture,
                  prodOldPrice: prodOldPrice,
                ),
              ),
            ),
            child: GridTile(
              footer: Container(
                color: kWhite70,
                child: ListTile(
                  leading: CustomText(
                    text: prodName,
                    fontWeight: FontWeight.bold,
                  ),
                  title: CustomText(
                    text: "\$$prodPrice",
                    color: kRed,
                    fontWeight: FontWeight.w800,
                  ),
                  subtitle: CustomText(
                    text: "\$$prodOldPrice",
                    color: kBlack,
                    textDecoration: TextDecoration.lineThrough,
                  ),
                ),
              ),
              child: Image.asset(
                prodPicture,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

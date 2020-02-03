import 'package:flutter/material.dart';
import 'package:flutter_ecom/commons/constants.dart';
import 'package:flutter_ecom/commons/custom_text.dart';
import 'package:flutter_ecom/pages/product_details.dart';

class SingleProductWidget extends StatelessWidget {
  final String prodName;
  final String prodPicture;
  final double prodOldPrice;
  final double prodPrice;
  final bool isHeroTagRequired;

  const SingleProductWidget(
      {@required this.prodName,
      @required this.prodPicture,
      @required this.prodOldPrice,
      @required this.prodPrice,
      @required this.isHeroTagRequired});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
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
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: CustomText(
                        text: prodName,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CustomText(
                      text: '\$$prodPrice',
                      color: kRed,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                )),
            child: isHeroTagRequired
                ? Hero(
                    tag: prodName,
                    child: Image.asset(
                      prodPicture,
                      fit: BoxFit.cover,
                    ),
                  )
                : Image.asset(
                    prodPicture,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      ),
    );
  }
}

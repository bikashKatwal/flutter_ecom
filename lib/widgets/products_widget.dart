import 'package:flutter/material.dart';
import 'package:flutter_ecom/commons/constants.dart';
import 'package:flutter_ecom/commons/custom_text.dart';
import 'package:flutter_ecom/commons/images.dart';

class ProductsWidget extends StatefulWidget {
  @override
  _ProductsWidgetState createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  final _products = [
    {
      "name": "Long Blazer",
      "picture": Images.pBlazzer1,
      "old_price": 120.0,
      "price": 80.0
    },
    {
      "name": "Short Blazer",
      "picture": Images.pBlazzer2,
      "old_price": 110.0,
      "price": 70.0
    },
    {
      "name": "Long Dress",
      "picture": Images.pDress1,
      "old_price": 60.0,
      "price": 40.0
    },
    {
      "name": "Short Dress",
      "picture": Images.pDress2,
      "old_price": 50.0,
      "price": 45.0
    },
    {
      "name": "High Hills",
      "picture": Images.pHills1,
      "old_price": 60.0,
      "price": 25.0
    },
    {
      "name": "Flat Hills",
      "picture": Images.pHills2,
      "old_price": 80.0,
      "price": 30.0
    },
    {
      "name": "Casual Pant",
      "picture": Images.pPants1,
      "old_price": 59.0,
      "price": 29.0
    },
    {
      "name": "Formal Pants",
      "picture": Images.pPants2,
      "old_price": 69.0,
      "price": 39.0
    },
    {
      "name": "Shoe",
      "picture": Images.pShoe1,
      "old_price": 29.0,
      "price": 49.0
    },
    {
      "name": "Knee Skirt",
      "picture": Images.pSkt1,
      "old_price": 89.0,
      "price": 99.0
    },
    {
      "name": "Thigh Skirt",
      "picture": Images.pSkt2,
      "old_price": 69.0,
      "price": 49.0
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _products.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, i) {
        Map _product = _products[i];
        return SingleProductWidget(
          prodName: _product["name"],
          prodPicture: _product["picture"],
          prodOldPrice: _product["old_price"],
          prodPrice: _product["price"],
        );
      },
    );
  }
}

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
            onTap: () {},
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
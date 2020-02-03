import 'package:flutter/material.dart';
import 'package:flutter_ecom/commons/constants.dart';
import 'package:flutter_ecom/commons/custom_icon.dart';
import 'package:flutter_ecom/commons/custom_icon_button.dart';
import 'package:flutter_ecom/commons/custom_material_button.dart';
import 'package:flutter_ecom/commons/custom_text.dart';
import 'package:flutter_ecom/screens/home_screen.dart';
import 'package:flutter_ecom/widgets/products_widget.dart';

class ProductDetails extends StatefulWidget {
  final String prodName;
  final String prodPicture;
  final double prodOldPrice;
  final double prodPrice;

  const ProductDetails(
      {this.prodName, this.prodPicture, this.prodOldPrice, this.prodPrice});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  _onDropDownPressed(String text) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: CustomText(
            text: text,
          ),
          content: CustomText(
            text: "Please add the quantity...",
          ),
          actions: <Widget>[
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop(context);
              },
              child: CustomText(
                text: "close",
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: kRed,
        title: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          child: CustomText(
            text: 'Fash App',
          ),
        ),
        actions: <Widget>[
          CustomIconButton(
            customIcon: CustomIcon(
              iconData: Icons.search,
              color: kWhite,
            ),
            onIconPressed: () {},
          ),
          CustomIconButton(
            customIcon: CustomIcon(
              iconData: Icons.shopping_cart,
              color: kWhite,
            ),
            onIconPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: kWhite,
                child: Hero(
                  tag: widget.prodName,
                  child: Image.asset(
                    widget.prodPicture,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              footer: Container(
                color: kWhite70,
                child: ListTile(
                  leading: CustomText(
                    text: widget.prodName,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  title: Row(
                    children: <Widget>[
                      Expanded(
                        child: CustomText(
                          text: "\$${widget.prodOldPrice.toString()}",
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: kGrey,
                          textDecoration: TextDecoration.lineThrough,
                        ),
                      ),
                      Expanded(
                        child: CustomText(
                          text: "\$${widget.prodPrice.toString()}",
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: kRed,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          //The size,color,qty buttons
          Row(
            children: <Widget>[
              Expanded(
                child: CustomMaterialButton(
                  onPressed: () => _onDropDownPressed("Size"),
                  color: kWhite,
                  textColor: kGrey,
                  elevation: 0.2,
                  dropDownButtons: Row(
                    children: <Widget>[
                      Expanded(
                        child: CustomText(
                          text: "Size",
                        ),
                      ),
                      Expanded(
                        child: CustomIcon(
                          iconData: Icons.arrow_drop_down,
                          color: kGrey,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: CustomMaterialButton(
                  onPressed: () => _onDropDownPressed("Color"),
                  color: kWhite,
                  textColor: kGrey,
                  elevation: 0.2,
                  dropDownButtons: Row(
                    children: <Widget>[
                      Expanded(
                        child: CustomText(
                          text: "Color",
                        ),
                      ),
                      Expanded(
                        child: CustomIcon(
                          iconData: Icons.arrow_drop_down,
                          color: kGrey,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: CustomMaterialButton(
                  onPressed: () => _onDropDownPressed("Quantity"),
                  color: kWhite,
                  textColor: kGrey,
                  elevation: 0.2,
                  dropDownButtons: Row(
                    children: <Widget>[
                      Expanded(
                        child: CustomText(
                          text: "Qty",
                        ),
                      ),
                      Expanded(
                        child: CustomIcon(
                          iconData: Icons.arrow_drop_down,
                          color: kGrey,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),

          //Buy button
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: kRed,
                  textColor: kWhite,
                  child: CustomText(
                    text: "Buy now",
                    fontSize: 16,
                  ),
                ),
              ),
              CustomIconButton(
                customIcon: CustomIcon(
                  iconData: Icons.add_shopping_cart,
                  color: kRed,
                ),
                onIconPressed: () {},
              ),
              CustomIconButton(
                customIcon: CustomIcon(
                  iconData: Icons.favorite_border,
                  color: kRed,
                ),
                onIconPressed: () {},
              ),
            ],
          ),

          Divider(),
          ListTile(
            title: CustomText(
              text: "Product details",
            ),
            subtitle: CustomText(
              text:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            ),
          ),
          Divider(),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: CustomText(
                  text: "Product name:",
                  color: kGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: CustomText(
                  text: widget.prodName,
                  color: kGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: CustomText(
                  text: "Product brand",
                  color: kGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //TODO NEED To UPDATE Brand Name and Condition
              Padding(
                padding: EdgeInsets.all(5.0),
                child: CustomText(
                  text: "BRAND NAME",
                  color: kGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: CustomText(
                  text: "Product condition",
                  color: kGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: CustomText(
                  text: "CONDITION",
                  color: kGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          //Similar Products
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomText(
              text: "Similar products",
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: 360,
            child: ProductsWidget(),
          ),
        ],
      ),
    );
  }
}

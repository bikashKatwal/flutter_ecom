import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecom/commons/constants.dart';
import 'package:flutter_ecom/commons/custom_drawer.dart';
import 'package:flutter_ecom/commons/custom_icon.dart';
import 'package:flutter_ecom/commons/custom_icon_button.dart';
import 'package:flutter_ecom/commons/custom_text.dart';
import 'package:flutter_ecom/commons/images.dart';
import 'package:flutter_ecom/commons/strings.dart';
import 'package:flutter_ecom/widgets/horizontal_listview_widgets.dart';
import 'package:flutter_ecom/widgets/products_widget.dart';

class HomeScreen extends StatelessWidget {
  final _imageCarousel = Container(
    height: 200.0,
    child: Carousel(
      boxFit: BoxFit.cover,
      images: [
        AssetImage(Images.m1),
        AssetImage(Images.m2),
        AssetImage(Images.w1),
        AssetImage(Images.w3),
        AssetImage(Images.w4)
      ],
      autoplay: false,
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(milliseconds: 1000),
      dotSize: 4.0,
      indicatorBgPadding: 8.0,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: kRed,
          title: CustomText(
            text: 'Fash App',
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
        drawer: CustomDrawer(),
        body: Container(
          child: ListView(
            children: <Widget>[
              //?image carousel begins
              _imageCarousel,

              //?categories Text
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText(
                  text: Strings.categories,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),

              //?Horizontal List View begins here
              HorizontalListViewWidgets(),

              //? Recent products
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomText(
                  text: Strings.recent_product,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),

              //? Product listed
              Container(
                height: 320,
                child: ProductsWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

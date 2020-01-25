import 'package:flutter/material.dart';
import 'package:flutter_ecom/commons/constants.dart';
import 'package:flutter_ecom/commons/custom_icon.dart';
import 'package:flutter_ecom/commons/custom_text.dart';
import 'package:flutter_ecom/commons/images.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  List _drawerItems = [
    {"icon": Icons.home, "name": "Home"},
    {"icon": Icons.account_circle, "name": "My account"},
    {"icon": Icons.shopping_basket, "name": "Shopping"},
    {"icon": Icons.dashboard, "name": "My orders"},
    {"icon": Icons.favorite, "name": "Favourites"},
    {"icon": Icons.settings, "name": "Settings"},
    {"icon": Icons.help, "name": "About"},
  ];

  _iconColor(int i) {
    int _count = _drawerItems.length;
    if (_count - 1 == i) {
      return kBlue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: CustomText(
              text: 'John Doe',
            ),
            accountEmail: CustomText(
              text: 'xyz@gmail.com',
            ),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                backgroundImage: AssetImage(Images.profileImage),
              ),
            ),
            decoration: BoxDecoration(
              color: kRed,
            ),
          ),
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _drawerItems.length,
            separatorBuilder: (_, index) {
              return (_drawerItems.length - 3 == index)
                  ? Divider(
                      color: kBlack,
                    )
                  : Container();
            },
            itemBuilder: (_, index) {
              Map item = _drawerItems[index];
              return InkWell(
                onTap: () {},
                child: ListTile(
                  leading: CustomIcon(
                    iconData: item['icon'],
                    color: _iconColor(index),
                  ),
                  title: CustomText(
                    text: item['name'],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

import 'package:MyDiscount/pages/history_page.dart';
import 'package:MyDiscount/pages/notification_page.dart';
import 'package:MyDiscount/pages/qr-page.dart';
import 'package:MyDiscount/pages/setings_page.dart';
import 'package:MyDiscount/pages/user_page.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        UserPage(),
        TransactionsPage(),
        QrPage(),
        NotificationPage(),
        SetingsPage(),
      ].elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        currentIndex: selectedIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon:Icon( MdiIcons.wallet,color:Colors.black),
              label: 'Transactions'),
          BottomNavigationBarItem(
              icon: Icon(
                MdiIcons.qrcode,
                color: Colors.black,
              ),
              label: 'Qr'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                color: Colors.black,
              ),
              label: 'Notifications'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              label: 'Settings'),
        ],
      ),
    );
  }
}

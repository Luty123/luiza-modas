import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja/helpers/Theme.dart';
import 'package:loja/screens/category_screen.dart';

class CategoryTile extends StatelessWidget {
  final DocumentSnapshot snapshot;

  CategoryTile(this.snapshot);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(70.0),
        color: MaterialColors.priceColor,
      ),
      width: double.infinity,
      height: 110,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Container(
        width: 50,
        height: 50,
        margin: EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(70.0),
          border: Border.all(width: 2, color: MaterialColors.primary),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 35.0,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(snapshot.data()["icon"]),
            ),
            title: Text(snapshot.data()["title"]),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CategoryScreen(snapshot)));
            },
          ),
        ),
      ),
    );
  }
}

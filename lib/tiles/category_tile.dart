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
      decoration:
          new BoxDecoration(color: MaterialColors.label.withOpacity(0.1)),
      child: Container(
        width: double.infinity,
        height: 100,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Container(
          width: 50,
          height: 50,
          margin: EdgeInsets.all(0.1),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(width: 3, color: MaterialColors.primary),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30.0,
                backgroundColor: MaterialColors.primary,
                child: CircleAvatar(
                  radius: 25.0,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(snapshot.data()["icon"]),
                ),
              ),
              title: Text(snapshot.data()["title"]),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CategoryScreen(snapshot)));
              },
            ),
          ),
        ),
      ),
    );
  }
}

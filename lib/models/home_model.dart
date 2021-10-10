import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loja/models/section_model.dart';

class HomeModel {
  HomeModel() {
    _loadSections();
  }
  List<Section> sections = [];
  Future<void> _loadSections() async {
    FirebaseFirestore.instance
        .collection('home')
        .snapshots()
        .listen((snapshot) {
      sections.clear();
      for (final DocumentSnapshot document in snapshot.docs) {
        sections.add(Section.fromDocument(document));
      }
    });
  }
}

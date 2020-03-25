import 'package:flutter/material.dart';

class Topic {
  int id;
  String title;
  int like;
  int unlike;
  DateTime createDate;

  Topic(this.id, this.title, this.like, this.unlike, this.createDate);

}
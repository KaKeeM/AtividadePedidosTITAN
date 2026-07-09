import 'package:flutter/material.dart';

class TaskModel {

  final String title;
  final DateTime date;
  bool completed;

  TaskModel({
    required this.title,
    required this.date,
    this.completed = false,
  });

}
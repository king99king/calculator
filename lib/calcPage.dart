import 'dart:math';
import 'package:calculator/dataApp.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';


void equalPressed(){
  String finalQuestion=userQuestion;
  finalQuestion =finalQuestion.replaceAll('x', '*');
  finalQuestion =finalQuestion.replaceAll('%', '*0.01');
  Parser p=Parser();
  Expression exp =p.parse(finalQuestion);
  ContextModel cm = ContextModel();
  double eval =exp.evaluate(EvaluationType.REAL,cm);
  userAnsewer= eval.toString();
}
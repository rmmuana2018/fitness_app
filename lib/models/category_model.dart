import 'package:flutter/material.dart';

class CategoryModel {
  final String name, iconPath;
  final Color boxColor;

  const CategoryModel({required this.name, required this.iconPath, required this.boxColor});

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];
    categories.add(const CategoryModel(name: 'Salad', iconPath: 'assets/icons/plate.svg', boxColor: Color(0xff92A3FD)));
    categories.add(const CategoryModel(name: 'Cake', iconPath: 'assets/icons/pancakes.svg', boxColor: Color(0xffC58BF2)));
    categories.add(const CategoryModel(name: 'Pie', iconPath: 'assets/icons/pie.svg', boxColor: Color(0xff92A3FD)));
    categories.add(const CategoryModel(name: 'Smoothies', iconPath: 'assets/icons/orange-snacks.svg', boxColor: Color(0xffC58BF2)));
    return categories;
  }
}

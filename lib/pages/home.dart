import 'package:fitness_app/models/popular_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/category_model.dart';
import '../models/diet_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<PopularDietsModel> popularDiets = PopularDietsModel.getPopularDiets();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Breakfast', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: const Color(0xffF7F8F8), borderRadius: BorderRadius.circular(10)),
            child: SvgPicture.asset('assets/icons/Arrow - Left 2.svg', height: 20, width: 20),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 37,
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: const Color(0xffF7F8F8), borderRadius: BorderRadius.circular(10)),
              child: SvgPicture.asset('assets/icons/dots.svg', height: 5, width: 5),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          _searchField(),
          const SizedBox(height: 40),
          _categoriesSection(),
          const SizedBox(height: 40),
          _dietRecommendationSection(),
          const SizedBox(height: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(padding: EdgeInsets.only(left: 20), child: Text('Popular', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600))),
              const SizedBox(height: 15),
              ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                shrinkWrap: true,
                itemBuilder: (ctx, idx) {
                  return Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: popularDiets[idx].boxIsSelected ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: popularDiets[idx].boxIsSelected ? [BoxShadow(color: const Color(0xff1D1617).withOpacity(0.07), offset: const Offset(0, 10), blurRadius: 40, spreadRadius: 0)] : [],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(popularDiets[idx].iconPath, width: 65, height: 65),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(popularDiets[idx].name, style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 16)),
                            Text('${popularDiets[idx].level} | ${popularDiets[idx].duration} | ${popularDiets[idx].calorie}', style: const TextStyle(fontWeight: FontWeight.w400, color: Color(0xff7B6F72), fontSize: 13)),
                          ],
                        ),
                        GestureDetector(onTap: () {}, child: SvgPicture.asset('assets/icons/button.svg', width: 30, height: 30)),
                      ],
                    ),
                  );
                },
                separatorBuilder: (ctx, idx) => const SizedBox(height: 25),
                itemCount: popularDiets.length,
              ),
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [BoxShadow(color: const Color(0xff1D1617).withOpacity(0.11), blurRadius: 40, spreadRadius: 0.0)]),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(15),
          hintText: 'Search Pancake',
          hintStyle: const TextStyle(color: Color(0xffDDDADA), fontSize: 14),
          prefixIcon: Padding(padding: const EdgeInsets.all(12), child: SvgPicture.asset('assets/icons/Search.svg')),
          suffixIcon: SizedBox(
            width: 100,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const VerticalDivider(color: Colors.black, thickness: 0.1, indent: 10, endIndent: 10),
                  Padding(padding: const EdgeInsets.all(8), child: SvgPicture.asset('assets/icons/Filter.svg')),
                ],
              ),
            ),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
        ),
      ),
    );
  }

  Widget _categoriesSection() {
    List<CategoryModel> categories = CategoryModel.getCategories();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(padding: EdgeInsets.only(left: 20), child: Text('Category', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600))),
        const SizedBox(height: 15),
        SizedBox(
          height: 120,
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            separatorBuilder: (ctx, idx) => const SizedBox(width: 25),
            itemBuilder: (ctx, idx) {
              return Container(
                width: 100,
                decoration: BoxDecoration(
                  color: categories[idx].boxColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                      child: Padding(padding: const EdgeInsets.all(8.0), child: SvgPicture.asset(categories[idx].iconPath)),
                    ),
                    Text(categories[idx].name, style: const TextStyle(fontWeight: FontWeight.w400, color: Colors.black, fontSize: 14))
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _dietRecommendationSection() {
    List<DietModel> diets = DietModel.getDiets();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(padding: EdgeInsets.only(left: 20), child: Text('Recommendation\nfor Diet', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600))),
        const SizedBox(height: 15),
        SizedBox(
          height: 240,
          child: ListView.separated(
            itemBuilder: (ctx, idx) {
              return Container(
                width: 210,
                decoration: BoxDecoration(color: diets[idx].boxColor.withOpacity(0.3), borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(diets[idx].iconPath),
                    Column(
                      children: [
                        Text(diets[idx].name, style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 16)),
                        Text('${diets[idx].level} | ${diets[idx].duration} | ${diets[idx].calorie}', style: const TextStyle(fontWeight: FontWeight.w400, color: Color(0xff7B6F72), fontSize: 13)),
                      ],
                    ),
                    Container(
                      height: 45,
                      width: 130,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [diets[idx].viewIsSelected ? const Color(0xff9DCEFF) : Colors.transparent, diets[idx].viewIsSelected ? const Color(0xff92A3FD) : Colors.transparent]),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(child: Text('View', style: TextStyle(color: diets[idx].viewIsSelected ? Colors.white : const Color(0xffC58BF2), fontWeight: FontWeight.w600, fontSize: 14))),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(width: 25),
            itemCount: diets.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
          ),
        ),
      ],
    );
  }
}

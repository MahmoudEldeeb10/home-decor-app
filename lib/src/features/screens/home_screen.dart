import 'package:flutter/material.dart';
import 'package:home_decor/src/features/widgets/image_slider_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 24, left: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi, Welcome Back",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffF4B5A4),
                        ),
                      ),
                      Text("Create spaces that bring joy"),
                    ],
                  ),
                  Spacer(),
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Color(0xffF4B5A4),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 30,
              ),

              ImageSliderWidget(),

              SizedBox(
                height: 30,
              ),
              Text(
                "Categories",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffF4B5A4),
                ),
              ),
              // CategoriesWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

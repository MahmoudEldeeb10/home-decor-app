import 'package:flutter/material.dart';
import 'package:home_decor/src/core/services/best_seller_service.dart';
import 'package:home_decor/src/core/services/new_collection_service.dart';
import 'package:home_decor/src/features/models/best_seller_model.dart';
import 'package:home_decor/src/features/widgets/best_seller_card.dart';
import 'package:home_decor/src/features/widgets/custom_categories_widgets.dart';
import 'package:home_decor/src/features/widgets/image_slider_widget.dart';
import 'package:home_decor/src/features/widgets/new_collection_widget.dart';

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
              const SizedBox(height: 20),
              CategoryListWidget(),
              const SizedBox(height: 20),
              //
              Text(
                "Best Seller",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffF4B5A4),
                ),
              ),
              SizedBox(height: 10),
              FutureBuilder<List<BestSellerModel>>(
                future: BestSellerService.fetchBestSellers(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  final product = snapshot.data!.first;
                  return BestSellerCard(product: product);
                },
              ),
              SizedBox(height: 20),
              //
              Text(
                "New Collection",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffF4B5A4),
                ),
              ),

              // SizedBox(height: 20),
              FutureBuilder(
                future: NewCollectionService.fetchNewCollection(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  }

                  final products = snapshot.data!;
                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(), // important
                    shrinkWrap: true, // important to fit inside Column
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // 2 products per row
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 0.75, // adjust height
                        ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return NewCollectionWidget(product: products[index]);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

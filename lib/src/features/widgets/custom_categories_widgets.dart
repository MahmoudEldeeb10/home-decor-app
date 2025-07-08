import 'package:flutter/material.dart';
import 'package:home_decor/src/core/services/category_service.dart';
import 'package:home_decor/src/features/models/categories_model.dart';

class CategoryListWidget extends StatefulWidget {
  @override
  _CategoryListWidgetState createState() => _CategoryListWidgetState();
}

class _CategoryListWidgetState extends State<CategoryListWidget> {
  List<CategoryModel> categories = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    try {
      final result = await CategoryService.fetchCategories();
      setState(() {
        categories = result;
        isLoading = false;
      });
    } catch (e) {
      print('Error loading categories: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) return Center(child: CircularProgressIndicator());
    if (categories.isEmpty) return Text("No categories found");

    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => SizedBox(width: 12),
        itemBuilder: (context, index) {
          final category = categories[index];
          return Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xFFF4B5A4).withOpacity(0.2),

                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Image.network(
                  category.icon,
                  width: 24,
                  height: 24,
                  errorBuilder: (_, __, ___) => Icon(Icons.error),
                ),
              ),
              SizedBox(height: 4),
              Text(
                category.name,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          );
        },
      ),
    );
  }
}

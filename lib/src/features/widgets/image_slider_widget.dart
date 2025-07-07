import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:home_decor/src/core/services/slider_service.dart';

class ImageSliderWidget extends StatefulWidget {
  @override
  _ImageSliderWidgetState createState() => _ImageSliderWidgetState();
}

class _ImageSliderWidgetState extends State<ImageSliderWidget> {
  List<String> imageUrls = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  Future<void> _loadImages() async {
    try {
      final images = await SliderService.fetchSliderImages();
      print("Fetched images: $images"); // Debug log
      setState(() {
        imageUrls = images;
        isLoading = false;
      });
    } catch (e) {
      print('Error loading images: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) return Center(child: CircularProgressIndicator());

    if (imageUrls.isEmpty) {
      return Center(child: Text("No images found"));
    }

    return CarouselSlider(
      items: imageUrls.map((url) {
        return Builder(
          builder: (context) => ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              url,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  Container(color: Colors.grey, child: Icon(Icons.error)),
            ),
          ),
        );
      }).toList(),
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CarouselWidget extends StatelessWidget {

  final List<String> images;

  const CarouselWidget({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
      shrinkWrap  : true,
      itemCount   : images.length,
      itemBuilder : (context, index) {
        return Image.network(images[index]);
      },
    );
  }
}



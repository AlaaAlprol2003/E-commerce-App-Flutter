import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:e_commerce/features/product_details/presentation/widgets/custom_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselItem extends StatelessWidget {
 const CarouselItem({super.key, required this.image, required this.lenght, required this.selectedIndex});
  final int lenght ;
  final String image;
  final int selectedIndex;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.w,
      margin: REdgeInsets.symmetric(horizontal: 5),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: ColorsManager.blue),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.network(
              image,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Positioned(
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_outline, color: ColorsManager.blue),
            ),
          ),
          Positioned(
            bottom: 5,
            right: 0,
            left: 0,
            child: Row(
              spacing: 5.w,
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                ...List.generate(lenght, (index)=> CustomIndicatorWidget(isSelected: selectedIndex == index,))
              ],
            ),
          )
        ],
      ),
    );
  }
}

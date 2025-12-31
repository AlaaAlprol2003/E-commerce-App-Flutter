import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderedQuantityWidget extends StatelessWidget {
  const OrderedQuantityWidget({super.key, required this.onAddClicked, required this.onMinClicked, required this.counter});
  final VoidCallback onAddClicked;
  final VoidCallback onMinClicked;
  final int counter;
  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: REdgeInsets.symmetric(vertical: 10,horizontal:15 ),
      decoration: BoxDecoration(
        color: ColorsManager.blue,
        borderRadius: BorderRadius.circular(20.r)
      ),
      child: Row(
        
        children: [
          InkWell(
            onTap: onAddClicked,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
            
                color: Colors.transparent,
                border: Border.all(color: ColorsManager.white,width: 2),
                borderRadius: BorderRadius.circular(60.r)
              ),
              child: Icon(Icons.add,color: ColorsManager.white,),
            ),
          ),
          SizedBox(width: 10.w,),
          Text("$counter",style: GoogleFonts.poppins(fontSize: 18.sp,fontWeight: FontWeight.w500,color: ColorsManager.white),),
          SizedBox(width: 10.w,),

          InkWell(
            onTap: onMinClicked,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
              
                color: Colors.transparent,
                border: Border.all(color: ColorsManager.white,width: 2),
                borderRadius: BorderRadius.circular(60.r)
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Icon(Icons.minimize_rounded,color: ColorsManager.white,)),
            ),
          ),
        ],
      ),
    );
  }
}
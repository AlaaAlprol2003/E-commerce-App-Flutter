import 'package:e_commerce/core/resources/colors_manager.dart';
import 'package:e_commerce/features/products/presentation/cubit/products_cubit.dart';
import 'package:e_commerce/features/products/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductScreen extends StatelessWidget {       
  const ProductScreen({super.key,});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      appBar: AppBar(
        backgroundColor: ColorsManager.lightBlue,
        title:Text("Products") ,
        centerTitle: true,
        titleTextStyle: GoogleFonts.poppins(fontSize: 20.sp,fontWeight: FontWeight.w600,color: ColorsManager.offwhite),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: ColorsManager.offwhite, size: 30),
        ),
      ),
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductsFailure) {
            return Center(child: Text(state.message));
          } else if (state is ProductsSuccess) {
            var products = state.products;
            return products.isEmpty ? Center(child: Text("No Products Found For This Category Now",textAlign: TextAlign.center,style: GoogleFonts.poppins(fontSize: 25.sp,fontWeight: FontWeight.w500,color: ColorsManager.darkBlue),),): GridView.builder(
              
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 7 / 13,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) => ProductItem(product: products[index]),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
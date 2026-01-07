import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/domain/entities/brand_entity.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/domain/use_cases/brands_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class BrandsCubit extends Cubit<BrandsState> {
  GetBrandsUseCase brandsUseCase;

  BrandsCubit({required this.brandsUseCase}) : super(Brandsinitial()){
    getAllBrands();
  }

  void getAllBrands() async {
    emit(BrandsLoading());
    final result = await brandsUseCase.call();
    result.fold(
      ifLeft: (failure) {
        emit(BrandsFailure(message: failure.message));
      },
      ifRight: (brandsList) {
        emit(BrandsSuccess(brands: brandsList));
      },
    );
  }
}

abstract class BrandsState {}

class Brandsinitial extends BrandsState {}

class BrandsLoading extends BrandsState {}

class BrandsFailure extends BrandsState {
  String message;
  BrandsFailure({required this.message});
}

class BrandsSuccess extends BrandsState {
  List<BrandEntity> brands;
  BrandsSuccess({required this.brands});
}

import 'package:e_commerce/features/main_layout/presentation/screens/tabs/categories/domain/entities/sub_category_entity.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/categories/domain/use_cases.dart/get_sub_categories_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class SubCategoriesCubit extends Cubit<SubCategoriesState> {
  GetSubCategoriesUseCase getSubCategoriesUseCase;
  SubCategoriesCubit({required this.getSubCategoriesUseCase})
    : super(SubCategoriesInitial()){
      getSubCategories("6439d58a0049ad0b52b9003f");
    }

  void getSubCategories(String categoryID) async {
    emit(SubCategoriesLoading());
    var result = await getSubCategoriesUseCase(categoryID);
    result.fold(
      ifLeft: (failure) {
        emit(SubCategoriesfailure(message: failure.message));
      },
      ifRight: (subCategories) {
        emit(SubCategoriesSuccess(subCategories: subCategories));
      },
    );
  }
}

abstract class SubCategoriesState {}

class SubCategoriesInitial extends SubCategoriesState {}

class SubCategoriesLoading extends SubCategoriesState {}

class SubCategoriesfailure extends SubCategoriesState {
  String message;
  SubCategoriesfailure({required this.message});
}

class SubCategoriesSuccess extends SubCategoriesState {
  List<SubCategoryEntity> subCategories;
  SubCategoriesSuccess({required this.subCategories});
}

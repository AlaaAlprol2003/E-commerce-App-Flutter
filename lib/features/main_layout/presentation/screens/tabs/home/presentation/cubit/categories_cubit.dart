import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/domain/entities/category_entity.dart';
import 'package:e_commerce/features/main_layout/presentation/screens/tabs/home/domain/use_cases/get_categories_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  GetCategoriesUseCase getCategoriesUseCase;
  CategoriesCubit({required this.getCategoriesUseCase})
    : super(CategoriesInitial()) {
    getCategories();
  }

  void getCategories() async {
    emit(CategoriesLoading());
    final result = await getCategoriesUseCase();
    result.fold(
      ifLeft: (failure) {
        print(failure.toString());
        emit(CategoriesError(message: failure.message));
      },
      ifRight: (categories) {
        emit(CategoriesSuccess(categories: categories));
      },
    );
  }
}

abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesError extends CategoriesState {
  String message;
  CategoriesError({required this.message});
}

class CategoriesSuccess extends CategoriesState {
  List<CategoryEntity> categories;
  CategoriesSuccess({required this.categories});
}

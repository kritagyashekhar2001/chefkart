import 'package:bloc/bloc.dart';
import 'package:chefkart/data/repository.dart';
import 'package:chefkart/model/dish_details.dart';
import 'package:chefkart/model/dishes_model.dart';
import 'package:meta/meta.dart';

part 'dishes_event.dart';
part 'dishes_state.dart';

class DishesBloc extends Bloc<DishesEvent, DishesState> {
  final DishesRepository dishesRepository = DishesRepository();

  DishesBloc() : super(DishesInitial()) {
    on<FetchDishesList>((event, emit) async {
      emit(DishesLoading());
      DishesList dishesList = await dishesRepository.getDishes();
      emit(DishesLoaded(dishesList));
    });
    on<FetchDisheDetail>((event, emit) async {
      emit(DishesLoading());
      DishDetails dishDetails =
          await dishesRepository.getDishesDetail(event.index);
      emit(DishDetailsLoaded(dishDetails));
    });
  }
}

part of 'dishes_bloc.dart';

@immutable
abstract class DishesEvent {}

class FetchDishesList extends DishesEvent {
  @override
  List<Object> get props => [];
}

class FetchDisheDetail extends DishesEvent {
  final int index;

  FetchDisheDetail(this.index);
  @override
  List<Object> get props => [index];
}

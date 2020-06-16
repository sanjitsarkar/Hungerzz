part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();
}

class ProductInitial extends ProductState {
  @override
  List<Object> get props => [];
}
class ProductLoading extends ProductState {
  @override
  List<Object> get props => [];
}
class ProductLoaded extends ProductState {
  final List<Product> products;

  ProductLoaded({this.products});

  @override
  List<Object> get props => [products];
}
class ProductError extends ProductState {
  final String error;

  ProductError({this.error});
  @override
  List<Object> get props => [error];
}

part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class AddtoCart extends CartEvent {
  final CartItem cartItem;

  AddtoCart({this.cartItem});
  @override
  // TODO: implement props
  List<Object> get props => [cartItem];
}

class RemovefromCart extends CartEvent {
  final String productId;

  RemovefromCart({this.productId});

  @override
  // TODO: implement props
  List<Object> get props => [productId];
}

class IncreaseQuantity extends CartEvent {
  final String prodcutId;

  IncreaseQuantity({this.prodcutId});

  @override
  // TODO: implement props
  List<Object> get props => [prodcutId];
}

class DecreaseQuantity extends CartEvent {
  final String prodcutId;

  DecreaseQuantity({this.prodcutId});

  @override
  // TODO: implement props
  List<Object> get props => [prodcutId];
}

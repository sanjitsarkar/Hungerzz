// part of 'cart_bloc.dart';

// abstract class CartState extends Equatable {
//   const CartState();
// }

// class CartInitial extends CartState {
//   final int quantity;

//   CartInitial({this.quantity});
//   @override
//   List<Object> get props => [quantity];
// }

// class CartLoading extends CartState {
//   @override
//   List<Object> get props => [];
// }

// class CartEmpty extends CartState {
//   @override
//   List<Object> get props => [];
// }

// class LoadCartError extends CartState {
//   final String error;

//   LoadCartError({this.error});

//   @override
//   // TODO: implement props
//   List<Object> get props => [error];
// }

// class CartLoaded extends CartState {
//   final List<CartItem> cartItems;
//  final double totalPrice,maxTotalPrice;
//   CartLoaded({this.cartItems,this.totalPrice,this.maxTotalPrice});

//   @override
//   // TODO: implement props
//   List<Object> get props => [cartItems,totalPrice,maxTotalPrice];

//   @override
//   String toString() => 'CartLoaded{cartItems:$cartItems}';
// }
// // class CartTotal extends CartState {
// //   final double totalPrice,maxTotalPrice;

// //   CartTotal({this.totalPrice,this.maxTotalPrice});

// //   @override
// //   // TODO: implement props
// //   List<Object> get props => [totalPrice,maxTotalPrice];

// //   @override
// //   String toString() => 'CartTotal{totalPrice:$totalPrice}';
// // }

// class CartCount extends CartState {
//   @override
//   List<Object> get props => [];
// }

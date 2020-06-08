import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hungerzzz/models/CartItem.dart';
// import 'package:hungerzzz/models/CartItem.dart';
// import 'package:hungerzzz/models/CartItem.dart';
// import 'package:hungerzzz/models/cartItem.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  List<CartItem> cartItems = [];
  double totalPrice = 0,maxTotalPrice=0;
  CartItem cartItem;
  @override
  CartState get initialState => CartInitial();

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    // TODO: implement mapEventToState

    if (event is AddtoCart) {
      yield* _mapAddtoCartToState(event);
    } else if (event is RemovefromCart) {
      yield* _mapRemovetoCartToState(event);
    } else if (event is DecreaseQuantity) {
      yield* _mapDecreaseQuantityToState(event);
    } else if (event is IncreaseQuantity) {
      yield* _mapIncreaseQuantityToState(event);
    }
  }

  Stream<CartState> _mapAddtoCartToState(AddtoCart event) async* {
    yield CartLoading();
    cartItems.add(event.cartItem);
    // print(event.cartItem.cartItemMPrice);
    double mPrice = event.cartItem.cartItemMPrice*event.cartItem.cartItemQuantity;
    double price = mPrice-(event.cartItem.discount/mPrice)*100;
    totalPrice+=price;
    maxTotalPrice+=mPrice;
    yield CartLoaded(cartItems: cartItems,maxTotalPrice: maxTotalPrice,totalPrice:totalPrice);
    // print(cartItems);
  }

  Stream<CartState> _mapRemovetoCartToState(RemovefromCart event) async* {
    yield CartLoading();
    int index =
        cartItems.indexWhere((item) => item.cartItemId == event.prodcutId);
cartItem = cartItems[index];
double mPrice = cartItem.cartItemMPrice*cartItem.cartItemQuantity;
 double price = mPrice-(cartItem.discount/mPrice)*100;
    totalPrice+=price;
    maxTotalPrice+=mPrice;
    cartItems.removeWhere((item) => item.cartItemId == event.prodcutId);
    
    
    yield CartLoaded(cartItems: cartItems,maxTotalPrice: maxTotalPrice,totalPrice:totalPrice);
   
  }

  Stream<CartState> _mapDecreaseQuantityToState(DecreaseQuantity event) async* {
    yield CartLoading();

    int index =
        cartItems.indexWhere((item) => item.cartItemId == event.prodcutId);
        int quantity = cartItems[index].cartItemQuantity;
        if(quantity>=1)
        {
        
    cartItem = cartItems[index] =
        cartItem(cartItemQuantity: cartItems[index].cartItemQuantity - 1);
        double price = cartItem.cartItemMPrice-(cartItem.discount/cartItem.cartItemMPrice)*100;
    totalPrice+=price;
    maxTotalPrice+=cartItem.cartItemMPrice;
        }
    // yield CartInitial(quantity: cartItems[index].cartItemQuantity);
    yield CartLoaded(cartItems: cartItems,maxTotalPrice: maxTotalPrice,totalPrice:totalPrice);
  }

  Stream<CartState> _mapIncreaseQuantityToState(IncreaseQuantity event) async* {
    yield CartLoading();
    int index =
        cartItems.indexWhere((item) => item.cartItemId == event.prodcutId);
    cartItem = cartItems[index] =
        cartItem(cartItemQuantity: cartItems[index].cartItemQuantity + 1);
        double price = cartItem.cartItemMPrice-(cartItem.discount/cartItem.cartItemMPrice)*100;
    totalPrice+=price;
    maxTotalPrice+=cartItem.cartItemMPrice;
    // yield CartInitial(quantity: cartItems[index].cartItemQuantity);
   yield CartLoaded(cartItems: cartItems,maxTotalPrice: maxTotalPrice,totalPrice:totalPrice);
  }
}

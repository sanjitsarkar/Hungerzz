import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hungerzzz/models/Product.dart';
import 'package:hungerzzz/repositories/StoreRepo.dart';
import 'package:meta/meta.dart';
import 'package:hungerzzz/repositories/ProductRepo.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepo _productRepo;
  StoreRepo _storeRepo = StoreRepo();
  List<Product> products = [];
  String email;
  ProductBloc({@required ProductRepo productRepo})
      : assert(productRepo != null),
        _productRepo = productRepo;
  @override
  ProductState get initialState => ProductInitial();

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    // TODO: implement mapEventToState

    if (event is ProductStart) {
      yield* _mapProductStartToState(event);
    } 
    else if (event is ProductStartPopular) {
      yield* _mapProductStartPopularToState(event);
    } 
    else if (event is ProductStartByCategory) {
      yield* _mapProductStartByCategoryToState(event);
    }
    else if (event is ProductRefresh) {
      yield* _mapProductRefreshToState(event);
    } else if (event is ProductMore) {
      yield* _mapProductMoreToState();
    } else if (event is ProductAdd) {
      yield* _mapProductAddToState(event);
    }
  }

  Stream<ProductState> _mapProductStartToState(ProductStart event) async* {
    try {
      yield ProductLoading();
     
     
      products = await _productRepo.getProductDetails(event.categoryId);
      // print(products);
      yield ProductLoaded(products: products);
    } catch (e) {
      yield ProductError(error: e.toString());
    }
  }
  Stream<ProductState> _mapProductStartByCategoryToState(ProductStartByCategory event) async* {
    try {
      yield ProductLoading();
      
     
      products = await _productRepo.getProductDetailsByCategoryStore(event.storeId,event.categoryId);
      // products = await _productRepo.getProductDetails(event.uid);
      print(event.storeId);
      print(event.categoryId);
      yield ProductLoaded(products: products);
    } catch (e) {
      yield ProductError(error: e.toString());
    }
  }
  Stream<ProductState> _mapProductRefreshToState(ProductRefresh event) async* {
      try {
      yield ProductLoading();
      
      // products = await _productRepo.getProductDetails(storeId);
      // print(products);
      yield ProductLoaded(products: products);
    } catch (e) {
      yield ProductError(error: e.toString());
    }
    

  }

  Stream<ProductState> _mapProductMoreToState() async* {
    yield ProductLoading();
  }

  Stream<ProductState> _mapProductAddToState(ProductAdd event) async* {
    yield ProductLoading();

    // String imgUrl = await _productRepo.uploadFile(event.file);
    // await _productRepo.upload(product, storeId)
  }
 Stream<ProductState> _mapProductStartPopularToState(event)
 async*{
 try {
      yield ProductLoading();
     
     
      products = await _productRepo.getPopularProducts();
      // print(products);
      yield ProductLoaded(products: products);
    } catch (e) {
      yield ProductError(error: e.toString());
    }
 }
}

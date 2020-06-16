part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class ProductStart extends ProductEvent {
  final String categoryId;

  ProductStart({this.categoryId});
  @override
  // TODO: implement props
  List<Object> get props => [categoryId];
}
class ProductStartPopular extends ProductEvent {
  // final String categoryId;

  // ProductStart({this.categoryId});
  // @override
  // // TODO: implement props
  List<Object> get props => [];
}
class ProductStartByCategory extends ProductEvent {
  final String storeId,categoryId;

  ProductStartByCategory({this.categoryId, this.storeId});
  @override
  // TODO: implement props
  List<Object> get props => [storeId,categoryId];
}
class ProductRefresh extends ProductEvent {
  final String uid;

  ProductRefresh({this.uid});
  @override
  // TODO: implement props
  List<Object> get props => [uid];
}
class ProductAdd extends ProductEvent {
  final Product product;
  final String storeId;
  final File file;

  ProductAdd({this.storeId, this.file, this.product});
  @override
  // TODO: implement props
  List<Object> get props => [product,storeId,file];
}
class ProductUpdate extends ProductEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class ProductDelete extends ProductEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class ProductSearch extends ProductEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class ProductMore extends ProductEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
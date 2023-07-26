import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_sample_project/data/cart_items.dart';
import 'package:bloc_sample_project/data/grocery_data.dart';
import 'package:bloc_sample_project/data/whishlist_item.dart';
import 'package:bloc_sample_project/features/home/model/home_product.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishLListButtonClickedEvent>(
        homeProductWishLListButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWhishlistButtonNavigateEvent>(homeWhishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(
      HomeLoadedSuccessState(
        products: GroceryData.groceryProducts
            .map(
              (e) => ProductDataModel(
                  id: e['id'],
                  name: e['name'],
                  category: e['category'],
                  price: e['price'],
                  imageUrl: e['image']),
            )
            .toList(),
      ),
    );
  }
}

FutureOr<void> homeProductCartButtonClickedEvent(
    HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
  print('whishlist product clicked');
  cartItems.add(event.clickedProduct);
  emit(HomeProductItemCartedActionState());
}

FutureOr<void> homeWhishlistButtonNavigateEvent(
    HomeWhishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
  emit(HomeNavigateToWishListPageActionState());
  print('whishlist Navigate clicked');
}

FutureOr<void> homeCartButtonNavigateEvent(
    HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
  emit(HomeNavigateToCartageActionState());
  print('cart navigate  clicked');
}

FutureOr<void> homeProductWishLListButtonClickedEvent(
    HomeProductWishLListButtonClickedEvent event, Emitter<HomeState> emit) {
  print('cart product  clicked');
  wishlistItems.add(event.clickedProduct);
  emit(HomeProductItemWhishlistedActionState());
}

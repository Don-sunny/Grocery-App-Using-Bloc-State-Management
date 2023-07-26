import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_sample_project/data/cart_items.dart';
import 'package:bloc_sample_project/features/home/model/home_product.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }
  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveFromCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.product);
    emit(CartSuccessState(cartItems: cartItems));
    emit(CartRemoveActionState());
  }
}

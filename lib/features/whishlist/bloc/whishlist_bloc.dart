import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_sample_project/data/whishlist_item.dart';
import 'package:bloc_sample_project/features/home/model/home_product.dart';
import 'package:meta/meta.dart';

part 'whishlist_event.dart';
part 'whishlist_state.dart';

class WhishlistBloc extends Bloc<WhishlistEvent, WhishlistState> {
  WhishlistBloc() : super(WhishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistReomveEvent>(wishlistReomveEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WhishlistState> emit) {
    emit(WihshlistSuccessState(whishlistItem: wishlistItems));
  }

  FutureOr<void> wishlistReomveEvent(
      WishlistReomveEvent event, Emitter<WhishlistState> emit) {
    wishlistItems.remove(event.prouduct);
    emit(WihshlistSuccessState(whishlistItem: wishlistItems));
    emit(WhishlistRemoveActionState());
  }
}

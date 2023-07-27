part of 'whishlist_bloc.dart';

@immutable
abstract class WhishlistEvent {}

class WishlistInitialEvent extends WhishlistEvent {}

class WishlistReomveEvent extends WhishlistEvent {
  final ProductDataModel prouduct;

  WishlistReomveEvent({required this.prouduct});
}

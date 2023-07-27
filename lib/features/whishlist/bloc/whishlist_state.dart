part of 'whishlist_bloc.dart';

@immutable
abstract class WhishlistState {}

abstract class WhishlistActionState extends WhishlistState {}

class WhishlistInitial extends WhishlistState {}

class WihshlistSuccessState extends WhishlistState {
  final List<ProductDataModel> whishlistItem;

  WihshlistSuccessState({
    required this.whishlistItem,
  });
}

class WhishlistRemoveActionState extends WhishlistActionState {}

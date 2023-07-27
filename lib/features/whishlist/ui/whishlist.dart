import 'package:bloc_sample_project/features/whishlist/bloc/whishlist_bloc.dart';
import 'package:bloc_sample_project/features/whishlist/ui/whishlist_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Whishlist extends StatefulWidget {
  const Whishlist({super.key});

  @override
  State<Whishlist> createState() => _WhishlistState();
}

class _WhishlistState extends State<Whishlist> {
  final WhishlistBloc whishlistBloc = WhishlistBloc();

  @override
  void initState() {
    whishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Whishlist Item'),
          centerTitle: true,
        ),
        body: BlocConsumer<WhishlistBloc, WhishlistState>(
          bloc: whishlistBloc,
          listener: (context, state) {
            if (state is WhishlistRemoveActionState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Item removed from cart')));
            }
          },
          listenWhen: (previous, current) => current is WhishlistActionState,
          buildWhen: (previous, current) => current is! WhishlistActionState,
          builder: (context, state) {
            switch (state.runtimeType) {
              case WihshlistSuccessState:
                final successState = state as WihshlistSuccessState;
                return ListView.builder(
                  itemCount: successState.whishlistItem.length,
                  itemBuilder: (context, index) {
                    return WhishListTileWidget(
                        whishlistBloc: whishlistBloc,
                        product: successState.whishlistItem[index]);
                  },
                );

              default:
            }
            return Container();
          },
        ));
  }
}

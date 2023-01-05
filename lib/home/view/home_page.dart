import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif_repository/gif_repository.dart';
import 'package:practicas_arquitectura/home/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      HomeCubit(context.read<GifRepository>())
        ..getGifs(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Gifs de hoy"),
          centerTitle: true,
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            switch(state.status) {
              case HomeStatus.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case HomeStatus.success:
                return GridView.count(
                  crossAxisCount: 2,
                  children: state.gifs.map((gif)=> Image.network(gif.url)).toList(),
                );
              case HomeStatus.failure:
                return const Center(
                  child: Text("Error"),
                );
            }
          },
        )
    );
  }
}

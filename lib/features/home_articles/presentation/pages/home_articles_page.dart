import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/enums/state_status.dart';
import '../model_view/bloc/home_articles_bloc.dart';
import '../model_view/states/home_articles_states.dart';

class ArticlesHomePage extends StatelessWidget {
  const ArticlesHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NYT Home Stories'),
      ),
      body: BlocBuilder<HomeArticlesBloc, HomeArticlesStates>(
        buildWhen: (previous, current) => previous.homeArticlesState != current.homeArticlesState,
        builder: (context, state) {
          if (state.homeArticlesState == StateStatus.success) {
            return ListView.builder(
              itemCount: state.articles.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.articles[index].title),
                  subtitle: Text(state.articles[index].abstract),
                  leading: CachedNetworkImage(
                    width: 50,
                    height: 50,
                    imageUrl: state.articles[index].imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                );
              },
            );
          } else if (state.homeArticlesState == StateStatus.failure) {
            return Center(child: Text(state.message));
          } else if (state.homeArticlesState == StateStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

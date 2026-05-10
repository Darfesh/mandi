import 'package:flutter/material.dart';
import 'package:mandi/core/constants/environment.dart';
import 'package:mandi/core/models/news_dto.dart';
import 'package:mandi/core/viewmodels/news_view_model.dart';
import 'package:mandi/i18n/strings.g.dart';
import 'package:mandi/ui/common/view_model_builder.dart';
import 'package:mandi/ui/widgets/news/news_card.dart';
import 'package:mandi/ui/widgets/news/news_card_shimmer.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return ViewModelBuilder<NewsViewModel>(
      onModelReady: (viewModel) => viewModel.getAllNewsPosts(),
      builder: ((context, viewModel) {
        return ValueListenableBuilder<bool>(
          valueListenable: viewModel.isBusy,
          builder: (context, isBusy, _) {
            if (isBusy) return const NewsCardShimmer();

            return ValueListenableBuilder<String?>(
              valueListenable: viewModel.errorMessage,
              builder: (context, error, _) {
                if (error != null) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(Environment.size16),
                      child: Text(
                        error,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  );
                }

                return ValueListenableBuilder<List<NewsDto>>(
                  valueListenable: viewModel.newsPosts,
                  builder: (context, posts, _) {
                    if (posts.isEmpty) {
                      return Center(child: Text(t.news.empty));
                    }

                    return ListView.separated(
                      itemBuilder: (context, index) => NewsCard(
                        newsItem: posts[index],
                      ),
                      separatorBuilder: (context, index) => Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Divider(
                            height: Environment.size32,
                            thickness: 0.5,
                            color:
                                Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                      itemCount: posts.length,
                    );
                  },
                );
              },
            );
          },
        );
      }),
    );
  }
}

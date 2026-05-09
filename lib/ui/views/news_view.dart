import 'package:flutter/material.dart';
import 'package:mandi/core/constants/environment.dart';
import 'package:mandi/core/viewmodels/news_view_model.dart';
import 'package:mandi/i18n/strings.g.dart';
import 'package:mandi/ui/common/view_model_builder.dart';
import 'package:mandi/ui/widgets/news/news_card_border.dart';
import 'package:mandi/ui/widgets/news/news_card_content.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return ViewModelBuilder<NewsViewModel>(
      onModelReady: (viewModel) => viewModel.getAllNewsPosts(),
      builder: ((context, viewModel) {
        return Scaffold(
          appBar: AppBar(
            title: Text(t.home.welcome),
          ),
          body: Center(
            child: viewModel.isBusy.value
                ? const CircularProgressIndicator()
                : viewModel.newsPosts.value.isEmpty
                    ? const CircularProgressIndicator()
                    : ListView.separated(
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(Environment.size16),
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            elevation: 1,
                            shadowColor: Colors.white,
                            color: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(Environment.size12),
                              ),
                              side: BorderSide(
                                color: Colors.grey,
                                width: 0.2,
                              ),
                            ),
                            child: Stack(
                              children: [
                                NewsCardContent(
                                  viewModel: viewModel,
                                  index: index,
                                ),
                                const NewsCardBorder(),
                              ],
                            ),
                          ),
                        ),
                        separatorBuilder: (context, index) => Center(
                          child: SizedBox(
                            //! Change this
                            width: MediaQuery.of(context).size.width / 2,
                            child: Divider(
                              height: Environment.size32,
                              thickness: 0.5,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                        itemCount: viewModel.newsPosts.value.length,
                      ),
          ),
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mandi/core/locator.dart';
import 'package:mandi/core/viewmodels/home_view_model.dart';
import 'package:mandi/i18n/strings.g.dart';
import 'package:mandi/ui/views/news_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = locator<HomeViewModel>();
    final t = Translations.of(context);
    return Scaffold(body: NewsView());
  }
}

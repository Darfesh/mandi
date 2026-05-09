import 'package:flutter/material.dart';
import 'package:mandi/ui/views/news_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: NewsView());
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mandi/i18n/strings.g.dart';
import 'package:url_launcher/url_launcher.dart';

class ShellView extends StatelessWidget {
  final Widget child;

  const ShellView({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context); // ← Get translations!

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(t.app.name)), // ✅ "Mandi" / "ماندي"
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        // ✅ Stack wrapper!
        children: [
          child, // Je normale content
          // ✅ Positioned werkt nu perfect
          Positioned(
            right: 20,
            bottom: 100,
            child: FloatingActionButton(
              heroTag: 'bug_report',
              onPressed: () => launchUrl(Uri.parse('mailto:your@email.com?subject=Bug%20Report&body=Check%20email')),
              backgroundColor: Colors.orange,
              child: Icon(Icons.bug_report),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _getCurrentIndex(context),
        onTap: (index) => _onItemTapped(context, index),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.article),
            label: t.navigation.news, // ✅ Vertaald! (moet je nog toevoegen in JSON)
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: t.navigation.profile, // ✅ Vertaald!
          ),
        ],
      ),
    );
  }

  int _getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    switch (location) {
      case '/home':
        return 0;
      case '/profile':
        return 1;
      default:
        return 0;
    }
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/profile');
        break;
    }
  }
}

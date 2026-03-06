import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mandi/core/viewmodels/profile_view_model.dart';
import 'package:mandi/ui/common/view_model_builder.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>(
      builder: (context, viewModel) {
        return _PrivacyPolicyContent(viewModel: viewModel);
      },
    );
  }
}

class _PrivacyPolicyContent extends StatefulWidget {
  final ProfileViewModel viewModel;

  const _PrivacyPolicyContent({required this.viewModel});

  @override
  State<_PrivacyPolicyContent> createState() => _PrivacyPolicyContentState();
}

class _PrivacyPolicyContentState extends State<_PrivacyPolicyContent>
    with SingleTickerProviderStateMixin {
  // ✅ Voor animaties
  late final WebViewController _controller;
  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;

  bool _isLoading = true;
  bool _showCheckmark = false;
  bool _isInitialized = false;
  final UniqueKey _webViewKey = UniqueKey();

  @override
  void initState() {
    super.initState();

    // ✅ Setup animatie controller
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) async {
            if (!mounted) return;

            // ✅ Toon checkmark
            setState(() {
              _showCheckmark = true;
            });

            // ✅ Wacht even zodat gebruiker checkmark ziet
            await Future.delayed(const Duration(milliseconds: 500));

            if (!mounted) return;

            // ✅ Start fade-in animatie
            setState(() {
              _isLoading = false;
            });

            _animationController.forward();
          },
        ),
      );
  }

  @override
  void dispose() {
    _animationController.dispose(); // ✅ Ruim animatie op
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_isInitialized) {
      _isInitialized = true;
      _initWebView();
    }
  }

  Future<void> _initWebView() async {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    _controller.setBackgroundColor(
      isDark ? const Color(0xFF16213e) : Colors.white,
    );

    String html = await rootBundle.loadString('assets/privacy_policy.html');

    html = html.replaceAll(RegExp(r'<style>.*?</style>', dotAll: true), '');
    html = html.replaceAll(RegExp(r'style="[^"]*"'), '');

    final backgroundColor = isDark ? '#16213e' : '#ffffff';
    final textColor = isDark ? '#ffffff' : '#000000';
    final bodyTextColor = isDark ? '#d0d0d0' : '#595959';

    final styledHtml = '''
    <!DOCTYPE html>
    <html>
    <head>
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
      <style>
        * {
          margin: 0;
          padding: 0;
          background-color: transparent !important;
          color: inherit !important;
        }
        
        body {
          font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
          padding: 20px;
          background-color: $backgroundColor !important;
          color: $bodyTextColor !important;
          line-height: 1.6;
        }
        
        h1, h2, h3, h4, h5, h6 {
          color: $textColor !important;
          margin-top: 24px !important;
          margin-bottom: 12px !important;
          font-weight: 600 !important;
        }
        
        h1 { font-size: 24px !important; }
        h2 { font-size: 20px !important; }
        h3 { font-size: 18px !important; }
        
        p, li, span, div {
          color: $bodyTextColor !important;
          font-size: 14px !important;
          line-height: 1.6 !important;
        }
        
        a {
          color: ${isDark ? '#C4A053' : '#3030F1'} !important;
          text-decoration: underline !important;
        }
        
        strong, b {
          color: $textColor !important;
          font-weight: 600 !important;
        }
        
        ul, ol {
          margin-left: 20px !important;
          margin-top: 10px !important;
          margin-bottom: 10px !important;
        }
        
        li {
          margin-bottom: 8px !important;
        }
        
        table {
          width: 100% !important;
          border-collapse: collapse !important;
          margin: 16px 0 !important;
        }
        
        th, td {
          border: 1px solid ${isDark ? '#555' : '#ddd'} !important;
          padding: 12px !important;
          text-align: left !important;
          color: $bodyTextColor !important;
        }
        
        th {
          background-color: ${isDark ? 'rgba(196, 160, 83, 0.15)' : '#f5f5f5'} !important;
          font-weight: 600 !important;
          color: $textColor !important;
        }
      </style>
    </head>
    <body>
      $html
    </body>
    </html>
  ''';

    await _controller.loadHtmlString(styledHtml);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text(
          'Privacy Policy',
          style: theme.textTheme.titleLarge?.copyWith(
            color: colorScheme.onSurface,
          ),
        ),
        elevation: 0,
        backgroundColor: colorScheme.surface,
        iconTheme: IconThemeData(
          color: colorScheme.onSurface,
        ),
      ),
      body: _isLoading
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ✅ Animated switch tussen spinner en checkmark
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: _showCheckmark
                        ? Icon(
                            Icons.check_circle_outline,
                            key: const ValueKey('check'),
                            color: theme.colorScheme.primary,
                            size: 48,
                          )
                        : CircularProgressIndicator(
                            key: const ValueKey('spinner'),
                            color: colorScheme.primary,
                          ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _showCheckmark ? 'Done!' : 'Loading privacy policy...',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
            )
          : FadeTransition(
              // ✅ Smooth fade-in
              opacity: _fadeAnimation,
              child: WebViewWidget(
                key: _webViewKey,
                controller: _controller,
              ),
            ),
    );
  }
}

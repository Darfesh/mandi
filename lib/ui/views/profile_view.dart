import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mandi/core/constants/environment.dart';
import 'package:mandi/core/viewmodels/profile_view_model.dart';
import 'package:mandi/ui/common/view_model_builder.dart';
import 'package:mandi/ui/widgets/common/action_tile.dart';
import 'package:mandi/ui/widgets/common/mandi_divider.dart';
import 'package:mandi/ui/widgets/profile/user_info_card.dart';
import 'package:mandi/ui/widgets/profile/app_version_footer.dart';

import 'package:mandi/i18n/strings.g.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return ViewModelBuilder<ProfileViewModel>(
      builder: (context, viewModel) {
        return Scaffold(
          body: ValueListenableBuilder(
            valueListenable: viewModel.currentUser,
            builder: (context, user, child) {
              if (user == null) {
                return Center(
                  child: Text(t.auth.notLoggedIn),
                );
              }

              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: Environment.size16),
                child: Column(
                  children: [
                    // UserInfoCard
                    UserInfoCard(
                      user: user,
                      viewModel: viewModel,
                    ),
                    const Gap(20),
                    MandiDivider(
                      shape: BoxShape.circle,
                    ),
                    const Gap(20),

                    // Settings
                    ActionTile(
                      icon: Icons.settings_outlined,
                      label: t.profile.settings,
                      onTap: () => context.push('/settings'),
                    ),
                    const Gap(12),

                    // Reservations
                    ActionTile(
                      icon: Icons.calendar_today_outlined,
                      label: t.profile.myReservations,
                      onTap: () => context.push('/reservationsView'),
                    ),
                    const Gap(12),

                    // Privacy statement
                    ActionTile(
                      icon: Icons.lock_outline,
                      label: 'Privacy statement',
                      onTap: () => viewModel.openPrivacyPolicy(context),
                    ),
                    const Gap(20),

                    // Logout
                    ActionTile(
                      icon: Icons.logout,
                      label: t.profile.logout,
                      onTap: () => viewModel.logout(),
                      isDanger: true,
                      showChevron: false,
                      centerContent: true,
                    ),
                    const Gap(32),

                    const Center(child: AppVersionFooter()),
                    const Gap(32),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

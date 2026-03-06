import 'package:flutter/material.dart';
import 'package:mandi/core/viewmodels/auth_view_model.dart';

class DeleteProgressBottomSheet extends StatefulWidget {
  final AuthViewModel viewModel;

  const DeleteProgressBottomSheet({
    super.key,
    required this.viewModel,
  });

  @override
  State<DeleteProgressBottomSheet> createState() => _DeleteProgressBottomSheetState();
}

class _DeleteProgressBottomSheetState extends State<DeleteProgressBottomSheet> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final deletionComplete = await widget.viewModel.startAccountDeletion();
      if (deletionComplete) Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ValueListenableBuilder<DeletionStep>(
      valueListenable: widget.viewModel.deletionStepNotifier,
      builder: (context, step, child) {
        return Container(
          color: theme.dialogBackgroundColor,
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                step == DeletionStep.completed
                    ? 'We\'re sorry to see you go 😢'
                    : 'Preparing to delete your account...',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 24),
              DeletionStepItem(
                label: 'Scheduling deletion of profile picture...',
                isCompleted: step.index > DeletionStep.removingAvatar.index,
                isActive: step == DeletionStep.removingAvatar,
              ),
              const SizedBox(height: 16),
              DeletionStepItem(
                label: 'Scheduling deletion of user data...',
                isCompleted: step.index > DeletionStep.deletingData.index,
                isActive: step == DeletionStep.deletingData,
              ),
              const SizedBox(height: 16),
              DeletionStepItem(
                label: 'Scheduling deletion of account...',
                isCompleted: step.index > DeletionStep.schedulingDeletion.index,
                isActive: step == DeletionStep.schedulingDeletion,
              ),
              if (step == DeletionStep.completed) ...[
                const SizedBox(height: 16),
                Text(
                  'Your account will be permanently deleted\nafter 30 days.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}

class DeletionStepItem extends StatelessWidget {
  final String label;
  final bool isCompleted;
  final bool isActive;

  const DeletionStepItem({
    super.key,
    required this.label,
    required this.isCompleted,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final textColor = isCompleted
        ? theme.colorScheme.primary
        : isActive
            ? theme.colorScheme.onSurface
            : theme.colorScheme.onSurfaceVariant;

    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return ScaleTransition(
                scale: CurvedAnimation(
                  parent: animation,
                  curve: Curves.bounceOut,
                ),
                child: child,
              );
            },
            child: isCompleted
                ? Icon(
                    Icons.check_circle,
                    key: const ValueKey('check'),
                    color: Colors.green,
                    size: 24,
                  )
                : isActive
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          key: const ValueKey('spinner'),
                          strokeWidth: 2,
                          color: theme.colorScheme.primary,
                        ),
                      )
                    : Icon(
                        Icons.circle_outlined,
                        key: const ValueKey('empty'),
                        color: theme.colorScheme.onSurfaceVariant,
                        size: 24,
                      ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: textColor,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}

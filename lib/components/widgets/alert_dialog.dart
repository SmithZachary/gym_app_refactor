import 'package:flutter/material.dart';

class AppAlertDialog extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? secondaryActionText;
  final String? primaryActionText;
  final Function? secondaryAction;
  final Function? primaryAction;
  final Color? primaryActionColor; // Text
  final Color? secondaryActionColor; // Text

  const AppAlertDialog({
    Key? key,
    this.title,
    this.subtitle,
    this.secondaryActionText,
    this.primaryActionText,
    this.secondaryAction,
    this.primaryAction,
    this.primaryActionColor,
    this.secondaryActionColor,
  }) : super(key: key);

  @override
  Widget build(context) {
    var _textTheme = Theme.of(context).textTheme;

    var _actions = [
      Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(secondaryActionText!),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).errorColor,
                    ),
                    onPressed: () {},
                    child: Text(primaryActionText!),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    ];

    return AlertDialog(
      insetPadding: const EdgeInsets.fromLTRB(50, 20, 50, 30),
      contentPadding: const EdgeInsets.all(20),
      title: Text(
        title!,
      ),
      content: subtitle != null
          ? Text(
              subtitle!,
            )
          : null,
      actions: _actions,
    );
  }
}

/// Shortcut for showing a LoopDialogBox, will include `TYPE` parameter when multiple
/// different dialog box instances are required in the application.
///
/// [title] Large title text for the dialog box.
/// [subtitle] Smaller subtitle used for more informative message.
/// [primaryAction] The action for the button displayed on the right, often associated with "YES".
/// [secondaryAction] The action for the button displayed on the left, often associated with "CANCEL".
/// [context] The BuildContext of the parent widget.
/// [primaryActionText] Text for the button of the primary action.
/// [secondaryActionText] Text for the button of the secondary action.
/// [primaryActionColor] Optional override for the color of the primary action text.
/// [secondaryActionColor] Optional override for the color of the secondary action text.
Future<void> showLoopDialog({
  required String? title,
  required Function primaryAction,
  required BuildContext context,
  required String primaryActionText,
  String? subtitle,
  Function? secondaryAction,
  String? secondaryActionText,
  Color? primaryActionColor,
  Color? secondaryActionColor,
}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AppAlertDialog(
        title: title,
        subtitle: subtitle,
        primaryAction: primaryAction,
        secondaryAction: secondaryAction,
        primaryActionText: primaryActionText,
        secondaryActionText: secondaryActionText,
        primaryActionColor: primaryActionColor,
        secondaryActionColor: secondaryActionColor,
      );
    },
  );
}

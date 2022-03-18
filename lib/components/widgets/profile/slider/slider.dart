import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../_widgets.dart';

class AppSlider extends StatefulWidget {
  final int? rating;
  final String? userId;

  const AppSlider(this.rating, this.userId, {Key? key}) : super(key: key);

  @override
  State<AppSlider> createState() => _AppSliderState();
}

class _AppSliderState extends State<AppSlider> {
  // final InAppReview _inAppReview = InAppReview.instance;
  bool _inAppReviewIsAvailable = false;
  int? _reviewValue;
  var _canEnd = false;

  @override
  void initState() {
    // AppReview.getAppID;

    if (widget.rating != null) {
      _reviewValue = widget.rating;
    } else {
      _reviewValue = 5;
    }

    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   _inAppReview.isAvailable().then((bool isAvailable) {
    //     _inAppReviewIsAvailable = isAvailable;
    //   });
    // });

    super.initState();
  }

  // Future<void> _requestReview() async {
  //   if (_inAppReviewIsAvailable == null) {
  //     await _inAppReview.requestReview();
  //   } else {
  //     await _inAppReview.openStoreListing(appStoreId: '1258695795');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            GestureDetector(
              onTapCancel: () {
                _canEnd = false;
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 69.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('0', style: TextStyle(fontSize: 14)),
                        Text('10', style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45.0),
                    child: Container(
                      height: 20,
                      child: Slider(
                        value: _reviewValue!.toDouble(),
                        onChanged: (newRating) {
                          _canEnd = true;
                          setState(
                            () => _reviewValue = newRating.toInt(),
                          );
                        },
                        onChangeEnd: (newRating) async {
                          if (!_canEnd) return;
                          setState(() => _reviewValue = newRating.toInt());

                          if (newRating < 8) {
                            await showDialog(
                              context: context,
                              builder: (context) => AppAlertDialog(
                                title: 'Feedback?',
                                subtitle:
                                    "Looks like you don't love the app as much as we "
                                    'hoped you would. With your feedback, we '
                                    "promise we'll make it even better.",
                                secondaryAction: () => Navigator.pop(context),
                                secondaryActionText: 'Cancel',
                                // secondaryActionColor: _colorScheme.onSurface,
                                primaryActionText: 'Report',
                                primaryAction: () async => await launch(
                                  'https://loopmesscom/',
                                ),
                              ),
                            );
                          } else {
                            await showDialog(
                              context: context,
                              builder: (context) => AppAlertDialog(
                                title: 'Rate us?',
                                subtitle:
                                    "It seems like you are enjoying our app. Please consider leaving us a 5-star review",
                                secondaryAction: () => Navigator.pop(context),
                                secondaryActionText: 'Not Now',
                                primaryActionText: 'LET\'S DO IT',
                                primaryAction: null,
                              ),
                            );
                          }
                        },
                        divisions: 10,
                        label: '$_reviewValue',
                        min: 0,
                        max: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

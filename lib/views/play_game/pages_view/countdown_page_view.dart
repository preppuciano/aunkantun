import 'package:aukantun/config/app_color.dart';
import 'package:aukantun/config/app_config.dart';
import 'package:aukantun/widgets/core/core_app_bar.dart';
import 'package:aukantun/widgets/core/core_button.dart';
import 'package:aukantun/widgets/core/core_padding.dart';
import 'package:aukantun/widgets/core/core_text_field.dart';
import 'package:aukantun/widgets/core_background.dart';
import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:flutter/material.dart';

class CountdownPageView extends StatefulWidget {
  final Function soundCounterdownFinish;
  final PageController pageController;
  const CountdownPageView({
    super.key,
    required this.pageController,
    required this.soundCounterdownFinish,
  });

  @override
  State<CountdownPageView> createState() => _CountdownPageViewState();
}

class _CountdownPageViewState extends State<CountdownPageView> {
  final _controller = CountDownController();
  int countdownTimer = 10;
  bool isRunning = false;
  bool isCompleted = false;
  late TextEditingController _inputTextEditingController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _inputTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _inputTextEditingController.dispose();
    super.dispose();
  }

  void previousPageHandle() {
    widget.pageController.previousPage(
        duration: Duration(milliseconds: 500), curve: Curves.bounceIn);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        previousPageHandle();
        return false;
      },
      child: CoreBackground(
          child: Column(
        children: [
          CoreAppBar(
              title: 'Temporizador',
              customTapBack: () {
                previousPageHandle();
              }),
          CorePadding(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.charcoalColor.withOpacity(0.8),
                  ),
                  height: 200,
                  width: 200,
                  child: CountDownProgressIndicator(
                    key: ValueKey(countdownTimer),
                    controller: _controller,
                    labelTextStyle: TextStyle(
                      color: AppColor.softWhite,
                      fontSize: AppConfig.fontSizeLG,
                    ),
                    timeTextStyle: TextStyle(
                        color: AppColor.softWhite,
                        fontSize: AppConfig.fontSizeLG),
                    valueColor: AppColor.appleGreen,
                    backgroundColor: AppColor.softWhite,
                    initialPosition: 0,
                    duration: countdownTimer,
                    text: 'Segundos',
                    autostart: false,
                    onComplete: () {
                      setState(() {
                        widget.soundCounterdownFinish();
                        isCompleted = true;
                        isRunning = false;
                      });
                    },
                  ),
                ),
                SizedBox(height: 15),
                Form(
                  key: _formKey,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: CoreTextField(
                            prefixIcon: Icons.timer_sharp,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.number,
                            textEditingController: _inputTextEditingController,
                            hintText: 'Segundos',
                            validator: (value) {
                              if (value != null) {
                                if (int.tryParse(value) != null) {
                                  if (int.parse(value) > 0) {
                                    return null;
                                  }
                                  return "Valor inválido";
                                }
                                return "Valor inválido";
                              }
                              return "Valor inválido";
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CoreButton(
                          text: 'Establecer',
                          buttonType: CoreButtonType.primary,
                          onPressed: () {
                            WidgetsBinding.instance.focusManager.primaryFocus
                                ?.unfocus();
                            if (_formKey.currentState?.validate() ?? false) {
                              setState(() {
                                _controller.pause();
                                isCompleted = false;
                                isRunning = false;
                                countdownTimer =
                                    int.parse(_inputTextEditingController.text);
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: isRunning
                          ? CoreButton(
                              text: 'Pause',
                              onPressed: () {
                                setState(() {
                                  isRunning = false;
                                  _controller.pause();
                                });
                              },
                            )
                          : CoreButton(
                              text: 'Resume',
                              onPressed: isCompleted
                                  ? null
                                  : () {
                                      setState(() {
                                        isRunning = true;
                                        _controller.resume();
                                      });
                                    },
                            ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                        child: CoreButton(
                      text: 'Restart',
                      buttonType: CoreButtonType.danger,
                      onPressed: () {
                        setState(() {
                          isCompleted = false;
                          isRunning = true;
                          _controller.restart(initialPosition: 0);
                        });
                      },
                    )),
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

import 'package:aukantun/config/app_color.dart';
import 'package:aukantun/config/app_config.dart';
import 'package:aukantun/config/app_localizations.dart';
import 'package:aukantun/services/audio_service.dart';
import 'package:aukantun/widgets/core/core_app_bar.dart';
import 'package:aukantun/widgets/core/core_button.dart';
import 'package:aukantun/widgets/core/core_logo.dart';
import 'package:aukantun/widgets/core/core_padding.dart';
import 'package:aukantun/widgets/core_background.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    Provider.of<AudioService>(context, listen: false).initialize();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final audioService = Provider.of<AudioService>(context, listen: false);
    if (state == AppLifecycleState.paused) {
      audioService.pause();
    } else if (state == AppLifecycleState.resumed) {
      audioService.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CoreBackground(
        animated: true,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: CoreAppBar(
                actionIcon: Icons.settings,
                actionTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => DebugView()));
                  context.push('/settings');
                },
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: CorePadding(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    WidgetAnimator(
                      atRestEffect: WidgetRestingEffects.wave(),
                      child: const CoreLogo(),
                    ),
                    const SizedBox(height: 50),
                    Column(
                      children: [
                        CoreButton(
                          text: AppLocalizations.of(context)!
                              .translate('views.home_view.sign_in'),
                          buttonType: CoreButtonType.secondary,
                          onPressed: null,
                        ),
                        // CoreButton(
                        //   text: AppLocalizations.of(context)!
                        //       .translate('views.home_view.buy'),
                        //   buttonType: CoreButtonType.secondary,
                        //   onPressed: null,
                        // ),
                        CoreButton(
                          text: AppLocalizations.of(context)!
                              .translate('views.home_view.play'),
                          onPressed: () {
                            context.push('/games');
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FutureBuilder(
                future: PackageInfo.fromPlatform(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      'Aukantun ${snapshot.data?.version}',
                      style: TextStyle(
                        fontSize: AppConfig.fontSizeSM,
                        color: AppColor.softWhite,
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

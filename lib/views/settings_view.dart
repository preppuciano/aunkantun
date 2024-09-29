import 'package:aukantun/config/app_config.dart';
import 'package:aukantun/services/audio_service.dart';
import 'package:aukantun/widgets/core/core_app_bar.dart';
import 'package:aukantun/widgets/core/core_padding.dart';
import 'package:aukantun/widgets/core/core_switch.dart';
import 'package:aukantun/widgets/core_background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  late bool music;
  late AudioService audioService;

  @override
  void initState() {
    super.initState();
    audioService = Provider.of<AudioService>(context, listen: false);
    music = audioService.audioPlayer.playing;
  }

  @override
  Widget build(BuildContext context) {
    return CoreBackground(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CoreAppBar(title: 'Configuración'),
            CorePadding(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Musica',
                          style: TextStyle(fontSize: AppConfig.fontSizeLG),
                        ),
                      ),
                      CoreSwitch(
                        value: music,
                        onChanged: (value) async {
                          setState(() => music = value);
                          if (value) {
                            await audioService.audioPlayer.play();
                          } else {
                            await audioService.audioPlayer.stop();
                          }
                        },
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Attributions',
                          style: TextStyle(fontSize: AppConfig.fontSizeLG),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          context.push('/attributions');
                        },
                        icon: Icon(Icons.info),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

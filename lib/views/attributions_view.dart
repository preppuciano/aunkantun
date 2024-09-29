import 'package:aukantun/widgets/core/core_app_bar.dart';
import 'package:aukantun/widgets/core/core_padding.dart';
import 'package:aukantun/widgets/core_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

const data = """
## Music Attribution

**1. Music from CreatorAssets**  
- **Artist:** creatorassets  
- **URL:** [Pop Sound Effects](https://creatorassets.com/a/pop-sound-effects)

**2. Music from Pixabay**  
- **Artist:** Coma-Media  
- **URL:** [Fashion Beats Simulate](https://pixabay.com/music/beats-sy-fashion-beats-simulate-11176/)

**3. Music from Pixabay**  
- **Artist:** Pixabay  
- **URL:** [Card Sounds](https://pixabay.com/sound-effects/card-sounds-35956/)

**4. Music from Pixabay**  
- **Artist:** Pixabay  
- **URL:** [Shuffle Cards](https://pixabay.com/sound-effects/shuffle-cards-46455/)

""";

class AttributionsView extends StatelessWidget {
  const AttributionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CoreBackground(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CoreAppBar(
              title: 'Attributions',
            ),
            CorePadding(
              child: Column(
                children: [
                  MarkdownBody(data: data),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

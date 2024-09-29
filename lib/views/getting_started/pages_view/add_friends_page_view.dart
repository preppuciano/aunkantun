import 'package:aukantun/config/app_color.dart';
import 'package:aukantun/config/app_localizations.dart';
import 'package:aukantun/core/getting_started/bloc/getting_started_bloc.dart';
import 'package:aukantun/models/friend_model.dart';
import 'package:aukantun/utils/sound_manager.dart';
import 'package:aukantun/widgets/core_background.dart';
import 'package:aukantun/widgets/new_friend_item.dart';
import 'package:aukantun/widgets/core/core_app_bar.dart';
import 'package:aukantun/widgets/core/core_button.dart';
import 'package:aukantun/widgets/core/core_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddFriendsPageView extends StatefulWidget {
  const AddFriendsPageView({super.key});
  @override
  State<AddFriendsPageView> createState() => _AddFriendsPageViewState();
}

class _AddFriendsPageViewState extends State<AddFriendsPageView> {
  late GettingStartedBloc gettingStartedBloc;
  late List<FriendModel> friends;
  final int lengthFriendsInit = 1;

  @override
  void initState() {
    super.initState();
    gettingStartedBloc = BlocProvider.of<GettingStartedBloc>(context);
    friends =
        List.filled(lengthFriendsInit, FriendModel.init(), growable: true);
  }

  final _formKey = GlobalKey<FormState>();

  void addFriendHandle(FriendModel friend) {
    setState(() {
      friends.add(friend);
    });
  }

  void removeFriendHandle(int index) {
    setState(() {
      friends.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CoreBackground(
        child: SingleChildScrollView(
          primary: true,
          child: Column(
            children: [
              CoreAppBar(
                title: AppLocalizations.of(context)!
                    .translate('views.add_friends_view.title'),
                description: AppLocalizations.of(context)!
                    .translate('views.add_friends_view.description'),
                customTapBack: () {
                  gettingStartedBloc.currentHandle =
                      gettingStartedBloc.currentHandle?.prev;
                  Navigator.pop(context);
                },
              ),
              CorePadding(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      ...friends.map((friend) {
                        return Row(
                          children: [
                            Expanded(
                              child: NewFriendItem(
                                isEditable: true,
                                key: ValueKey(friend.id),
                                friend: friend,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                await SoundManager().playTertiaryButton();
                                setState(() => friends.remove(friend));
                                WidgetsBinding
                                    .instance.focusManager.primaryFocus
                                    ?.unfocus();
                              },
                              icon: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppColor.crimsonRed,
                                ),
                                child: Icon(
                                  Icons.remove,
                                  size: 30,
                                  color: AppColor.softWhite,
                                ),
                              ),
                              color: AppColor.crimsonRed,
                            ),
                          ],
                        );
                      }),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.appleGreen,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.add, size: 50),
                          onPressed: () async {
                            await SoundManager().playSecondaryButton();
                            addFriendHandle(FriendModel.init());
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      BlocListener(
                        bloc: gettingStartedBloc,
                        listener: (context, state) {
                          if (state is GettingStartedAddFriendsLoaded) {
                            gettingStartedBloc.currentHandle?.pushPage(context);
                          }
                        },
                        child: CoreButton(
                          heroTag: 'main',
                          text: 'Siguiente',
                          onPressed: handleNextStep,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void handleNextStep() {
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
    if (_formKey.currentState?.validate() ?? false) {
      gettingStartedBloc
          .add(GettingStartedAddFriendsViewComplete(friends: friends));
    }
  }
}

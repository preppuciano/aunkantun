import 'package:aukantun/config/app_localizations.dart';
import 'package:aukantun/models/enums/gender_enum.dart';
import 'package:aukantun/models/friend_model.dart';
import 'package:aukantun/widgets/core/core_text_field.dart';
import 'package:flutter/material.dart';

class NewFriendItem extends StatefulWidget {
  final FriendModel friend;
  final bool isEditable;
  final Function(FriendModel)? onRemove;
  final Function(FriendModel)? onChanged;
  const NewFriendItem({
    super.key,
    required this.friend,
    this.onRemove,
    this.onChanged,
    this.isEditable = false,
  });

  @override
  State<NewFriendItem> createState() => _NewFriendItemState();
}

class _NewFriendItemState extends State<NewFriendItem> {
  late Gender gender;
  late TextEditingController _inputTextEditinController;

  @override
  void initState() {
    super.initState();
    _inputTextEditinController =
        TextEditingController(text: widget.friend.name);
    gender = widget.friend.gender;
  }

  @override
  void dispose() {
    _inputTextEditinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Expanded(
            child: CoreTextField(
              enabled: widget.isEditable,
              onTapPrefixIcon: () {
                setState(() {
                  if (gender == Gender.male) {
                    gender = Gender.female;
                  } else if (gender == Gender.female) {
                    gender = Gender.male;
                  }
                });
                widget.friend.setGender = gender;
                widget.onChanged?.call(widget.friend);
              },
              prefixIcon: gender.icon,
              prefixIconContainerColor: gender.color,
              textInputAction: TextInputAction.done,
              textEditingController: _inputTextEditinController,
              hintText: AppLocalizations.of(context)!
                  .translate('widgets.new_friend_item.hintText_name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!.translate(
                      'widgets.new_friend_item.validator_enter_name');
                }
                return null;
              },
              onChanged: (value) {
                widget.friend.setName = _inputTextEditinController.text;
                widget.onChanged?.call(widget.friend);
              },
            ),
          ),
        ],
      ),
    );
  }
}

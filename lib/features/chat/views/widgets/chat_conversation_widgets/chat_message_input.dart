import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mefn/features/shared/views/widgets/app_text.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../shared/models/flink_picture_model.dart';

class ChatMessageInput extends StatelessWidget {
  final TextEditingController? messageController;
  final Function(String)? onChanged;
  final Function()? onPressedSend;
  final Function()? onPressedSelectImage;
  final Function(FlinkPicture)? onPressedRemoveImage;
  final Function()? onPressedCancelReply;
  final String? messageToReply;
  final String? replyingTo;
  final List<FlinkPicture> pictures;
  final FocusNode? focusNode;

  const ChatMessageInput({
    Key? key,
    this.messageController,
    this.onPressedSend,
    this.onPressedSelectImage,
    this.onPressedRemoveImage,
    this.onChanged,
    this.replyingTo,
    this.messageToReply,
    this.onPressedCancelReply,
    this.pictures = const [],
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _selectedImageBuilder(),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 5.0,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.shadow,
                offset: const Offset(0, -2),
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (replyingTo != null || messageToReply != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (replyingTo != null)
                            AppText.body(
                              'Replying to $replyingTo',
                              style: const TextStyle(
                                color: kcGrey,
                                fontSize: 12.0,
                              ),
                            ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          if (messageToReply != null)
                            AppText.body(
                              messageToReply!.replaceAll("\n", " "),
                              limit: 45,
                              style: const TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                        ],
                      ),
                      GestureDetector(
                        onTap: onPressedCancelReply,
                        behavior: HitTestBehavior.opaque,
                        child: const Icon(
                          Icons.close_rounded,
                        ),
                      )
                    ],
                  ),
                ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _imageSelectorBuilder(context),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: _messageInputBuilder(),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  _sendBuilder(context),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _imageSelectorBuilder(final BuildContext context) {
    return GestureDetector(
      onTap: onPressedSelectImage,
      behavior: HitTestBehavior.opaque,
      child: Icon(
        Icons.image,
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }

  Widget _messageInputBuilder() {
    return TextFormField(
      minLines: 1,
      maxLines: 5,
      focusNode: focusNode,
      controller: messageController,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      textCapitalization: TextCapitalization.sentences,
      onChanged: onChanged,
      decoration: const InputDecoration(
        hintText: 'Type something awesome...',
        border: InputBorder.none,
      ),
    );
  }

  Widget _sendBuilder(final BuildContext context) {
    return GestureDetector(
      onTap: () => onPressedSend?.call(),
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 2.0),
          child: Transform.rotate(
            angle: -pi / 2,
            child: const Icon(
              Icons.send,
              color: kcWhite,
              size: 15.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _selectedImageBuilder() {
    return SizedBox(
      height: pictures.isNotEmpty ? 130.0 : 0.0,
      child: ListView.builder(
        itemCount: pictures.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final picture = pictures[index];

          return Container(
            width: 80.0,
            margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 15.0),
            decoration: BoxDecoration(
              color: kcLightGrey,
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
              image: DecorationImage(
                image: FileImage(File(picture.path)),
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.all(5.0),
            child: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => onPressedRemoveImage?.call(picture),
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: const BoxDecoration(
                    color: kcWhite,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.delete,
                    color: kcRed,
                    size: 15.0,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

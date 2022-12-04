import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mefn/features/shared/views/widgets/app_text.dart';
import 'package:mefn/utils/app_routes.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../shared/views/widgets/avatar_builder.dart';
import 'package:timeago/timeago.dart' as timeago;

class ChatsListItem extends StatelessWidget {
  const ChatsListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.chatConvoScreen,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 8.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _headerBuilder(),
            const SizedBox(
              height: 10.0,
            ),
            _bodyBuilder(context),
            const SizedBox(
              height: 18.0,
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }

  Widget _headerBuilder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            AvatarBuilder.image(
              "https://images.unsplash.com/photo-1503443207922-dff7d543fd0e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bWVufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
              size: 45.0,
              onPressed: () {},
            ),
            const SizedBox(
              width: 5.0,
            ),
            const AppText.body(
              'Shrijan Regmi',
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                color: kcGrey,
              ),
            ),
          ],
        ),
        AppText.body(
          timeago.format(DateTime.now()),
          style: const TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            color: kcGrey,
          ),
        ),
      ],
    );
  }

  Widget _bodyBuilder(final BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppText.heading3(
            'Hey there! Nice to meet you.',
            limit: 65,
            style: TextStyle(
              fontFamily: GoogleFonts.raleway().fontFamily,
              height: 1.5,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        _countBuilder(context, count: 10),
      ],
    );
  }

  Widget _countBuilder(
    final BuildContext context, {
    final int count = 0,
  }) {
    if (count == 0) {
      return const SizedBox();
    }
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Text(
          count > 9 ? '9+' : '$count',
          style: const TextStyle(
            fontSize: 10.0,
            color: kcWhite,
          ),
        ),
      ),
    );
  }
}

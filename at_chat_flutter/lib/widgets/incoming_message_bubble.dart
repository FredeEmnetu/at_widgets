import 'package:at_chat_flutter/models/message_model.dart';
import 'package:at_chat_flutter/utils/colors.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:at_common_flutter/at_common_flutter.dart';
import 'package:at_chat_flutter/widgets/contacts_initials.dart';
import 'package:flutter/material.dart';

class IncomingMessageBubble extends StatefulWidget {
  final Message? message;
  final Color color;
  final Color avatarColor;
  final double bubbleHeightPadding;
  final double bubbleWidthPadding;

  const IncomingMessageBubble(
      {Key? key,
      this.message,
      this.color = CustomColors.incomingMessageColor,
      this.avatarColor = CustomColors.defaultColor, 
      this.bubbleHeightPadding = 12.0,
      this.bubbleWidthPadding = 12.0})
      : super(key: key);
  @override
  _IncomingMessageBubbleState createState() => _IncomingMessageBubbleState();
}

class _IncomingMessageBubbleState extends State<IncomingMessageBubble> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 20.toWidth,
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          height: 45.toFont,
          width: 45.toFont,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(45.toWidth),
          ),
          child: ContactInitial(
            initials: widget.message?.sender ?? '@',
            backgroundColor: widget.avatarColor,
          ),
        ),
        SizedBox(
          width: 15.toWidth,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: widget.bubbleWidthPadding, vertical: widget.bubbleHeightPadding),
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(10.toWidth),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 170.toWidth),
            child: Text(
              widget.message?.message ?? ' ',
              textAlign: TextAlign.right,
              maxLines: 3,
            ),
          ),
        ),
      ],
    );
  }
}

part of "./widget.dart";

class Straightline extends StatelessWidget {
  final dynamic colorBorder;
  const Straightline({
    Key? key,
    this.colorBorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: Utility.verySmall,
        ),
        Divider(
          color: colorBorder ?? Utility.borderContainer,
          thickness: Utility.verySmall,
        ),
        SizedBox(
          height: Utility.verySmall,
        ),
      ],
    );
  }
}

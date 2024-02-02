part of "./contact.dart";

class DetailPencarianContact extends StatelessWidget {
  final ContactController controller;
  final ContactModel dataContact;
  const DetailPencarianContact({
    Key? key,
    required this.controller,
    required this.dataContact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExpandedView2Row(
            flexLeft: 30,
            flexRight: 70,
            widgetLeft: const TextLabel(text: "Fullname"),
            widgetRight: TextLabel(text: ": ${dataContact.fullname}")),
        SizedBox(
          height: Utility.medium,
        ),
        ExpandedView2Row(
            flexLeft: 30,
            flexRight: 70,
            widgetLeft: const TextLabel(text: "Email"),
            widgetRight: TextLabel(text: ": ${dataContact.email}")),
        SizedBox(
          height: Utility.medium,
        ),
        ExpandedView2Row(
            flexLeft: 30,
            flexRight: 70,
            widgetLeft: const TextLabel(text: "Phone"),
            widgetRight: TextLabel(text: ": ${dataContact.phoneNumber}")),
        SizedBox(
          height: Utility.medium,
        ),
        ExpandedView2Row(
            flexLeft: 30,
            flexRight: 70,
            widgetLeft: const TextLabel(text: "Status"),
            widgetRight: TextLabel(text: ": ${dataContact.status}")),
        SizedBox(
          height: Utility.medium,
        ),
      ],
    );
  }
}

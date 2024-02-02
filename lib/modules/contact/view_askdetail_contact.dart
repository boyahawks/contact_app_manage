part of "./contact.dart";

class AskDetailContact extends StatelessWidget {
  final ContactController controller;
  final ContactModel dataContact;
  const AskDetailContact({
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
          flexLeft: 50,
          flexRight: 50,
          widgetLeft: Padding(
            padding: EdgeInsets.only(right: Utility.verySmall),
            child: Button1(
                colorBtn: Colors.red,
                contentButton: Center(
                  child: TextLabel(
                    text: "Hapus",
                    color: Utility.baseColor1,
                  ),
                ),
                onTap: () {
                  ButtonSheetWidget().validasiButtomSheet(
                      "Hapus data",
                      TextLabel(
                          text: "Apakah kamu yakin hapus data ?",
                          color: Utility.baseColor3),
                      "Hapus",
                      () => controller.deleteData(dataContact));
                }),
          ),
          widgetRight: Button1(
              colorBtn: Colors.green,
              contentButton: Center(
                child: TextLabel(
                  text: "Edit",
                  color: Utility.baseColor1,
                ),
              ),
              onTap: () =>
                  controller.validasiEditData(dataContact, controller)),
        ),
        SizedBox(
          height: Utility.medium,
        ),
        Button1(
            colorBtn: dataContact.status == "Active"
                ? Utility.borderContainer
                : Utility.baseColor3,
            contentButton: Center(
              child: TextLabel(
                text: dataContact.status == "Active" ? "Non Active" : "Active",
                color: Utility.baseColor1,
              ),
            ),
            onTap: () => controller.updateStatusContact(dataContact,
                dataContact.status == "Active" ? "Non Active" : "Active"))
      ],
    );
  }
}

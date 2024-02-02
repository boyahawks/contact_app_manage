part of "./contact.dart";

class ContactAddView extends StatelessWidget {
  final ContactController controller;
  ContactAddView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MainScaffold(
        type: "appbar",
        styleAppbar: 4,
        appbarColorBackground: Utility.baseColor3,
        appbarColorTitle: Utility.baseColor1,
        iconRight: null,
        showIconLeft: false,
        appbarTitle: !controller.ediData.value ? "Add Contact" : "Edit Contact",
        colorBackground: Utility.baseColor1,
        colorSafeArea: Utility.baseColor1,
        returnOnWillpop: false,
        backFunction: () {
          ButtonSheetWidget().validasiButtomSheet(
              "Keluar Halaman",
              const TextLabel(text: "Apakah kamu yakin keluar halaman ini ?"),
              "Keluar",
              () => controller.keluarHalamanAdd());
        },
        content: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: GestureDetector(
            onTap: () async {
              hideKeyboard(context);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Utility.medium,
                ),
                Padding(
                  padding: EdgeInsets.all(Utility.medium),
                  child: Form(
                    key: formKey,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:
                            controller.controllersTextEditing.value.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: Utility.medium,
                              ),
                              TextLabel(
                                text: index == 0
                                    ? "Full Name"
                                    : index == 1
                                        ? "Email"
                                        : index == 2
                                            ? "Phone Number"
                                            : "",
                                color: Utility.baseColor3,
                              ),
                              SizedBox(
                                height: Utility.normal,
                              ),
                              TextFieldMain(
                                controller: controller
                                    .controllersTextEditing.value[index],
                                colorCard: Colors.transparent,
                                borderRadius: Utility.borderStyle3,
                                colorRadius: Utility.baseColor3,
                                colorRadiusFocus: Utility.baseColor3,
                                colorCursor: Utility.baseColor3,
                                keyboardType: index == 2
                                    ? TextInputType.number
                                    : TextInputType.text,
                                verticalPadContent: 20.0,
                                horizontalPadContent: 20.0,
                                colorTextField: Utility.baseColor3,
                                validator: (value) {
                                  return Validator.required(
                                      value,
                                      index == 0
                                          ? "Required Full Name"
                                          : index == 1
                                              ? "Required Email"
                                              : index == 2
                                                  ? "Required Phone Number"
                                                  : "");
                                },
                              ),
                            ],
                          );
                        }),
                  ),
                ),
                SizedBox(
                  height: Utility.medium,
                ),
                Padding(
                  padding: EdgeInsets.all(Utility.medium),
                  child: Button1(
                      colorBtn: Utility.baseColor3,
                      contentButton: Align(
                        alignment: Alignment.topCenter,
                        child: TextLabel(
                          text: !controller.ediData.value ? "Simpan" : "Edit",
                          color: Utility.baseColor1,
                        ),
                      ),
                      onTap: () => !controller.ediData.value
                          ? controller.addData()
                          : controller.aksiEditData()),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

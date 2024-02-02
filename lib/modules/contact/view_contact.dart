part of "./contact.dart";

class ContactView extends StatefulWidget {
  const ContactView({super.key});

  @override
  _ContactViewState createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  ContactController controller = Get.put(ContactController());

  @override
  void initState() {
    controller.initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        type: "appbar",
        styleAppbar: 4,
        appbarColorBackground: Utility.baseColor3,
        appbarColorTitle: Utility.baseColor1,
        iconRight: null,
        showIconLeft: false,
        appbarTitle: "Contact Application",
        colorBackground: Utility.baseColor1,
        colorSafeArea: Utility.baseColor1,
        returnOnWillpop: false,
        content: Padding(
          padding: EdgeInsets.all(Utility.medium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Utility.medium,
              ),
              TextLabel(
                text: "Phone Number",
                color: Utility.baseColor3,
              ),
              SizedBox(
                height: Utility.normal,
              ),
              Obx(() => _formPhone()),
              SizedBox(
                height: Utility.medium,
              ),
              TextLabel(
                text: "Status Contact",
                color: Utility.baseColor3,
              ),
              SizedBox(
                height: Utility.verySmall,
              ),
              Obx(() => _dropdownWidget()),
              SizedBox(
                height: Utility.medium,
              ),
              _buttonSearch(),
              SizedBox(
                height: Utility.medium,
              ),
              Flexible(child: dataTableView()),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Utility.baseColor3,
            child: Center(
              child: Icon(
                Icons.add,
                color: Utility.baseColor1,
              ),
            ),
            onPressed: () =>
                Routes.routeTo(type: "add-contact", data: [controller])));
  }

  Widget _formPhone() {
    return TextFieldMain(
      controller: controller.phoneNumber.value,
      colorCard: Colors.transparent,
      borderRadius: Utility.borderStyle3,
      colorRadius: Utility.baseColor3,
      colorRadiusFocus: Utility.baseColor3,
      colorCursor: Utility.baseColor3,
      verticalPadContent: 20.0,
      keyboardType: TextInputType.number,
      horizontalPadContent: 20.0,
      colorTextField: Utility.baseColor3,
      hintText: "Phone Number",
      validator: (value) {
        return Validator.required(value, "Required Phone Number");
      },
    );
  }

  Widget _dropdownWidget() {
    return CardCustom(
      colorBg: Utility.baseColor1,
      colorBorder: Utility.baseColor3,
      tebalBorder: 2.0,
      radiusBorder: Utility.borderStyle3,
      widgetCardCustom: Padding(
        padding: EdgeInsets.only(
            left: Utility.verySmall,
            right: Utility.verySmall,
            top: 3.0,
            bottom: 3.0),
        child: DropdownButton(
            value: controller.statusSelected.value.isNotEmpty
                ? controller.statusSelected.value
                : null,
            hint: const Text("Status"),
            isExpanded: true,
            underline: Container(), // Remove underline here
            items: DummyData.statusItems.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() => controller.statusSelected.value = newValue);
              }
            }),
      ),
    );
  }

  Widget _buttonSearch() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 120,
          child: Button1(
              colorBtn: Utility.baseColor3,
              contentButton: Align(
                alignment: Alignment.topCenter,
                child: TextLabel(
                  text: "Search",
                  color: Utility.baseColor1,
                ),
              ),
              onTap: () => controller.cariData(controller)),
        ),
      ],
    );
  }

  Widget dataTableView() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: Utility.borderStyle2,
          border: Border.all(
            color: const Color.fromARGB(255, 25, 25, 25),
            width: 1.0,
          ),
        ),
        child: DataTable(
          headingTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: Utility.baseColor2,
          ),
          columns: controller.columnTableContact.value,
          showBottomBorder: true,
          rows: controller.listRowContact,
        ),
      ),
    );
  }
}

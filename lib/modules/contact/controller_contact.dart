part of "./contact.dart";

class ContactController extends GetxController {
  var phoneNumber = TextEditingController().obs;

  Rx<List<TextEditingController>> controllersTextEditing =
      Rx<List<TextEditingController>>([]);

  Rx<List<DataColumn>> columnTableContact = Rx<List<DataColumn>>([]);
  RxList<ContactModel> listContact = <ContactModel>[].obs;
  RxList<DataRow> listRowContact = <DataRow>[].obs;
  RxList<String> listEditData = <String>[].obs;

  RxString statusSelected = "".obs;
  RxBool ediData = false.obs;

  Future<void> initData() async {
    checkData();
    controllersTextEditing.value =
        List.generate(3, (index) => TextEditingController());

    columnTableContact.value = DummyData.columnTable.map((e) {
      return DataColumn(
        label: Expanded(
          child: Text(
            e,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
    }).toList();
  }

  Future<void> checkData() async {
    listEditData.clear();
    listEditData.refresh();
    listRowContact.clear();
    listRowContact.refresh();
    ediData.value = false;
    ediData.refresh();
    listContact.value = AppData.daftarlistContact ?? [];
    listContact.refresh();
    if (listContact.isNotEmpty) {
      for (var element in listContact) {
        listRowContact.add(
          DataRow(
              cells: <DataCell>[
                DataCell(Text(element.fullname)),
                DataCell(Text(element.email)),
                DataCell(Text(element.phoneNumber)),
              ],
              color: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected)) {
                    return Utility.baseColor3;
                  }
                  // Set background color when not selected
                  return element.status == "Active"
                      ? Colors.transparent
                      : Utility.borderContainer;
                },
              ),
              onLongPress: () {
                ContactController controllerContact =
                    Get.find<ContactController>();
                ButtonSheetWidget().validasiButtomSheet(
                    "Detail ${element.fullname}",
                    AskDetailContact(
                      controller: controllerContact,
                      dataContact: element,
                    ),
                    "hidden",
                    () => null);
              }),
        );
      }
      listRowContact.refresh();
    }
  }

  Future<void> keluarHalamanAdd() async {
    for (var element in controllersTextEditing.value) {
      element.text = "";
    }
    controllersTextEditing.refresh();
    checkData();
    Get.back();
  }

  bool validasiForm(List<TextEditingController> controllers) {
    for (var controller in controllers) {
      if (controller.text.isEmpty) {
        return false;
      }
    }
    return true;
  }

  bool validasiRedudance(List<ContactModel> dataContact) {
    for (var element in dataContact) {
      if (element.email.toLowerCase() ==
          controllersTextEditing.value[1].text.toLowerCase()) {
        return false;
      }
    }
    return true;
  }

  void addData() {
    UtilsAlert.loadingSimpanData(context: Get.context!, text: "Simpan Data...");
    bool checkForm = validasiForm(controllersTextEditing.value);
    if (checkForm) {
      bool checkRedudance = validasiRedudance(listContact);
      if (!checkRedudance) {
        Get.back();
        UtilsAlert.showToast("Maaf email sudah tersedia");
      } else {
        listContact.add(ContactModel(
            fullname: controllersTextEditing.value[0].text,
            email: controllersTextEditing.value[1].text,
            phoneNumber: controllersTextEditing.value[2].text,
            status: "Active"));
        AppData.daftarlistContact = listContact;
        Routes.routeOff(type: "contact");
      }
    } else {
      Get.back();
      UtilsAlert.showToast("Harap lengkapi form terlebih dahulu");
    }
  }

  void validasiEditData(
      ContactModel dataContact, ContactController controller) {
    listEditData.value = [
      dataContact.fullname,
      dataContact.email,
      dataContact.phoneNumber
    ];
    listEditData.refresh();
    controllersTextEditing.value[0].text = dataContact.fullname;
    controllersTextEditing.value[1].text = dataContact.email;
    controllersTextEditing.value[2].text = dataContact.phoneNumber;
    ediData.value = true;
    ediData.refresh();
    Routes.routeTo(type: "add-contact", data: [controller]);
  }

  void aksiEditData() {
    UtilsAlert.loadingSimpanData(context: Get.context!, text: "Edit Data...");
    ContactModel? data = listContact
        .firstWhereOrNull((element) => element.email == listEditData[1]);
    if (data != null) {
      data.fullname = controllersTextEditing.value[0].text;
      data.email = controllersTextEditing.value[1].text;
      data.phoneNumber = controllersTextEditing.value[2].text;
      listContact.refresh();
      AppData.daftarlistContact = listContact;
      Routes.routeOff(type: "contact");
    } else {
      UtilsAlert.showToast("Gagal edit data");
      Get.back();
      Routes.routeOff(type: "contact");
    }
  }

  void deleteData(ContactModel dataContact) {
    listContact.removeWhere((element) => element.email == dataContact.email);
    listContact.refresh();
    AppData.daftarlistContact = listContact;
    Routes.routeOff(type: "contact");
  }

  void updateStatusContact(ContactModel dataContact, String statusUpdate) {
    ContactModel? data = listContact
        .firstWhereOrNull((element) => element.email == dataContact.email);
    if (data != null) {
      data.status = statusUpdate;
    }
    listContact.refresh();
    AppData.daftarlistContact = listContact;
    Routes.routeOff(type: "contact");
  }

  void cariData(ContactController controller) {
    ContactModel? data = listContact.firstWhereOrNull((element) =>
        element.phoneNumber == phoneNumber.value.text &&
        element.status == statusSelected.value);

    if (data != null) {
      ButtonSheetWidget().validasiButtomSheet(
          "Detail Pencarian",
          DetailPencarianContact(controller: controller, dataContact: data),
          "hidden",
          () => null);
    } else {
      UtilsAlert.showToast("Data tidak ditemukan");
    }
  }
}

import 'dart:convert';

import 'package:next_contact_app/helper/local_storage.dart';
import 'package:next_contact_app/modules/contact/contact.dart';

class AppData {
  // BOOL

  // static set statusAbsensi(bool value) =>
  //     LocalStorage.saveToDisk('statusAbsensi', value);

  // static bool get statusAbsensi {
  //   if (LocalStorage.getFromDisk('statusAbsensi') != null) {
  //     return LocalStorage.getFromDisk('statusAbsensi');
  //   }
  //   return false;
  // }

  // STRING

  static set role(String value) => LocalStorage.saveToDisk('role', value);

  static String get role {
    if (LocalStorage.getFromDisk('role') != null) {
      return LocalStorage.getFromDisk('role');
    }
    return "";
  }

  // LIST

  static set daftarlistContact(List<ContactModel>? value) {
    if (value != null) {
      List<String> listString = value.map((e) => e.toJson()).toList();
      LocalStorage.saveToDisk('daftarlistContact', listString);
    } else {
      LocalStorage.saveToDisk('daftarlistContact', null);
    }
  }

  static List<ContactModel>? get daftarlistContact {
    if (LocalStorage.getFromDisk('daftarlistContact') != null) {
      List<String> listData = LocalStorage.getFromDisk('daftarlistContact');
      return listData.map((e) => ContactModel.fromMap(jsonDecode(e))).toList();
    }
    return null;
  }

  // CLEAR ALL DATA

  static void clearAllData() =>
      LocalStorage.removeFromDisk(null, clearAll: true);
}

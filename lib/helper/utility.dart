import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:next_contact_app/helper/app_data.dart';

class Utility {
  // COLOR
  static Color baseColor1 = const Color(0xFFFFFFFF);
  static Color baseColor2 = const Color.fromARGB(255, 0, 0, 0);
  static Color baseColor3 = const Color(0xFF203A70);
  static Color baseColor4 = const Color(0xFF0087CC);
  static Color baseColor5 = const Color(0xFF04A1F1);
  static Color baseColor6 = const Color(0xFFECF6FF);
  static Color baseColor7 = const Color(0xFF8A909E);
  static Color baseColor8 = const Color(0xFFAFE0F9);
  static Color backgroundSecond = const Color(0xFFF7F7F7);
  static Color borderColorShape = const Color(0xFFDADADA);

  static Color borderContainer = const Color(0xFFE5E5E5);
  static Color shadowColor =
      const Color.fromARGB(255, 190, 190, 190).withOpacity(0.3);

  // SIZE
  static double verySmall = 8.0;
  static double small = 10.0;
  static double normal = 12.0;
  static double semiMedium = 14.0;
  static double medium = 16.0;
  static double large = 20.0;
  static double extraLarge = 24.0;

  // BORDER RADIUS
  static BorderRadius borderStyle1 = const BorderRadius.all(Radius.circular(6));
  static BorderRadius borderStyle2 = const BorderRadius.all(Radius.circular(8));
  static BorderRadius borderStyle3 =
      const BorderRadius.all(Radius.circular(10));
  static BorderRadius borderStyle4 =
      const BorderRadius.all(Radius.circular(16));
  static BorderRadius borderStyle5 =
      const BorderRadius.all(Radius.circular(24));
  static BorderRadius borderStyle6 =
      const BorderRadius.all(Radius.circular(30));

  // CONVERT DATE

  static DateTime onlyDate() {
    final DateTime now = DateTime.now();
    final DateTime date = DateTime(now.year, now.month, now.day);
    return date;
  }

  static String dateAndFullTimeView(DateTime date) {
    final String outputDate = DateFormat('dd MMMM yyyy HH:mm').format(date);
    return outputDate;
  }

  static String dateAndTimeView(DateTime date) {
    final String outputDate = DateFormat('dd MMM yyyy HH:mm a').format(date);
    return outputDate;
  }

  static String dateAndTimeUpload(DateTime date) {
    final String outputDate = DateFormat('yyyy-MM-ddTHH:mm:ss').format(date);
    return outputDate;
  }

  static String dateUpload(DateTime date) {
    final String outputDate = DateFormat('yyyy-MM-dd').format(date);
    return outputDate;
  }

  static String dateView(DateTime date) {
    final String outputDate = DateFormat("dd MMMM yyyy").format(date);
    return outputDate;
  }

  static String dateViewDefault(DateTime date) {
    final String outputDate = DateFormat("dd-MM-yyyy").format(date);
    return outputDate;
  }

  static String timeView(DateTime date) {
    final String outputDate = DateFormat('HH:mm').format(date);
    return outputDate;
  }

  static String currencyFormat(double qtyDouble) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: '',
      decimalDigits: 0,
    );

    final String hasilFinal = currencyFormatter.format(qtyDouble);
    return hasilFinal;
  }

  static String currencyFormatInt(int qty) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: '',
      decimalDigits: 0,
    );

    final String hasilFinal = currencyFormatter.format(qty);
    return hasilFinal;
  }

  static TimeOfDay stringToTimeOfDay(String timeString) {
    List<String> timeParts = timeString.split(":");
    int hour = int.parse(timeParts[0]);
    int minute = int.parse(timeParts[1]);

    return TimeOfDay(hour: hour, minute: minute);
  }

  static String timeOfDayToString(TimeOfDay timeOfDay) {
    String hour = timeOfDay.hour.toString().padLeft(2, '0');
    String minute = timeOfDay.minute.toString().padLeft(2, '0');
    // String period = timeOfDay.period == DayPeriod.am ? 'AM' : 'PM';

    return "$hour:$minute";
  }

  // static String setLanguage({required String en, required String ina}) {
  //   String result = "";
  //   String settingLanguageUser = AppData.selectedLanguage;
  //   if (settingLanguageUser == "ina") {
  //     result = ina;
  //   } else {
  //     result = en;
  //   }
  //   return result;
  // }

  // SETTING

  static String hariIndo(String hari) {
    if (hari == "Monday") {
      hari = "Senin";
    } else if (hari == "Tuesday") {
      hari = "Selasa";
    } else if (hari == "Wednesday") {
      hari = "Rabu";
    } else if (hari == "Thursday") {
      hari = "Kamis";
    } else if (hari == "Friday") {
      hari = "Jumat";
    } else if (hari == "Saturday") {
      hari = "Sabtu";
    } else if (hari == "Sunday") {
      hari = "Minggu";
    } else {
      hari = hari;
    }
    return hari;
  }
}

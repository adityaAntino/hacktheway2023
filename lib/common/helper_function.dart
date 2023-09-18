import 'dart:async';

import 'package:intl/intl.dart';

class HelperFunction {
  String parseAndFormatDateTime(String inputString) {
    try {
      // Define the input format for the given string
      final inputFormat = DateFormat("dd-MM-yyyy'T'HH:mm:ss'Z'");

      // Parse the input string into a DateTime object
      final dateTime = inputFormat.parse(inputString);

      // Define the output format as dd/MM/yy h:mm:a
      final outputFormat = DateFormat("d MMMM yyyy, h:mm a");

      // Format the DateTime object as per the output format
      final formattedDateTime = outputFormat.format(dateTime.toLocal());

      return formattedDateTime;
    } catch (e) {
      print("Error parsing or formatting the date: $e");
      return ''; // Handle the error as needed
    }
  }

  String formatDateddMMyyyyy(String dateString) {
    final inputFormat = DateFormat("yyyy-MM-dd' 'HH:mm:ss.SSS'Z'");
    final outputFormat = DateFormat("d MMMM yyyy");
    final date = inputFormat.parse(dateString, true);
    return outputFormat.format(date);
  }

  static String calculateGST(
      {String? amount, bool? isTotalAmount, double? tax}) {
    if (tax != null && amount != null) {
      double amountInDouble = double.tryParse(amount) ?? 0.0;
      if (isTotalAmount == true) {
        double totalAmountWithGST =
            (((18 / 100) * amountInDouble) + amountInDouble);
        return NumberFormat('##,##,###.##').format(totalAmountWithGST);
      }
      return NumberFormat('##,##,###.##').format(((18 / 100) * amountInDouble));
    }
    return '0';
  }
}

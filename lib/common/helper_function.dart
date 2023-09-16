import 'package:intl/intl.dart';

class HelperFunction{
  String parseAndFormatDateTime(String inputString) {
    try {
      // Define the input format for the given string
      final inputFormat = DateFormat("dd-MM-yyyy'T'HH:mm:ss'Z'");

      // Parse the input string into a DateTime object
      final dateTime = inputFormat.parse(inputString);

      // Define the output format as dd/MM/yy h:mm:a
      final outputFormat = DateFormat("dd/MM/yy h:mm:a");

      // Format the DateTime object as per the output format
      final formattedDateTime = outputFormat.format(dateTime.toLocal());

      return formattedDateTime;
    } catch (e) {
      print("Error parsing or formatting the date: $e");
      return ''; // Handle the error as needed
    }
  }
}
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class AppConstants {
  static const List<DropDownValueModel> governorates = [
    DropDownValueModel(name: 'Cairo', value: 'Cairo'),
    DropDownValueModel(name: 'Alexandria', value: 'Alexandria'),
    DropDownValueModel(name: 'Giza', value: 'Giza'),
    DropDownValueModel(name: 'Dakahlia', value: 'Dakahlia'),
    DropDownValueModel(name: 'Red Sea', value: 'Red Sea'),
    DropDownValueModel(name: 'Beheira', value: 'Beheira'),
    DropDownValueModel(name: 'Fayoum', value: 'Fayoum'),
    DropDownValueModel(name: 'Gharbiya', value: 'Gharbiya'),
    DropDownValueModel(name: 'Gharbiya', value: 'Ismailia'),
    DropDownValueModel(name: 'Menofia', value: 'Menofia'),
    DropDownValueModel(name: 'Minya', value: 'Minya'),
    DropDownValueModel(name: 'Qaliubiya', value: 'Qaliubiya'),
    DropDownValueModel(name: 'New Valley', value: 'New Valley'),
    DropDownValueModel(name: 'Suez', value: 'Suez'),
    DropDownValueModel(name: 'Aswan', value: 'Aswan'),
    DropDownValueModel(name: 'Assiut', value: 'Assiut'),
    DropDownValueModel(name: 'Beni Suef', value: 'Beni Suef'),
    DropDownValueModel(name: 'Port Said', value: 'Port Said'),
    DropDownValueModel(name: 'Damietta', value: 'Damietta'),
    DropDownValueModel(name: 'Sharkia', value: 'Sharkia'),
    DropDownValueModel(name: 'South Sinai', value: 'South Sinai'),
    DropDownValueModel(name: 'Kafr Al sheikh', value: 'Kafr Al sheikh'),
    DropDownValueModel(name: 'Matrouh', value: 'Matrouh'),
    DropDownValueModel(name: 'Luxor', value: 'Luxor'),
    DropDownValueModel(name: 'Qena', value: 'Qena'),
    DropDownValueModel(name: 'North Sinai', value: 'North Sinai'),
    DropDownValueModel(name: 'Sohag', value: 'Sohag'),
  ];
}

Future<bool> checkInternetConnection() async {
  bool result = await InternetConnectionChecker.instance.hasConnection;
  return result;
}

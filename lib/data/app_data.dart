class AppData {
  // Singleton (one instance for whole app)
  static final AppData instance = AppData._internal();

  AppData._internal();

  String email = 'user@example.com';
  String password = '';
  // Address Info
  String street = '';
  String city = '';
  String state = '';
  String zip = '';

  // Helper: check if address exists
  bool get hasAddress {
    return street.isNotEmpty &&
        city.isNotEmpty &&
        state.isNotEmpty &&
        zip.isNotEmpty;
  }
}

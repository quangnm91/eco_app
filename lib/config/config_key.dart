class ConfigKey {
  static String appName = "APP_NAME";
  static String apiUrl = "API_URL";

  static final ConfigKey instance = ConfigKey._();
  factory ConfigKey() {
    return instance;
  }

  ConfigKey._();
}

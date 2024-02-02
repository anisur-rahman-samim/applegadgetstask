class Urls {
  static const baseUrl = 'https://peanut.ifxdb.com/api';
  static const login =
      "$baseUrl/ClientCabinetBasic/IsAccountCredentialsCorrect";
  static const trades = '$baseUrl/ClientCabinetBasic/GetOpenTrades';
  static const profile = '$baseUrl/ClientCabinetBasic/GetAccountInformation';
  static const lastFourDigits =
      '$baseUrl/ClientCabinetBasic/GetLastFourNumbersPhone';
}

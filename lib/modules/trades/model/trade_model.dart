class TradeModel {
  double? currentPrice;
  dynamic comment;
  int? digits;
  int? login;
  double? openPrice;
  String? openTime;
  double? profit;
  double? sl;
  double? swaps;
  String? symbol;
  double? tp;
  int? ticket;
  int? type;
  double? volume;

  TradeModel(
      {this.currentPrice,
      this.comment,
      this.digits,
      this.login,
      this.openPrice,
      this.openTime,
      this.profit,
      this.sl,
      this.swaps,
      this.symbol,
      this.tp,
      this.ticket,
      this.type,
      this.volume});

  TradeModel.fromJson(Map<String, dynamic> json) {
    currentPrice = json['currentPrice'];
    comment = json['comment'];
    digits = json['digits'];
    login = json['login'];
    openPrice = json['openPrice'];
    openTime = json['openTime'];
    profit = json['profit'];
    sl = json['sl'];
    swaps = json['swaps'];
    symbol = json['symbol'];
    tp = json['tp'];
    ticket = json['ticket'];
    type = json['type'];
    volume = json['volume'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPrice'] = currentPrice;
    data['comment'] = comment;
    data['digits'] = digits;
    data['login'] = login;
    data['openPrice'] = openPrice;
    data['openTime'] = openTime;
    data['profit'] = profit;
    data['sl'] = sl;
    data['swaps'] = swaps;
    data['symbol'] = symbol;
    data['tp'] = tp;
    data['ticket'] = ticket;
    data['type'] = type;
    data['volume'] = volume;
    return data;
  }
}

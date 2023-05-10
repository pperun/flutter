class PurchaseInfo {
  final List<int> seats;
  final int sessionId;
  final String email;
  final String cardNumber;
  final String expirationDate;
  final String cvv;

  PurchaseInfo(this.seats, this.sessionId, this.email, this.cardNumber, this.expirationDate, this.cvv);

  Map<String, dynamic> toJson() => {
    'seats': seats,
    'sessionId': sessionId,
    'email': email,
    'cardNumber': cardNumber,
    'expirationDate': expirationDate,
    'cvv': cvv,
  }; 
  
}
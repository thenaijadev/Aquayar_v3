class CardModel {
  CardModel(
      {required this.cardNumber,
      required this.holderName,
      required this.expiryDate,
      required this.cvv});
  final String cardNumber;
  final String holderName;
  final String expiryDate;
  final String cvv;
}

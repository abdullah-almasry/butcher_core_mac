import 'package:butcher_core/butcher_core.dart';

class PaymentModel extends Equatable {
  final String id;
  final String accountName;
  final String accountNumber;
  final String ibanNumber;
  final String bankName;
  final String img;
  final Timestamp createdAt;
  final Timestamp updatedAt;


  const PaymentModel({
    required this.id,
    required this.accountName,
    required this.accountNumber,
    required this.ibanNumber,
    required this.bankName,
    required this.img,
    required this.createdAt,
    required this.updatedAt,
  });

  PaymentModel copyWith({
     String? id,
     String? accountName,
     String? accountNumber,
     String? ibanNumber,
     String? bankName,
     String? img,
     Timestamp? createdAt,
     Timestamp? updatedAt,
  }) {
    if ((id == null || identical(id, this.id)) &&
        (accountName == null || identical(accountName, this.accountName)) &&
        (accountNumber == null ||
            identical(accountNumber, this.accountNumber)) &&
        (ibanNumber == null || identical(ibanNumber, this.ibanNumber)) &&
        (bankName == null || identical(bankName, this.bankName)) &&
        (img == null || identical(img, this.img)) &&
        (createdAt == null || identical(createdAt, this.createdAt)) &&
        (updatedAt == null || identical(updatedAt, this.updatedAt))) {
      return this;
    }

    return PaymentModel(
      id: id ?? this.id,
      accountName: accountName ?? this.accountName,
      accountNumber: accountNumber ?? this.accountNumber,
      ibanNumber: ibanNumber ?? this.ibanNumber,
      bankName: bankName ?? this.bankName,
      img: img ?? this.img,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() {
    return 'PaymentModel{id: $id, accountName: $accountName, accountNumber: $accountNumber, ibanNumber: $ibanNumber, bankName: $bankName, img: $img, createdAt: $createdAt, updatedAt: $updatedAt}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PaymentModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          accountName == other.accountName &&
          accountNumber == other.accountNumber &&
          ibanNumber == other.ibanNumber &&
          bankName == other.bankName &&
          img == other.img &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt);

  @override
  int get hashCode =>
      id.hashCode ^
      accountName.hashCode ^
      accountNumber.hashCode ^
      ibanNumber.hashCode ^
      bankName.hashCode ^
      img.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;

  factory PaymentModel.fromMap(Map<String, dynamic> map) {
    return PaymentModel(
      id: map['id'] as String,
      accountName: map['accountName'] as String,
      accountNumber: map['accountNumber'] as String,
      ibanNumber: map['ibanNumber'] as String,
      bankName: map['bankName'] as String,
      img: map['img'] as String,
      createdAt: map['createdAt'] as Timestamp,
      updatedAt: map['updatedAt'] as Timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'accountName': this.accountName,
      'accountNumber': this.accountNumber,
      'ibanNumber': this.ibanNumber,
      'bankName': this.bankName,
      'img': this.img,
      'createdAt': this.createdAt,
      'updatedAt': this.updatedAt,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        accountName,
        accountNumber,
        ibanNumber,
        bankName,
        img,
        createdAt,
        updatedAt
      ];
}

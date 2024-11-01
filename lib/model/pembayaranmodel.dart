import 'dart:convert';

import 'package:flutter/widgets.dart';

class PembayaranModel {
  String? pembayaranId;
  String? hutangId;
  String? piutangId;
  String? uId;
  final String nominalBayar;
  final String tanggalBayar;
  bool isConfirmed;
  PembayaranModel({
    this.pembayaranId,
    this.hutangId,
    this.piutangId,
    this.uId,
    required this.nominalBayar,
    required this.tanggalBayar,
    this.isConfirmed = false,
  });

  PembayaranModel copyWith({
    ValueGetter<String?>? pembayaranId,
    ValueGetter<String?>? hutangId,
    ValueGetter<String?>? piutangId,
    ValueGetter<String?>? uId,
    String? nominalBayar,
    String? tanggalBayar,
    bool? isConfirmed,
  }) {
    return PembayaranModel(
      pembayaranId: pembayaranId != null ? pembayaranId() : this.pembayaranId,
      hutangId: hutangId != null ? hutangId() : this.hutangId,
      piutangId: piutangId != null ? piutangId() : this.piutangId,
      uId: uId != null ? uId() : this.uId,
      nominalBayar: nominalBayar ?? this.nominalBayar,
      tanggalBayar: tanggalBayar ?? this.tanggalBayar,
      isConfirmed: isConfirmed ?? this.isConfirmed,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'pembayaranId': pembayaranId,
      'hutangId': hutangId,
      'piutangId': piutangId,
      'uId': uId,
      'nominalBayar': nominalBayar,
      'tanggalBayar': tanggalBayar,
      'isConfirmed': isConfirmed,
    };
  }

  factory PembayaranModel.fromMap(Map<String, dynamic> map) {
    return PembayaranModel(
      pembayaranId: map['pembayaranId'],
      hutangId: map['hutangId'],
      piutangId: map['piutangId'],
      uId: map['uId'],
      nominalBayar: map['nominalBayar'] ?? '',
      tanggalBayar: map['tanggalBayar'] ?? '',
      isConfirmed: map['isConfirmed'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory PembayaranModel.fromJson(String source) =>
      PembayaranModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PembayaranModel(pembayaranId: $pembayaranId, hutangId: $hutangId, piutangId: $piutangId, uId: $uId, nominalBayar: $nominalBayar, tanggalBayar: $tanggalBayar, isConfirmed: $isConfirmed)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PembayaranModel &&
        other.pembayaranId == pembayaranId &&
        other.hutangId == hutangId &&
        other.piutangId == piutangId &&
        other.uId == uId &&
        other.nominalBayar == nominalBayar &&
        other.tanggalBayar == tanggalBayar &&
        other.isConfirmed == isConfirmed;
  }

  @override
  int get hashCode {
    return pembayaranId.hashCode ^
        hutangId.hashCode ^
        piutangId.hashCode ^
        uId.hashCode ^
        nominalBayar.hashCode ^
        tanggalBayar.hashCode ^
        isConfirmed.hashCode;
  }
}

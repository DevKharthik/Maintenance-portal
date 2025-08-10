import 'package:flutter/material.dart';

class MaintenanceNotification {
  final String qmnum;
  final String iwerk;
  final String iloAn;
  final String equnr;
  final String ingrp;
  final String ausvn;
  final String qmart;
  final String auszt;
  final String artyp;
  final String qmtxt;
  final String prioK;
  final String arbplwerk;
  final String status;

  MaintenanceNotification({
    required this.qmnum,
    required this.iwerk,
    required this.iloAn,
    required this.equnr,
    required this.ingrp,
    required this.ausvn,
    required this.qmart,
    required this.auszt,
    required this.artyp,
    required this.qmtxt,
    required this.prioK,
    required this.arbplwerk,
    required this.status,
  });

  factory MaintenanceNotification.fromJson(Map<String, dynamic> json) {
    return MaintenanceNotification(
      qmnum: json['Qmnum'] ?? '',
      iwerk: json['Iwerk'] ?? '',
      iloAn: json['IloAn'] ?? '',
      equnr: json['Equnr'] ?? '',
      ingrp: json['Ingrp'] ?? '',
      ausvn: json['Ausvn'] ?? '',
      qmart: json['Qmart'] ?? '',
      auszt: json['Auszt'] ?? '',
      artyp: json['Artyp'] ?? '',
      qmtxt: json['Qmtxt'] ?? '',
      prioK: json['Priok'] ?? json['PrioK'] ?? '',
      arbplwerk: json['Arbplwerk'] ?? '',
      status: json['Status'] ?? '',
    );
  }

  String get priorityText {
    switch (prioK) {
      case '1':
        return 'Very high';
      case '2':
        return 'High';
      case '3':
        return 'Medium';
      case '4':
        return 'Low';
      case '':
        return 'Not set';
      default:
        return 'Not set';
    }
  }

  Color get priorityColor {
    switch (prioK) {
      case '1':
        return Colors.red;
      case '2':
        return Colors.orange;
      case '3':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  String get formattedStartDate {
    // SAP date format: /Date(1749513600000)/
    final regex = RegExp(r"/Date\((\d+)\)/");
    final match = regex.firstMatch(ausvn);
    if (match != null) {
      final millis = int.tryParse(match.group(1) ?? '');
      if (millis != null) {
        final date = DateTime.fromMillisecondsSinceEpoch(millis);
        // Format as yyyy-MM-dd
        return "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
      }
    }
    return '';
  }
} 
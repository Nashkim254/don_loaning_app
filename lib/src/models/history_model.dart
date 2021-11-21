// To parse this JSON data, do
//
//     final history = historyFromJson(jsonString);

import 'dart:convert';

List<History> historyFromJson(String str) => List<History>.from(json.decode(str).map((x) => History.fromJson(x)));

String historyToJson(List<History> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class History {
    History({
        this.id,
        this.amount,
        this.requestDate,
        this.expectedPayDay,
        this.filledForm,
        this.loanNumber,
        this.released,
        this.declined,
        this.settledAmount,
        this.userDeleted,
        this.cleared,
        this.repaid,
        this.user,
    });

    int? id;
    int? amount;
    DateTime? requestDate;
    DateTime? expectedPayDay;
    String? filledForm;
    String? loanNumber;
    bool? released;
    bool? declined;
    int? settledAmount;
    bool? userDeleted;
    bool? cleared;
    bool? repaid;
    int? user;

    factory History.fromJson(Map<String, dynamic> json) => History(
        id: json["id"],
        amount: json["amount"],
        requestDate: DateTime.parse(json["request_date"]),
        expectedPayDay: DateTime.parse(json["expected_pay_day"]),
        filledForm: json["filled_form"],
        loanNumber: json["loan_number"],
        released: json["released"],
        declined: json["declined"],
        settledAmount: json["settled_amount"],
        userDeleted: json["user_deleted"],
        cleared: json["cleared"],
        repaid: json["repaid"],
        user: json["user"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "request_date": requestDate!.toIso8601String(),
        "expected_pay_day": "${expectedPayDay!.year.toString().padLeft(4, '0')}-${expectedPayDay!.month.toString().padLeft(2, '0')}-${expectedPayDay!.day.toString().padLeft(2, '0')}",
        "filled_form": filledForm,
        "loan_number": loanNumber,
        "released": released,
        "declined": declined,
        "settled_amount": settledAmount,
        "user_deleted": userDeleted,
        "cleared": cleared,
        "repaid": repaid,
        "user": user,
    };
}

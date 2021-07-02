class Loans {
  final int borrower_id;
  final int interest;
  final int loan_id;
  final int principal;
  final int saving;
  final int total;
  final int colorVal;

  Loans(this.borrower_id, this.interest, this.loan_id, this.principal,
      this.saving, this.total, this.colorVal);

  Loans.fromMap(Map<String, dynamic> map)
      : assert(map['borrower_id'] != null),
        assert(map['interest'] != null),
        assert(map['loan_id'] != null),
        assert(map['principal'] != null),
        assert(map['saving'] != null),
        assert(map['total'] != null),
        assert(map['colorVal'] != null),
        borrower_id = map['borrower_id'],
        interest = map['interest'],
        loan_id = map['loan_id'],
        principal = map['principal'],
        saving = map['saving'],
        total = map['total'],
        colorVal = map['colorVal'];

  @override
  String toString() => "Total loan record:$borrower_id:$total";
}

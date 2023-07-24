class Grade {
  final String name;
  final double degree;
  final double credit;

  Grade(this.name, this.degree, this.credit);

  @override
  String toString() {
    return '$name, $degree, $credit';
  }
}

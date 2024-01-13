enum ReportStatus {
  hot(0, 'Hot'),
  blocked(1, 'Blocked'),
  noAnswer(2, 'No Answer');

  const ReportStatus(this.number, this.value);

  final int number;
  final String value;
}

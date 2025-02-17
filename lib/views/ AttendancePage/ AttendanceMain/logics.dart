void main() {
  String? cheackinDate = "2025-02-14T03:29:07.000Z";
  String? chaeckOutDate = '2022-04-17T11:30:00.000Z';

  DateTime newCheckInTime = DateTime.parse(cheackinDate).toUtc();
  print(newCheckInTime);
}

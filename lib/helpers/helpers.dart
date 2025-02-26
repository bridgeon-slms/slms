String getMonthName(int month) {
  const monthNames = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];
  return monthNames[month - 1];
}

//helpers function for date format
String formatDate(DateTime date) {
  try {
    return "${date.day.toString().padLeft(2, '0')} "
           "${getMonthName(date.month)} "
           "${date.year}";
  } catch (e) {
    return 'Invalid Date';
  }
}




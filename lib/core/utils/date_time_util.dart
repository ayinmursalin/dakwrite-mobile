import 'package:intl/intl.dart';

class DateTimeUtil {
  static const formatFull = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
  static const formatFullDate = "EEEE, dd MMMM yyyy";
  static const formatSimple = "dd MMM yyyy";
  static const formatSimpleFull = "dd MMMM yyyy";
  static const formatSimpleFullWithTime = "dd MMMM yyyy, HH:mm";
  static const formatSimpleWithTime = "dd MMM yyyy, HH:mm";
  static const formatFullDateTime = "EEEE, dd MMMM yyyy, HH:mm";
  static const formatTimeOnly = "HH:mm";
  static const formatDbDate = "yyyy-MM-dd";
  static const formatDayOnly = "EEEE";

  static const locale = 'id_ID';

  static String translateDateTime(
    String? dateTime, {
    String? fromFormat,
    String toFormat = formatSimple,
    bool toLocalTimeZone = true,
  }) {
    if (dateTime == null || dateTime.isEmpty) return '';

    try {
      var dt = dateParse(dateTime, fromFormat: fromFormat);
      if (toLocalTimeZone) {
        dt = dt.toLocal();
      }

      return DateFormat(toFormat, locale).format(dt);
    } on FormatException catch (_) {
      return dateTime;
    }
  }

  static String translateRangeDateTime(
    String startTime,
    String endTime, {
    String toFormatStart = formatSimple,
    String toFormatEnd = formatSimple,
    bool toLocalTimeZone = true,
  }) {
    try {
      var dtStart = DateTime.parse(startTime);
      var dtEnd = DateTime.parse(endTime);

      if (toLocalTimeZone) {
        dtStart = dtStart.toLocal();
        dtEnd = dtEnd.toLocal();
      }

      var start = DateFormat(toFormatStart, locale).format(dtStart);
      var end = DateFormat(toFormatEnd, locale).format(dtEnd);

      return '$start - $end';
    } on FormatException catch (_) {
      return '$startTime - $endTime';
    }
  }

  static String dateFormat(
    DateTime? dateTime, {
    String toFormat = formatSimple,
  }) {
    if (dateTime == null) return '';

    try {
      return DateFormat(toFormat, locale).format(dateTime);
    } on FormatException catch (_) {
      return '';
    }
  }

  static DateTime dateParse(
    String dateTime, {
    String? fromFormat,
  }) {
    if (fromFormat != null) {
      try {
        return DateFormat(fromFormat, locale).parse(dateTime);
      } on FormatException {
        return DateTime.now();
      }
    }

    return DateTime.tryParse(dateTime) ??
        DateTime.fromMillisecondsSinceEpoch(0);
  }

  static bool isSameDate(
    DateTime? first,
    DateTime? second,
  ) {
    return first?.year == second?.year &&
        first?.month == second?.month &&
        first?.day == second?.day;
  }

  static bool isSameDateStr(
    String? first,
    String? second,
  ) {
    if (first == null || second == null) return false;

    var firstDate = dateParse(first);
    var secondDate = dateParse(second);

    return firstDate.year == secondDate.year &&
        firstDate.month == secondDate.month &&
        firstDate.day == secondDate.day;
  }

  static String timeZoneName(String dateTime) {
    switch (DateTime.now().timeZoneName) {
      case '+07':
        return 'WIB';
      case '+08':
        return 'WITA';
      case '+09':
        return 'WIT';
      default:
        return DateTime.now().timeZoneName;
    }
  }

  static int timeZoneHour() {
    return DateTime.now().timeZoneOffset.inHours;
  }
}

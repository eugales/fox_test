import 'package:date_picker_timeline/date_widget.dart';
import 'package:date_picker_timeline/extra/assets.dart';
import 'package:date_picker_timeline/extra/color.dart';
import 'package:date_picker_timeline/extra/style.dart';
import 'package:date_picker_timeline/gestures/tap.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import "package:date_picker_timeline/extra/extensions.dart";

class DatePicker extends StatefulWidget {
  /// Start Date in case user wants to show past dates
  /// If not provided calendar will start from the initialSelectedDate
  final DateTime startDate;

  /// Width of the selector
  final double width;

  /// Height of the selector
  final double height;

  /// DatePicker Controller
  final DatePickerController? controller;

  /// Text color for the selected Date
  final Color selectedTextColor;

  /// Background color for the selector
  final Color selectionColor;

  /// Text Color for the deactivated dates
  final Color deactivatedColor;

  /// TextStyle for Month Value
  final TextStyle monthTextStyle;

  /// TextStyle for day Value
  final TextStyle dayTextStyle;

  /// TextStyle for the date Value
  final TextStyle dateTextStyle;

  /// Current Selected Date
  final DateTime? /*?*/ initialSelectedDate;

  /// Contains the list of inactive dates.
  /// All the dates defined in this List will be deactivated
  final List<DateTime>? inactiveDates;

  /// Contains the list of active dates.
  /// Only the dates in this list will be activated.
  final List<DateTime>? activeDates;

  /// Callback function for when a different date is selected
  final DateChangeListener? onDateChange;

  /// Max limit up to which the dates are shown.
  /// Days are counted from the startDate
  final int daysCount;

  /// Locale for the calendar default: en_us
  final String locale;

  final double separatorWidth;

  const DatePicker(
    this.startDate, {
    Key? key,
    this.width = 60,
    this.height = 80,
    this.controller,
    this.monthTextStyle = defaultMonthTextStyle,
    this.dayTextStyle = defaultDayTextStyle,
    this.dateTextStyle = defaultDateTextStyle,
    this.selectedTextColor = Colors.white,
    this.selectionColor = AppColors.defaultSelectionColor,
    this.deactivatedColor = AppColors.defaultDeactivatedColor,
    this.initialSelectedDate,
    this.activeDates,
    this.inactiveDates,
    this.daysCount = 500,
    this.onDateChange,
    this.locale = "en_US",
    this.separatorWidth = 6,
  }) : assert(
            activeDates == null || inactiveDates == null,
            "Can't "
            "provide both activated and deactivated dates List at the same time.");

  @override
  State<StatefulWidget> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? _currentDate;

  final ScrollController _controller = ScrollController();

  late final TextStyle selectedDateStyle;
  late final TextStyle selectedMonthStyle;
  late final TextStyle selectedDayStyle;

  late final TextStyle deactivatedDateStyle;
  late final TextStyle deactivatedMonthStyle;
  late final TextStyle deactivatedDayStyle;

  var dateOffset = 0;

  void get scrollToCurentDate => widget.controller!.jumpToSelection();

  @override
  void initState() {
    // Init the calendar locale
    initializeDateFormatting(widget.locale, null);
    // Set initial Values
    _currentDate = widget.initialSelectedDate;

    if (widget.controller != null) {
      widget.controller!.setDatePickerState(this);
    }

    selectedDateStyle =
        widget.dateTextStyle.copyWith(color: widget.selectedTextColor);
    selectedMonthStyle =
        widget.monthTextStyle.copyWith(color: widget.selectedTextColor);
    selectedDayStyle =
        widget.dayTextStyle.copyWith(color: widget.selectedTextColor);

    deactivatedDateStyle =
        widget.dateTextStyle.copyWith(color: widget.deactivatedColor);
    deactivatedMonthStyle =
        widget.monthTextStyle.copyWith(color: widget.deactivatedColor);
    deactivatedDayStyle =
        widget.dayTextStyle.copyWith(color: widget.deactivatedColor);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.controller?.jumpToDate(_currentDate!.subtract(Duration(days: 2)));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              DateFormat("MMMM", widget.locale)
                  .format(_currentDate ?? widget.startDate)
                  .capitalize(),
              style: defaultMonthTextStyle,
            ),
            const Spacer(),
            InkWell(
              borderRadius: BorderRadius.circular(32),
              onTap: () {
                if (widget.controller != null) {
                  setState(() {
                    --dateOffset;
                  });
                  widget.controller!.animateToDate(
                    _currentDate!.add(Duration(days: dateOffset)),
                  );
                }
              },
              child: Image.asset(
                AppAssets.arrowLeft,
                package: 'date_picker_timeline',
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(32),
              onTap: () {
                if (widget.controller != null) {
                  setState(() {
                    ++dateOffset;
                  });
                  widget.controller!.animateToDate(
                    _currentDate!.add(Duration(days: dateOffset)),
                  );
                }
              },
              child: Image.asset(
                AppAssets.arrowRight,
                package: 'date_picker_timeline',
              ),
            )
          ],
        ),
        const SizedBox(height: 32),
        SizedBox(
          height: widget.height,
          child: ListView.separated(
            physics: ClampingScrollPhysics(),
            itemCount: widget.daysCount,
            scrollDirection: Axis.horizontal,
            controller: _controller,
            separatorBuilder: (context, index) {
              return SizedBox(width: widget.separatorWidth);
            },
            itemBuilder: (context, index) {
              // get the date object based on the index position
              // if widget.startDate is null then use the initialDateValue
              DateTime date = widget.startDate.add(Duration(days: index));
              date = DateTime(date.year, date.month, date.day);

              bool isDeactivated = false;

              // check if this date needs to be deactivated for only DeactivatedDates
              if (widget.inactiveDates != null) {
//            print("Inside Inactive dates.");
                for (DateTime inactiveDate in widget.inactiveDates!) {
                  if (_compareDate(date, inactiveDate)) {
                    isDeactivated = true;
                    break;
                  }
                }
              }

              // check if this date needs to be deactivated for only ActivatedDates
              if (widget.activeDates != null) {
                isDeactivated = true;
                for (DateTime activateDate in widget.activeDates!) {
                  // Compare the date if it is in the
                  if (_compareDate(date, activateDate)) {
                    isDeactivated = false;
                    break;
                  }
                }
              }

              // Check if this date is the one that is currently selected
              bool isSelected = _currentDate != null
                  ? _compareDate(date, _currentDate!)
                  : false;
              // Return the Date Widget
              return DateWidget(
                date: date,
                monthTextStyle: isDeactivated
                    ? deactivatedMonthStyle
                    : isSelected
                        ? selectedMonthStyle
                        : widget.monthTextStyle,
                dateTextStyle: isDeactivated
                    ? deactivatedDateStyle
                    : isSelected
                        ? selectedDateStyle
                        : widget.dateTextStyle,
                dayTextStyle: isDeactivated
                    ? deactivatedDayStyle
                    : isSelected
                        ? selectedDayStyle
                        : widget.dayTextStyle,
                width: widget.width,
                locale: widget.locale,
                selectionColor:
                    isSelected ? widget.selectionColor : Colors.transparent,
                onDateSelected: (selectedDate) {
                  // Don't notify listener if date is deactivated
                  if (isDeactivated) return;

                  // A date is selected
                  if (widget.onDateChange != null) {
                    widget.onDateChange!(selectedDate);
                  }
                  setState(() {
                    _currentDate = selectedDate;
                  });
                },
              );
            },
          ),
        ),
        const SizedBox(height: 28),
        Text(
          'Сегодня ${DateFormat("dd MMMM yyy", widget.locale).format(DateTime.now())} года',
          style: defaultTodayTextStyle,
        )
      ],
    );
  }

  /// Helper function to compare two dates
  /// Returns True if both dates are the same
  bool _compareDate(DateTime date1, DateTime date2) {
    return date1.day == date2.day &&
        date1.month == date2.month &&
        date1.year == date2.year;
  }
}

class DatePickerController {
  _DatePickerState? _datePickerState;

  void setDatePickerState(_DatePickerState state) {
    _datePickerState = state;
  }

  void jumpToSelection() {
    assert(_datePickerState != null,
        'DatePickerController is not attached to any DatePicker View.');

    // jump to the current Date
    _datePickerState!._controller
        .jumpTo(_calculateDateOffset(_datePickerState!._currentDate!));
  }

  void jumpToDate(DateTime date,
      {duration = const Duration(milliseconds: 500), curve = Curves.linear}) {
    assert(_datePickerState != null,
        'DatePickerController is not attached to any DatePicker View.');

    _datePickerState!._controller.jumpTo(_calculateDateOffset(date));
  }

  /// This function will animate the Timeline to the currently selected Date
  void animateToSelection(
      {duration = const Duration(milliseconds: 500), curve = Curves.linear}) {
    assert(_datePickerState != null,
        'DatePickerController is not attached to any DatePicker View.');

    // animate to the current date
    _datePickerState!._controller.animateTo(
        _calculateDateOffset(_datePickerState!._currentDate!),
        duration: duration,
        curve: curve);
  }

  /// This function will animate to any date that is passed as a parameter
  /// In case a date is out of range nothing will happen
  void animateToDate(DateTime date,
      {duration = const Duration(milliseconds: 500), curve = Curves.linear}) {
    assert(_datePickerState != null,
        'DatePickerController is not attached to any DatePicker View.');

    _datePickerState!._controller.animateTo(_calculateDateOffset(date),
        duration: duration, curve: curve);
  }

  /// Calculate the number of pixels that needs to be scrolled to go to the
  /// date provided in the argument
  double _calculateDateOffset(DateTime date) {
    final startDate = DateTime(
        _datePickerState!.widget.startDate.year,
        _datePickerState!.widget.startDate.month,
        _datePickerState!.widget.startDate.day);

    int offset = date.difference(startDate).inDays;
    return (offset * _datePickerState!.widget.width) + (offset * 6);
  }
}

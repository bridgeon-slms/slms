import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:slms/model/leavepagemodel/leavemodel.dart';
import 'package:slms/services/leavepageservices/leavepageservices.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:io';

class LeavePage extends StatefulWidget {
  const LeavePage({super.key});

  @override
  State<LeavePage> createState() => _ModernLeavePageState();
}

class _ModernLeavePageState extends State<LeavePage> {
  String? selectedLeaveType;
  final TextEditingController descriptionController = TextEditingController();
  File? attachedFile;
  final List<String> leaveTypes = [
    'Annual Leave',
    'Sick Leave',
    'Compassionate Leave',
    'Work from Home'
  ];
  final List<String> durations = [
    'Full Day',
    'Half Day',
  ];

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  final Map<DateTime, String> _selectedDaysWithDurations = {};

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _focusedDay = focusedDay;
      if (_selectedDaysWithDurations.containsKey(selectedDay)) {
        _selectedDaysWithDurations.remove(selectedDay);
      } else {
        _selectedDaysWithDurations[selectedDay] = 'Full Day';
      }
    });
  }

  void _updateDuration(DateTime date, String duration) {
    setState(() {
      _selectedDaysWithDurations[date] = duration;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPageHeader(),
              const SizedBox(height: 20),
              _buildLeaveTypeCard(),
              const SizedBox(height: 16),
              _buildCalendarCard(),
              const SizedBox(height: 16),
              _buildSelectedDatesCard(),
              const SizedBox(height: 24),
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Leave Request',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Colors.blue.shade800,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Plan and manage your time off',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeaveTypeCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade100.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Leave Type'),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: selectedLeaveType,
              isExpanded: true,
              decoration: _inputDecoration('Select leave type'),
              dropdownColor: Colors.white,
              icon: Icon(Icons.arrow_drop_down, color: Colors.blue.shade800),
              onChanged: (value) => setState(() => selectedLeaveType = value),
              items: leaveTypes
                  .map((type) => DropdownMenuItem(
                        value: type,
                        child: Text(
                          type,
                          style: TextStyle(color: Colors.blue.shade800),
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Description'),
            const SizedBox(height: 12),
            TextFormField(
              controller: descriptionController,
              maxLines: 3,
              decoration: _inputDecoration('Enter reason for leave'),
              style: TextStyle(color: Colors.blue.shade800),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade100.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Select Dates'),
            const SizedBox(height: 12),
            TableCalendar(
              firstDay: DateTime.now(),
              lastDay: DateTime.now().add(const Duration(days: 365)),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: TextStyle(
                  color: Colors.blue.shade800,
                  fontWeight: FontWeight.bold,
                ),
              ),
              selectedDayPredicate: (day) =>
                  _selectedDaysWithDurations.containsKey(day),
              onDaySelected: _onDaySelected,
              onFormatChanged: (format) =>
                  setState(() => _calendarFormat = format),
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                    color: Colors.blue.shade800, shape: BoxShape.circle),
                todayDecoration: BoxDecoration(
                    color: Colors.blue.shade200, shape: BoxShape.circle),
                defaultTextStyle: TextStyle(color: Colors.blue.shade800),
                weekendTextStyle: TextStyle(color: Colors.blue.shade600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedDatesCard() {
    if (_selectedDaysWithDurations.isEmpty) return const SizedBox.shrink();

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade100.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Selected Dates'),
            const SizedBox(height: 12),
            ..._selectedDaysWithDurations.entries
                .map((entry) => _buildModernDateCard(entry.key, entry.value)),
          ],
        ),
      ),
    );
  }

  Widget _buildModernDateCard(DateTime date, String duration) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat('EEEE, dd MMM yyyy').format(date),
                  style: TextStyle(
                    color: Colors.blue.shade800,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                DropdownButton<String>(
                  value: duration,
                  underline: const SizedBox(),
                  dropdownColor: Colors.white,
                  style: TextStyle(color: Colors.blue.shade800),
                  onChanged: (value) => _updateDuration(date, value!),
                  items: durations
                      .map((d) => DropdownMenuItem(value: d, child: Text(d)))
                      .toList(),
                ),
              ],
            ),
          ),
          IconButton(
              icon: Icon(Icons.delete, color: Colors.red.shade400),
              onPressed: () {
                setState(() => _selectedDaysWithDurations.remove(date));
              }),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.blue.shade800,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.blue.shade200)),
            ),
            child: const Text('CANCEL',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              num value = 0;
              if (durations == 'Half Day') {
                value = 0.5;
              } else {
                value = 1;
              }
              LeavePageServices().addLeavePage(
                LeaveModel(
                  leaveType: leaveTypes.toString(),
                  description: descriptionController.toString(),
                  dates: [
                    {"date": _focusedDay, "value": value}
                  ],
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade800,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text('REQUEST',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.blue.shade800,
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey.shade400),
      filled: true,
      fillColor: Colors.blue.shade50,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.blue.shade800, width: 2),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:io';

class LeavePage extends StatefulWidget {
  const LeavePage({super.key});

  @override
  State<LeavePage> createState() => _LeavePageState();
}

class _LeavePageState extends State<LeavePage> {
  String? selectedLeaveType;
  final TextEditingController descriptionController = TextEditingController();
  File? attachedFile;
  final List<String> leaveTypes = [
    'Annual Leave',
    'Sick Leave',
  ];
  final List<String> durations = [
    'Full Day',
    'Half Day - Morning',
    'Half Day - Afternoon'
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
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(
                        'Request Leave', 'Submit your leave application'),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _buildCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Leave Type',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: selectedLeaveType,
                      isExpanded: true,
                      decoration: _inputDecoration('Select leave type'),
                      onChanged: (value) =>
                          setState(() => selectedLeaveType = value),
                      items: leaveTypes
                          .map((type) =>
                              DropdownMenuItem(value: type, child: Text(type)))
                          .toList(),
                    ),
                    const SizedBox(height: 16),
                    const Text('Description',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: descriptionController,
                      maxLines: 3,
                      decoration: _inputDecoration('Enter reason for leave'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _buildCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCalendar(),
                    if (_selectedDaysWithDurations.isNotEmpty) ...[
                      const Divider(height: 32),
                      const Text('Selected Dates',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),
                      ..._selectedDaysWithDurations.entries.map(
                          (entry) => _buildDateCard(entry.key, entry.value)),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: _buttonStyle(Colors.white, Colors.blue),
                      child: const Text('CANCEL',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: _buttonStyle(Colors.purple, Colors.white),
                      child: const Text('REQUEST',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    return TableCalendar(
      firstDay: DateTime.now(),
      lastDay: DateTime.now().add(const Duration(days: 365)),
      focusedDay: _focusedDay,
      calendarFormat: _calendarFormat,
      headerStyle:
          const HeaderStyle(formatButtonVisible: false, titleCentered: true),
      selectedDayPredicate: (day) =>
          _selectedDaysWithDurations.containsKey(day),
      onDaySelected: _onDaySelected,
      onFormatChanged: (format) => setState(() => _calendarFormat = format),
      calendarStyle: CalendarStyle(
        selectedDecoration:
            const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
        todayDecoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.3), shape: BoxShape.circle),
      ),
    );
  }

  Widget _buildDateCard(DateTime date, String duration) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(DateFormat('EEEE, dd MMM yyyy').format(date)),
                DropdownButton<String>(
                  value: duration,
                  underline: const SizedBox(),
                  onChanged: (value) => _updateDuration(date, value!),
                  items: durations
                      .map((d) => DropdownMenuItem(value: d, child: Text(d)))
                      .toList(),
                ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () =>
                  setState(() => _selectedDaysWithDurations.remove(date)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({required Widget child}) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(padding: const EdgeInsets.all(16), child: child));
  }

  Widget _buildHeader(String title, String subtitle) {
    return Row(children: [
      Icon(Icons.event, color: Colors.blue),
      const SizedBox(width: 12),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(subtitle, style: const TextStyle(color: Colors.grey))
      ])
    ]);
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none));
  }

  ButtonStyle _buttonStyle(Color bgColor, Color textColor) {
    return ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: textColor,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)));
  }
}

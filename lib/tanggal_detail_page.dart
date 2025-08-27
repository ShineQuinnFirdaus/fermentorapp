import 'package:flutter/material.dart';
import 'custom_header.dart';

class TanggalDetailPage extends StatefulWidget {
  const TanggalDetailPage({super.key});

  @override
  State<TanggalDetailPage> createState() => _TanggalDetailPageState();
}

class _TanggalDetailPageState extends State<TanggalDetailPage> {
  final Color primaryBlue = const Color(0xFF0D47A1);

  DateTime _focusedMonth = DateTime(DateTime.now().year, DateTime.now().month);
  DateTime? _selectedDate;
  int _tapCount = 0;

  List<String> months = const [
    "Januari",
    "Februari",
    "Maret",
    "April",
    "Mei",
    "Juni",
    "Juli",
    "Agustus",
    "September",
    "Oktober",
    "November",
    "Desember",
  ];

  List<int> years = [2025, 2026, 2027, 2028, 2029];

  int _daysInMonth(int year, int month) {
    if (month == 12) return DateTime(year + 1, 1, 0).day;
    return DateTime(year, month + 1, 0).day;
  }

  DateTime _firstDayOfMonth(DateTime month) {
    return DateTime(month.year, month.month, 1);
  }

  DateTime _lastDayOfMonth(DateTime month) {
    return DateTime(
      month.year,
      month.month,
      _daysInMonth(month.year, month.month),
    );
  }

  bool _isInSelectedRange(DateTime date) {
    if (_selectedDate == null) return false;
    DateTime start = _selectedDate!;
    DateTime end = start.add(const Duration(days: 6));
    return date.isAfter(start.subtract(const Duration(days: 1))) &&
        date.isBefore(end.add(const Duration(days: 1)));
  }

  @override
  Widget build(BuildContext context) {
    DateTime firstDayThisMonth = _firstDayOfMonth(_focusedMonth);
    DateTime lastDayThisMonth = _lastDayOfMonth(_focusedMonth);

    int weekdayStart = firstDayThisMonth.weekday % 7;
    DateTime gridStart = firstDayThisMonth.subtract(
      Duration(days: weekdayStart == 0 ? 6 : weekdayStart - 1),
    );

    int weekdayEnd = lastDayThisMonth.weekday % 7;
    DateTime gridEnd = lastDayThisMonth.add(
      Duration(days: weekdayEnd == 0 ? 0 : 7 - weekdayEnd),
    );

    List<DateTime> calendarDays = [];
    for (
      DateTime d = gridStart;
      d.isBefore(gridEnd);
      d = d.add(const Duration(days: 1))
    ) {
      calendarDays.add(d);
    }

    return Scaffold(
      backgroundColor: primaryBlue,
      body: Column(
        children: [
          const CustomHeader(initials: "RP", name: "Rendha Puspita"),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Cek Siklus !",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Pilih tanggal untuk melihat siklus",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text("Pilih Jarak Tanggal"),
                      ),
                      Row(
                        children: [
                          DropdownButton<int>(
                            value: _focusedMonth.month,
                            items: List.generate(
                              months.length,
                              (index) => DropdownMenuItem(
                                value: index + 1,
                                child: Text(months[index]),
                              ),
                            ),
                            onChanged: (val) {
                              setState(() {
                                _focusedMonth = DateTime(
                                  _focusedMonth.year,
                                  val!,
                                );
                                _selectedDate = null;
                              });
                            },
                          ),
                          const SizedBox(width: 12),
                          DropdownButton<int>(
                            value: _focusedMonth.year,
                            items: years
                                .map(
                                  (y) => DropdownMenuItem(
                                    value: y,
                                    child: Text("$y"),
                                  ),
                                )
                                .toList(),
                            onChanged: (val) {
                              setState(() {
                                _focusedMonth = DateTime(
                                  val!,
                                  _focusedMonth.month,
                                );
                                _selectedDate = null;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Header hari
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text("SEN"),
                        Text("SEL"),
                        Text("RAB"),
                        Text("KAM"),
                        Text("JUM"),
                        Text("SAB"),
                        Text("MIN"),
                      ],
                    ),
                  ),

                  // Kalender grid yang rapat penuh
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double rowHeight =
                            constraints.maxHeight / 6; // max 6 minggu
                        return Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black26),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                          ),
                          child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 7,
                                  crossAxisSpacing: 6,
                                  mainAxisSpacing: 6,
                                  childAspectRatio:
                                      constraints.maxWidth / (7 * rowHeight),
                                ),
                            itemCount: calendarDays.length,
                            itemBuilder: (context, index) {
                              DateTime day = calendarDays[index];
                              bool isCurrentMonth =
                                  day.month == _focusedMonth.month;
                              bool isSelected = _isInSelectedRange(day);

                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedDate = day;
                                    _tapCount++;
                                  });
                                },
                                child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 350),
                                  transitionBuilder: (child, anim) =>
                                      ScaleTransition(
                                        scale: anim,
                                        child: FadeTransition(
                                          opacity: anim,
                                          child: child,
                                        ),
                                      ),
                                  child: Container(
                                    key: ValueKey(
                                      "${day.toIso8601String()}-$_tapCount",
                                    ),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? primaryBlue.withOpacity(0.2)
                                          : null,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      "${day.day}",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: isSelected
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                        color: isSelected
                                            ? primaryBlue
                                            : (isCurrentMonth
                                                  ? Colors.black
                                                  : Colors.grey),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

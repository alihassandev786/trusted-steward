import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../widgets/app_button.dart';
import '../widgets/app_selected_field.dart';
import '../widgets/app_text_field.dart';
import '../widgets/app_title.dart';
import '../widgets/auth_bottom_sheet.dart';
import '../widgets/profile_picker.dart';
import 'choose_stewardship_screen.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final _fullNameController = TextEditingController();

  String? _country;
  String? _mobileNumber;
  String? _calendarDate;
  String? _gender;
  String? _timezone;
  String? _dateOfBirth;

  static const _countries = [
    'Pakistan',
    'India',
    'United States',
    'United Kingdom',
    'Canada',
    'Australia',
    'Other',
  ];

  static const _dialCodes = {
    'Pakistan': '+92',
    'India': '+91',
    'United States': '+1',
    'United Kingdom': '+44',
    'Canada': '+1',
    'Australia': '+61',
    'Other': '+',
  };

  static const _genders = ['Male', 'Female'];

  static const _timezones = [
    'UTC-08:00 Pacific Time',
    'UTC-05:00 Eastern Time',
    'UTC+00:00 London',
    'UTC+05:00 Islamabad',
    'UTC+05:30 India',
    'UTC+08:00 Singapore',
  ];

  @override
  void dispose() {
    _fullNameController.dispose();
    super.dispose();
  }

  Future<void> _pickCountry() async {
    final selected = await _showOptionsSheet(
      title: 'Select a country',
      options: _countries,
      selected: _country,
    );
    if (selected != null) setState(() => _country = selected);
  }

  Future<void> _pickMobileNumber() async {
    final result = await _showPhoneNumberSheet();
    if (result != null) setState(() => _mobileNumber = result);
  }

  Future<void> _pickGender() async {
    final selected = await _showOptionsSheet(
      title: 'Gender',
      options: _genders,
      selected: _gender,
    );
    if (selected != null) setState(() => _gender = selected);
  }

  Future<void> _pickTimezone() async {
    final selected = await _showOptionsSheet(
      title: 'Select a timezone',
      options: _timezones,
      selected: _timezone,
    );
    if (selected != null) setState(() => _timezone = selected);
  }

  Future<void> _pickCalendarDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: _themedDatePicker,
    );
    if (picked != null) {
      setState(() => _calendarDate = _formatDate(picked));
    }
  }

  Future<void> _pickDateOfBirth() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: _themedDatePicker,
    );
    if (picked != null) {
      setState(() => _dateOfBirth = _formatDate(picked));
    }
  }

  /// Wraps the default date picker with the app's green/gold/cream theme
  /// instead of Flutter's default blue Material theme.
  Widget _themedDatePicker(BuildContext context, Widget? child) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF306C3F), // header, selected day background
          onPrimary: Colors.white, // text on selected day
          onSurface: Color(0xFF1A1A1A), // body text/numbers
          secondary: Color(0xFFD1A436), // "today" outline accent
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white, // Cancel/OK buttons
          ),
        ),
        dialogTheme: DialogThemeData(
          backgroundColor: const Color(0xFFFDFBF5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        datePickerTheme: DatePickerThemeData(
          backgroundColor: const Color(0xFFFDFBF5),
          headerBackgroundColor: const Color(0xFF306C3F),
          headerForegroundColor: Colors.white,
          todayForegroundColor: const WidgetStatePropertyAll(
            Color(0xFFD1A436),
          ),
          todayBorder: const BorderSide(color: Color(0xFFD1A436), width: 1.5),
          dayForegroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) return Colors.white;
            return const Color(0xFF1A1A1A);
          }),
          dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const Color(0xFF306C3F);
            }
            return Colors.transparent;
          }),
          yearForegroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) return Colors.white;
            return const Color(0xFF1A1A1A);
          }),
          yearBackgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const Color(0xFF306C3F);
            }
            return Colors.transparent;
          }),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
      child: child!,
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  Future<String?> _showOptionsSheet({
    required String title,
    required List<String> options,
    String? selected,
  }) {
    return showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.6,
        ),
        decoration: const BoxDecoration(
          color: Color(0xFFFDFBF5),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 44,
              height: 4,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: const Color(0xFFE0DACB),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 17,
                fontFamily: 'pops',
                fontWeight: FontWeight.w700,
                color: Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 16),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: options.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (_, i) {
                  final option = options[i];
                  final isSelected = option == selected;
                  return InkWell(
                    onTap: () => Navigator.of(context).pop(option),
                    borderRadius: BorderRadius.circular(18),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF6F2E6),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFF306C3F)
                              : Colors.transparent,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              option,
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'pop',
                                color: Color(0xFF1A1A1A),
                              ),
                            ),
                          ),
                          if (isSelected)
                            const Icon(
                              Icons.check_circle,
                              color: Color(0xFF306C3F),
                              size: 20,
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String?> _showPhoneNumberSheet() {
    String selectedCountry = _country ?? 'Pakistan';
    final numberController = TextEditingController(
      text: _mobileNumber?.split(' ').skip(1).join(' ') ?? '',
    );

    return showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (sheetContext) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(sheetContext).viewInsets.bottom,
          ),
          child: StatefulBuilder(
            builder: (sheetContext, setSheetState) {
              return Container(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
                decoration: const BoxDecoration(
                  color: Color(0xFFFDFBF5),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 44,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE0DACB),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const Text(
                      'Mobile number',
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'pops',
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        // Country / dial code selector
                        InkWell(
                          borderRadius: BorderRadius.circular(28),
                          onTap: () async {
                            final picked = await _showOptionsSheet(
                              title: 'Select a country',
                              options: _countries,
                              selected: selectedCountry,
                            );
                            if (picked != null) {
                              setSheetState(() => selectedCountry = picked);
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 18,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEDE8DC),
                              borderRadius: BorderRadius.circular(28),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  _dialCodes[selectedCountry] ?? '+',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'pop',
                                    color: Color(0xFF1A1A1A),
                                  ),
                                ),
                                const SizedBox(width: 4),
                                const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Color(0xFF306C3F),
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: AppTextField(
                            hintText: 'Mobile number',
                            controller: numberController,
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    AppButton(
                      label: 'Done',
                      onPressed: () {
                        final dial = _dialCodes[selectedCountry] ?? '';
                        final number = numberController.text.trim();
                        if (number.isEmpty) {
                          Navigator.of(sheetContext).pop();
                          return;
                        }
                        Navigator.of(sheetContext).pop('$dial $number');
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _onContinue() {
    // TODO: send the collected profile data to your API
    debugPrint('Full name: ${_fullNameController.text}');
    debugPrint('Country: $_country');
    debugPrint('Mobile number: $_mobileNumber');
    debugPrint('Calendar date: $_calendarDate');
    debugPrint('Gender: $_gender');
    debugPrint('Timezone: $_timezone');
    debugPrint('Date of birth: $_dateOfBirth');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFBF5),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Green header with title, subtitle, and photo picker.
            Container(
              padding: const EdgeInsets.fromLTRB(24, 50, 24, 30),
              decoration: const BoxDecoration(
                color: Color(0xFF2E6B45),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  const AppTitle(
                    title: 'Complete Profile!',
                    subtitle: 'Personalize your stewardship experience.',
                    textAlign: TextAlign.center,
                    titleColor: Colors.white,
                    subtitleColor: Colors.white70,
                  ),
                  const SizedBox(height: 32),
                  ProfilePhotoPicker(
                    onImageSelected: (file) {
                      // TODO: upload/store the picked profile image file
                    },
                  ),
                ],
              ),
            ),

            // Cream card with the profile form fields.
            AuthBottomSheet(
              child: Column(
                children: [
                  AppTextField(
                    hintText: 'Full Name',
                    controller: _fullNameController,
                  ),
                  const SizedBox(height: 14),
                  AppSelectField(
                    hintText: 'Select a country',
                    icon: Icons.keyboard_arrow_down,
                    value: _country,
                    onTap: _pickCountry,
                  ),
                  const SizedBox(height: 14),
                  AppSelectField(
                    hintText: 'Mobile number',
                    icon: Icons.keyboard_arrow_down,
                    value: _mobileNumber,
                    onTap: _pickMobileNumber,
                  ),
                  const SizedBox(height: 14),
                  AppSelectField(
                    hintText: 'Calender today',
                    icon: Icons.calendar_today_outlined,
                    value: _calendarDate,
                    onTap: _pickCalendarDate,
                  ),
                  const SizedBox(height: 14),
                  AppSelectField(
                    hintText: 'Gender',
                    icon: Icons.keyboard_arrow_down,
                    value: _gender,
                    onTap: _pickGender,
                  ),
                  const SizedBox(height: 14),
                  AppSelectField(
                    hintText: 'Select a timezone',
                    icon: Icons.access_time,
                    value: _timezone,
                    onTap: _pickTimezone,
                  ),
                  const SizedBox(height: 14),
                  AppSelectField(
                    hintText: 'Date of Birth',
                    icon: Icons.calendar_today_outlined,
                    value: _dateOfBirth,
                    onTap: _pickDateOfBirth,
                  ),
                  const SizedBox(height: 20),
                  AppButton(
                    label: 'Continue',
                    onPressed: (){
                      Get.to(()=>ChooseStewardshipPrioritiesScreen());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
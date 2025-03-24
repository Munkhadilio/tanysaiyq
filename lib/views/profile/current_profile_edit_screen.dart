import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tanysaiyq/bloc/theme/theme_cubit.dart';
import 'package:tanysaiyq/customWidgets/custom_dialogs.dart';
import 'package:tanysaiyq/customWidgets/custom_section.dart';
import 'package:tanysaiyq/customWidgets/custom_tile.dart';
import 'package:tanysaiyq/sheet/habits_selection.dart';
import 'package:tanysaiyq/sheet/interest_selection.dart';
import 'package:tanysaiyq/utils/image_util.dart';
import 'package:tanysaiyq/views/profile/photo_grid.dart';
import 'package:tanysaiyq/generated/l10n.dart';

class CurrentProfileEditScreen extends StatefulWidget {
  const CurrentProfileEditScreen({super.key});

  @override
  _CurrentProfileEditScreenState createState() =>
      _CurrentProfileEditScreenState();
}

class _CurrentProfileEditScreenState extends State<CurrentProfileEditScreen> {
  final _formKey = GlobalKey<FormState>();
  String textAboutYourself = "";
  String _selectedGender = '';

  final TextEditingController userNameController =
      TextEditingController(text: 'Adilzhan');
  final TextEditingController userInterestsController =
      TextEditingController(text: 'Programming, Music');
  final TextEditingController userHabitsController = TextEditingController(
    text: 'Non-smoker, Moderate drinker',
  );
  final TextEditingController userEducationController =
      TextEditingController(text: 'Bachelor\'s Degree in Computer Science');
  final TextEditingController userJobController =
      TextEditingController(text: 'Software Engineer');

  DateTime _birthDate = DateTime(2000, 1, 1);
  final List<String?> profilePhotos = [null, null, null];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _selectedGender = S.of(context).male;
      });
    });
  }

  void _updatePhoto(int index, String? path) {
    setState(() => profilePhotos[index] = path);
  }

  Future<void> _pickImage(int index, ImageSource source) async {
    final imagePath = await ImageUtil.pickAndCropImage(
      context: context,
      source: source,
    );
    if (imagePath != null) {
      _updatePhoto(index, imagePath);
    }
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(S.of(context).profileSaved)),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = context.watch<ThemeCubit>().state.isDark;

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: _saveProfile,
            child: Text(
              S.of(context).save,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isDarkTheme ? null : Colors.grey,
                  ),
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            const SizedBox(height: 16),
            CustomSection(
              children: [
                ProfileImageGrid(
                  userProfileImages: profilePhotos.whereType<String>().toList(),
                  onAddPhoto: () => _showImageSourceDialog(context),
                  onRemovePhoto: (index) => _updatePhoto(index, null),
                ),
              ],
            ),
            const SizedBox(height: 16),
            CustomSection(
              title: S.of(context).basicInformation,
              children: [
                buildCustomTile(
                  context: context,
                  icon: CupertinoIcons.person_fill,
                  iconColor: Colors.grey,
                  title: S.of(context).name,
                  value: userNameController.text,
                  onPressed: () {
                    showCustomBottomSheet(
                      isContentFlexible: true,
                      context: context,
                      title: S.of(context).name,
                      content: SafeArea(
                        child: Column(
                          children: [
                            TextField(
                              controller: userNameController,
                              decoration: InputDecoration(
                                hintText: S.of(context).name,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onSave: () {
                        setState(() {});
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
                buildCustomTile(
                  context: context,
                  iconColor: Colors.amber,
                  icon: Icons.cake,
                  title: S.of(context).birthDate,
                  value: "${_birthDate.toLocal()}".split(' ')[0],
                  onPressed: () => _selectDate(context),
                ),
                buildCustomTile(
                  context: context,
                  icon: _selectedGender == S.of(context).male
                      ? Icons.male
                      : Icons.female,
                  title: S.of(context).gender,
                  value: _selectedGender,
                  iconColor: _selectedGender == S.of(context).male
                      ? Colors.blue
                      : Colors.pink,
                  onPressed: () => _showGenderSelectionDialog(context),
                ),
              ],
            ),
            const SizedBox(height: 16),
            CustomSection(
              title: S.of(context).writeAboutYourselfHeader,
              children: [
                TextField(
                  onChanged: (value) {
                    setState(() {
                      textAboutYourself = value;
                    });
                  },
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                  minLines: 15,
                  maxLines: 20,
                  decoration: InputDecoration(
                    hintText: S.of(context).writeAboutYourselfHintText,
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(
                          color: isDarkTheme
                              ? Colors.white
                              : CupertinoColors.systemGrey3,
                          width: 1.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: isDarkTheme
                            ? Colors.white
                            : CupertinoColors.systemGrey3,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: isDarkTheme
                            ? Colors.white
                            : CupertinoColors.systemGrey3,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            CustomSection(
              title: S.of(context).additionalInformation,
              children: [
                buildSelectionBlock(
                  title: S.of(context).interests,
                  icon: CupertinoIcons.game_controller_solid,
                  value: userInterestsController.text,
                  iconColor: Colors.green,
                  onPressed: () => _showInterestSelectionDialog(context),
                  selectedItems: userInterestsController.text.split(', '),
                  context: context,
                ),
                buildSelectionBlock(
                  title: S.of(context).habits,
                  icon: Icons.wine_bar,
                  value: userHabitsController.text,
                  iconColor: Colors.purple,
                  onPressed: () => _showHabitsSelectionDialog(context),
                  selectedItems: userHabitsController.text.split(', '),
                  context: context,
                ),
                buildCustomTile(
                  context: context,
                  icon: Icons.school,
                  iconColor: Colors.blue[700],
                  title: S.of(context).education,
                  value: userEducationController.text,
                  onPressed: () => _showEducationSelectionDialog(context),
                ),
                buildCustomTile(
                  context: context,
                  icon: Icons.work,
                  iconColor: Colors.black,
                  title: S.of(context).job,
                  value: userJobController.text,
                  onPressed: () => _showJobSelectionDialog(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showImageSourceDialog(BuildContext context) {
    showCustomBottomSheet(
      context: context,
      title: S.of(context).addPhotoSelectPhotoTitle,
      isContentFlexible: true,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: Text(
              S.of(context).addPhotoGalleryOption,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            onTap: () =>
                _pickImage(profilePhotos.indexOf(null), ImageSource.gallery),
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: Text(
              S.of(context).addPhotoCameraOption,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            onTap: () =>
                _pickImage(profilePhotos.indexOf(null), ImageSource.camera),
          ),
        ],
      ),
    );
  }

  void _showInterestSelectionDialog(BuildContext context) {
    showCustomBottomSheet(
      context: context,
      title: S.of(context).interests,
      content: Expanded(
        child: InterestSelection(
          selectedInterests: userInterestsController.text.split(', ').toSet(),
          onSelectionChanged: (selected) {
            setState(() {
              userInterestsController.text = selected.join(', ');
            });
          },
        ),
      ),
      onSave: () {
        Navigator.pop(context);
      },
    );
  }

  void _showHabitsSelectionDialog(BuildContext context) {
    showCustomBottomSheet(
      context: context,
      title: S.of(context).habits,
      content: Expanded(
        child: HabitsQuestionSelection(
          selectedDetails: {
            for (var item in userHabitsController.text.split(', '))
              item.trim(): item.trim()
          },
          onDetailsChanged: (selected) {
            setState(() {
              userHabitsController.text = selected.keys.join(', ');
            });
          },
        ),
      ),
      onSave: () {
        Navigator.pop(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _birthDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) setState(() => _birthDate = picked);
  }

  void _showGenderSelectionDialog(BuildContext context) {
    final List<String> genderOptions = [
      S.of(context).male,
      S.of(context).female
    ];
    final List<IconData> genderIcons = [Icons.male, Icons.female];
    final List<Color> genderIconColors = [Colors.blue, Colors.pink];

    showSingleColumnSelectionDialog(
      context: context,
      isContentFlexible: true,
      title: S.of(context).selectGender,
      options: genderOptions,
      currentSelection: _selectedGender,
      onSelectionChanged: (selectedGender) {
        setState(() {
          _selectedGender = selectedGender;
        });
      },
      icons: genderIcons,
      iconColors: genderIconColors,
    );
  }

  void _showJobSelectionDialog(BuildContext context) {
    final List<String> jobOptions = [
      "Software Engineer",
      "Designer",
      "Product Manager",
      "Teacher",
      "Doctor",
      "Freelancer",
      "Student",
    ];

    showSingleColumnSelectionDialog(
      context: context,
      title: S.of(context).selectJob,
      options: jobOptions,
      currentSelection: userJobController.text,
      onSelectionChanged: (selectedJob) {
        setState(() {
          userJobController.text = selectedJob;
        });
      },
    );
  }

  void _showEducationSelectionDialog(BuildContext context) {
    final List<String> educationOptions = [
      "High School Diploma",
      "Associate's Degree",
      "Bachelor's Degree",
      "Master's Degree",
      "Ph.D.",
      "Other",
    ];

    showSingleColumnSelectionDialog(
      context: context,
      title: S.of(context).selectEducation,
      options: educationOptions,
      currentSelection: userEducationController.text,
      onSelectionChanged: (selectedEducation) {
        setState(() {
          userEducationController.text = selectedEducation;
        });
      },
    );
  }
}

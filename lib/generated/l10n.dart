// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `True connection is born where words become unnecessary, and hearts speak to each other.`
  String get quote {
    return Intl.message(
      'True connection is born where words become unnecessary, and hearts speak to each other.',
      name: 'quote',
      desc: '',
      args: [],
    );
  }

  /// `Create an account`
  String get createAccount {
    return Intl.message(
      'Create an account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `Sign up to continue`
  String get signUpSubheader {
    return Intl.message(
      'Sign up to continue',
      name: 'signUpSubheader',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Confirm password`
  String get confirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phoneNumber {
    return Intl.message(
      'Phone number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain:`
  String get passwordRequirement {
    return Intl.message(
      'Password must contain:',
      name: 'passwordRequirement',
      desc: '',
      args: [],
    );
  }

  /// `At least 8 characters`
  String get minLengthRequirement {
    return Intl.message(
      'At least 8 characters',
      name: 'minLengthRequirement',
      desc: '',
      args: [],
    );
  }

  /// `At least 1 uppercase letter`
  String get uppercaseRequirement {
    return Intl.message(
      'At least 1 uppercase letter',
      name: 'uppercaseRequirement',
      desc: '',
      args: [],
    );
  }

  /// `At least 1 digit`
  String get digitRequirement {
    return Intl.message(
      'At least 1 digit',
      name: 'digitRequirement',
      desc: '',
      args: [],
    );
  }

  /// `At least 1 special character (!@#$%^&*)`
  String get specialCharRequirement {
    return Intl.message(
      'At least 1 special character (!@#\$%^&*)',
      name: 'specialCharRequirement',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continuee {
    return Intl.message('Continue', name: 'continuee', desc: '', args: []);
  }

  /// `Login`
  String get loginHeader {
    return Intl.message('Login', name: 'loginHeader', desc: '', args: []);
  }

  /// `Log in to continue`
  String get loginSubheader {
    return Intl.message(
      'Log in to continue',
      name: 'loginSubheader',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password`
  String get forgotPassword {
    return Intl.message(
      'Forgot password',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get noAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'noAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUpPrompt {
    return Intl.message('Sign up', name: 'signUpPrompt', desc: '', args: []);
  }

  /// `Log in to account`
  String get loginButton {
    return Intl.message(
      'Log in to account',
      name: 'loginButton',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgotPasswordHeader {
    return Intl.message(
      'Forgot password?',
      name: 'forgotPasswordHeader',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number to receive a password reset link via WhatsApp.`
  String get forgotPasswordNoAccount {
    return Intl.message(
      'Enter your phone number to receive a password reset link via WhatsApp.',
      name: 'forgotPasswordNoAccount',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phoneNumberLabel {
    return Intl.message(
      'Phone number',
      name: 'phoneNumberLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter OTP`
  String get otpHeader {
    return Intl.message('Enter OTP', name: 'otpHeader', desc: '', args: []);
  }

  /// `A 6-digit code has been sent to your WhatsApp.`
  String get otpMessage {
    return Intl.message(
      'A 6-digit code has been sent to your WhatsApp.',
      name: 'otpMessage',
      desc: '',
      args: [],
    );
  }

  /// `Enter a new password`
  String get passwordHeader {
    return Intl.message(
      'Enter a new password',
      name: 'passwordHeader',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get passwordnewPassword {
    return Intl.message(
      'New password',
      name: 'passwordnewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get passwordconfirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'passwordconfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirmButton {
    return Intl.message('Confirm', name: 'confirmButton', desc: '', args: []);
  }

  /// `Profile`
  String get profileSignUpHeader {
    return Intl.message(
      'Profile',
      name: 'profileSignUpHeader',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get firstName {
    return Intl.message('First name', name: 'firstName', desc: '', args: []);
  }

  /// `Last name`
  String get lastName {
    return Intl.message('Last name', name: 'lastName', desc: '', args: []);
  }

  /// `Birthdate`
  String get birthDate {
    return Intl.message('Birthdate', name: 'birthDate', desc: '', args: []);
  }

  /// `Your Gender`
  String get gendaHeader {
    return Intl.message('Your Gender', name: 'gendaHeader', desc: '', args: []);
  }

  /// `Man`
  String get male {
    return Intl.message('Man', name: 'male', desc: '', args: []);
  }

  /// `Woman`
  String get female {
    return Intl.message('Woman', name: 'female', desc: '', args: []);
  }

  /// `My Interests`
  String get interestHeader {
    return Intl.message(
      'My Interests',
      name: 'interestHeader',
      desc: '',
      args: [],
    );
  }

  /// `Select a few of your interests and let everyone know what you're passionate about.`
  String get interestSubheader {
    return Intl.message(
      'Select a few of your interests and let everyone know what you\'re passionate about.',
      name: 'interestSubheader',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Habits and Preferences`
  String get habitsHeader {
    return Intl.message(
      'Habits and Preferences',
      name: 'habitsHeader',
      desc: '',
      args: [],
    );
  }

  /// `Specify your habits and preferences so we can suggest suitable matches.`
  String get habitsSubheader {
    return Intl.message(
      'Specify your habits and preferences so we can suggest suitable matches.',
      name: 'habitsSubheader',
      desc: '',
      args: [],
    );
  }

  /// `Add Photos`
  String get addPhotoHeader {
    return Intl.message(
      'Add Photos',
      name: 'addPhotoHeader',
      desc: '',
      args: [],
    );
  }

  /// `Photos help create a more complete representation of you.`
  String get addPhotoSubheader {
    return Intl.message(
      'Photos help create a more complete representation of you.',
      name: 'addPhotoSubheader',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get addPhotoContinueButton {
    return Intl.message(
      'Continue',
      name: 'addPhotoContinueButton',
      desc: '',
      args: [],
    );
  }

  /// `Choose a Photo`
  String get addPhotoSelectPhotoTitle {
    return Intl.message(
      'Choose a Photo',
      name: 'addPhotoSelectPhotoTitle',
      desc: '',
      args: [],
    );
  }

  /// `Open Gallery`
  String get addPhotoGalleryOption {
    return Intl.message(
      'Open Gallery',
      name: 'addPhotoGalleryOption',
      desc: '',
      args: [],
    );
  }

  /// `Open Camera`
  String get addPhotoCameraOption {
    return Intl.message(
      'Open Camera',
      name: 'addPhotoCameraOption',
      desc: '',
      args: [],
    );
  }

  /// `Write About Yourself`
  String get writeAboutYourselfHeader {
    return Intl.message(
      'Write About Yourself',
      name: 'writeAboutYourselfHeader',
      desc: '',
      args: [],
    );
  }

  /// `Describe what you like to do in your free time, your hobbies, goals, or dreams.`
  String get writeAboutYourselfHintText {
    return Intl.message(
      'Describe what you like to do in your free time, your hobbies, goals, or dreams.',
      name: 'writeAboutYourselfHintText',
      desc: '',
      args: [],
    );
  }

  /// `km`
  String get km {
    return Intl.message('km', name: 'km', desc: '', args: []);
  }

  /// `Filters`
  String get filterTitle {
    return Intl.message('Filters', name: 'filterTitle', desc: '', args: []);
  }

  /// `Clear`
  String get clear {
    return Intl.message('Clear', name: 'clear', desc: '', args: []);
  }

  /// `Interested in`
  String get interestedIn {
    return Intl.message(
      'Interested in',
      name: 'interestedIn',
      desc: '',
      args: [],
    );
  }

  /// `Girls`
  String get genderGirls {
    return Intl.message('Girls', name: 'genderGirls', desc: '', args: []);
  }

  /// `Boys`
  String get genderBoys {
    return Intl.message('Boys', name: 'genderBoys', desc: '', args: []);
  }

  /// `Both`
  String get genderBoth {
    return Intl.message('Both', name: 'genderBoth', desc: '', args: []);
  }

  /// `Distance`
  String get distance {
    return Intl.message('Distance', name: 'distance', desc: '', args: []);
  }

  /// `Age`
  String get age {
    return Intl.message('Age', name: 'age', desc: '', args: []);
  }

  /// `{distance} km away`
  String cardsDistance(Object distance) {
    return Intl.message(
      '$distance km away',
      name: 'cardsDistance',
      desc: '',
      args: [distance],
    );
  }

  /// `Profile Information`
  String get cardsHeader {
    return Intl.message(
      'Profile Information',
      name: 'cardsHeader',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get cardsDetails {
    return Intl.message('Details', name: 'cardsDetails', desc: '', args: []);
  }

  /// `Interests`
  String get cardsInterests {
    return Intl.message(
      'Interests',
      name: 'cardsInterests',
      desc: '',
      args: [],
    );
  }

  /// `Questions`
  String get cardsQuestions {
    return Intl.message(
      'Questions',
      name: 'cardsQuestions',
      desc: '',
      args: [],
    );
  }

  /// `Likes and Matches`
  String get matchScreenTitle {
    return Intl.message(
      'Likes and Matches',
      name: 'matchScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Likes`
  String get tabLikes {
    return Intl.message('Likes', name: 'tabLikes', desc: '', args: []);
  }

  /// `Matches`
  String get tabMatches {
    return Intl.message('Matches', name: 'tabMatches', desc: '', args: []);
  }

  /// `No likes.`
  String get noLikes {
    return Intl.message('No likes.', name: 'noLikes', desc: '', args: []);
  }

  /// `No matches.`
  String get noMatches {
    return Intl.message('No matches.', name: 'noMatches', desc: '', args: []);
  }

  /// `Match!`
  String get matchLabel {
    return Intl.message('Match!', name: 'matchLabel', desc: '', args: []);
  }

  /// `Like`
  String get likeLabel {
    return Intl.message('Like', name: 'likeLabel', desc: '', args: []);
  }

  /// `Messages`
  String get messagesTitle {
    return Intl.message('Messages', name: 'messagesTitle', desc: '', args: []);
  }

  /// `Active`
  String get activeTab {
    return Intl.message('Active', name: 'activeTab', desc: '', args: []);
  }

  /// `Archived`
  String get archivedTab {
    return Intl.message('Archived', name: 'archivedTab', desc: '', args: []);
  }

  /// `Search...`
  String get searchPlaceholder {
    return Intl.message(
      'Search...',
      name: 'searchPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `No chats`
  String get noChats {
    return Intl.message('No chats', name: 'noChats', desc: '', args: []);
  }

  /// `Chat with {name}`
  String chatWith(Object name) {
    return Intl.message(
      'Chat with $name',
      name: 'chatWith',
      desc: '',
      args: [name],
    );
  }

  /// `Profile`
  String get profileTitle {
    return Intl.message('Profile', name: 'profileTitle', desc: '', args: []);
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `User Safety`
  String get userSafety {
    return Intl.message('User Safety', name: 'userSafety', desc: '', args: []);
  }

  /// `Online Dating Tips`
  String get onlineDatingTips {
    return Intl.message(
      'Online Dating Tips',
      name: 'onlineDatingTips',
      desc: '',
      args: [],
    );
  }

  /// `Rules for In-Person Meetings`
  String get meetingRules {
    return Intl.message(
      'Rules for In-Person Meetings',
      name: 'meetingRules',
      desc: '',
      args: [],
    );
  }

  /// `General Safety`
  String get generalSafety {
    return Intl.message(
      'General Safety',
      name: 'generalSafety',
      desc: '',
      args: [],
    );
  }

  /// `Recommended!`
  String get recommended {
    return Intl.message(
      'Recommended!',
      name: 'recommended',
      desc: '',
      args: [],
    );
  }

  /// `Buy for {price}`
  String subscriptionBuy(Object price) {
    return Intl.message(
      'Buy for $price',
      name: 'subscriptionBuy',
      desc: '',
      args: [price],
    );
  }

  /// `Advanced features for convenience`
  String get subscriptionDescriptions_plus {
    return Intl.message(
      'Advanced features for convenience',
      name: 'subscriptionDescriptions_plus',
      desc: '',
      args: [],
    );
  }

  /// `All features for maximum engagement`
  String get subscriptionDescriptions_premium {
    return Intl.message(
      'All features for maximum engagement',
      name: 'subscriptionDescriptions_premium',
      desc: '',
      args: [],
    );
  }

  /// `More Visibility`
  String get subscriptionFeatures_boost {
    return Intl.message(
      'More Visibility',
      name: 'subscriptionFeatures_boost',
      desc: '',
      args: [],
    );
  }

  /// `Messaging`
  String get subscriptionFeatures_messaging {
    return Intl.message(
      'Messaging',
      name: 'subscriptionFeatures_messaging',
      desc: '',
      args: [],
    );
  }

  /// `No Ads`
  String get subscriptionFeatures_noAds {
    return Intl.message(
      'No Ads',
      name: 'subscriptionFeatures_noAds',
      desc: '',
      args: [],
    );
  }

  /// `Super Like`
  String get subscriptionFeatures_superLike {
    return Intl.message(
      'Super Like',
      name: 'subscriptionFeatures_superLike',
      desc: '',
      args: [],
    );
  }

  /// `Unlimited Likes`
  String get subscriptionFeatures_unlimitedLikes {
    return Intl.message(
      'Unlimited Likes',
      name: 'subscriptionFeatures_unlimitedLikes',
      desc: '',
      args: [],
    );
  }

  /// `Start for Free`
  String get subscriptionFree {
    return Intl.message(
      'Start for Free',
      name: 'subscriptionFree',
      desc: '',
      args: [],
    );
  }

  /// `Tanysaiyq Plus`
  String get subscriptionNames_plus {
    return Intl.message(
      'Tanysaiyq Plus',
      name: 'subscriptionNames_plus',
      desc: '',
      args: [],
    );
  }

  /// `Tanysaiyq Premium`
  String get subscriptionNames_premium {
    return Intl.message(
      'Tanysaiyq Premium',
      name: 'subscriptionNames_premium',
      desc: '',
      args: [],
    );
  }

  /// `month`
  String get month {
    return Intl.message('month', name: 'month', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Basic Information`
  String get basicInformation {
    return Intl.message(
      'Basic Information',
      name: 'basicInformation',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Gender`
  String get gender {
    return Intl.message('Gender', name: 'gender', desc: '', args: []);
  }

  /// `Additional Information`
  String get additionalInformation {
    return Intl.message(
      'Additional Information',
      name: 'additionalInformation',
      desc: '',
      args: [],
    );
  }

  /// `Interests`
  String get interests {
    return Intl.message('Interests', name: 'interests', desc: '', args: []);
  }

  /// `Habits`
  String get habits {
    return Intl.message('Habits', name: 'habits', desc: '', args: []);
  }

  /// `Education`
  String get education {
    return Intl.message('Education', name: 'education', desc: '', args: []);
  }

  /// `Job`
  String get job {
    return Intl.message('Job', name: 'job', desc: '', args: []);
  }

  /// `Select Gender`
  String get selectGender {
    return Intl.message(
      'Select Gender',
      name: 'selectGender',
      desc: '',
      args: [],
    );
  }

  /// `Select Job`
  String get selectJob {
    return Intl.message('Select Job', name: 'selectJob', desc: '', args: []);
  }

  /// `Select Education`
  String get selectEducation {
    return Intl.message(
      'Select Education',
      name: 'selectEducation',
      desc: '',
      args: [],
    );
  }

  /// `Profile saved`
  String get profileSaved {
    return Intl.message(
      'Profile saved',
      name: 'profileSaved',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `General`
  String get general {
    return Intl.message('General', name: 'general', desc: '', args: []);
  }

  /// `Night Mode`
  String get darkMode {
    return Intl.message('Night Mode', name: 'darkMode', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message('Account', name: 'account', desc: '', args: []);
  }

  /// `Subscription`
  String get subscription {
    return Intl.message(
      'Subscription',
      name: 'subscription',
      desc: '',
      args: [],
    );
  }

  /// `Hide Profile`
  String get hideProfile {
    return Intl.message(
      'Hide Profile',
      name: 'hideProfile',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message('Log Out', name: 'logOut', desc: '', args: []);
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Support and Help`
  String get supportAndHelp {
    return Intl.message(
      'Support and Help',
      name: 'supportAndHelp',
      desc: '',
      args: [],
    );
  }

  /// `Help and Support`
  String get helpAndSupport {
    return Intl.message(
      'Help and Support',
      name: 'helpAndSupport',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Use`
  String get termsOfUse {
    return Intl.message('Terms of Use', name: 'termsOfUse', desc: '', args: []);
  }

  /// `Data Processing Consent`
  String get dataProcessingConsent {
    return Intl.message(
      'Data Processing Consent',
      name: 'dataProcessingConsent',
      desc: '',
      args: [],
    );
  }

  /// `Refund Right`
  String get refundRight {
    return Intl.message(
      'Refund Right',
      name: 'refundRight',
      desc: '',
      args: [],
    );
  }

  /// `Choose Language`
  String get chooseLanguage {
    return Intl.message(
      'Choose Language',
      name: 'chooseLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Russian`
  String get russian {
    return Intl.message('Russian', name: 'russian', desc: '', args: []);
  }

  /// `Kazakh`
  String get kazakh {
    return Intl.message('Kazakh', name: 'kazakh', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Submit`
  String get submit {
    return Intl.message('Submit', name: 'submit', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `{subscription} until {date}`
  String subscriptionDate(Object subscription, Object date) {
    return Intl.message(
      '$subscription until $date',
      name: 'subscriptionDate',
      desc: '',
      args: [subscription, date],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'kk'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

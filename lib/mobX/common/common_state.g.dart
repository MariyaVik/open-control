// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CommonState on _CommonState, Store {
  Computed<ObservableList<Consultation>>? _$activeKonsComputed;

  @override
  ObservableList<Consultation> get activeKons => (_$activeKonsComputed ??=
          Computed<ObservableList<Consultation>>(() => super.activeKons,
              name: '_CommonState.activeKons'))
      .value;
  Computed<ObservableList<Consultation>>? _$finishedKonsComputed;

  @override
  ObservableList<Consultation> get finishedKons => (_$finishedKonsComputed ??=
          Computed<ObservableList<Consultation>>(() => super.finishedKons,
              name: '_CommonState.finishedKons'))
      .value;
  Computed<bool>? _$hasSlotsComputed;

  @override
  bool get hasSlots => (_$hasSlotsComputed ??=
          Computed<bool>(() => super.hasSlots, name: '_CommonState.hasSlots'))
      .value;

  late final _$activeTabIndexAtom =
      Atom(name: '_CommonState.activeTabIndex', context: context);

  @override
  int get activeTabIndex {
    _$activeTabIndexAtom.reportRead();
    return super.activeTabIndex;
  }

  @override
  set activeTabIndex(int value) {
    _$activeTabIndexAtom.reportWrite(value, super.activeTabIndex, () {
      super.activeTabIndex = value;
    });
  }

  late final _$userAtom = Atom(name: '_CommonState.user', context: context);

  @override
  UserInfo get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserInfo value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$allConsultationsAtom =
      Atom(name: '_CommonState.allConsultations', context: context);

  @override
  AllConsultations get allConsultations {
    _$allConsultationsAtom.reportRead();
    return super.allConsultations;
  }

  @override
  set allConsultations(AllConsultations value) {
    _$allConsultationsAtom.reportWrite(value, super.allConsultations, () {
      super.allConsultations = value;
    });
  }

  late final _$currentKonsAtom =
      Atom(name: '_CommonState.currentKons', context: context);

  @override
  Consultation get currentKons {
    _$currentKonsAtom.reportRead();
    return super.currentKons;
  }

  @override
  set currentKons(Consultation value) {
    _$currentKonsAtom.reportWrite(value, super.currentKons, () {
      super.currentKons = value;
    });
  }

  late final _$knosAtom = Atom(name: '_CommonState.knos', context: context);

  @override
  List<NadzorOrgans>? get knos {
    _$knosAtom.reportRead();
    return super.knos;
  }

  @override
  set knos(List<NadzorOrgans>? value) {
    _$knosAtom.reportWrite(value, super.knos, () {
      super.knos = value;
    });
  }

  late final _$knosFilterAtom =
      Atom(name: '_CommonState.knosFilter', context: context);

  @override
  List<NadzorOrgans>? get knosFilter {
    _$knosFilterAtom.reportRead();
    return super.knosFilter;
  }

  @override
  set knosFilter(List<NadzorOrgans>? value) {
    _$knosFilterAtom.reportWrite(value, super.knosFilter, () {
      super.knosFilter = value;
    });
  }

  late final _$datesAtom = Atom(name: '_CommonState.dates', context: context);

  @override
  ObservableList<String> get dates {
    _$datesAtom.reportRead();
    return super.dates;
  }

  @override
  set dates(ObservableList<String> value) {
    _$datesAtom.reportWrite(value, super.dates, () {
      super.dates = value;
    });
  }

  late final _$allSlotsAtom =
      Atom(name: '_CommonState.allSlots', context: context);

  @override
  Map<String, dynamic> get allSlots {
    _$allSlotsAtom.reportRead();
    return super.allSlots;
  }

  @override
  set allSlots(Map<String, dynamic> value) {
    _$allSlotsAtom.reportWrite(value, super.allSlots, () {
      super.allSlots = value;
    });
  }

  late final _$isDateLoadingAtom =
      Atom(name: '_CommonState.isDateLoading', context: context);

  @override
  bool get isDateLoading {
    _$isDateLoadingAtom.reportRead();
    return super.isDateLoading;
  }

  @override
  set isDateLoading(bool value) {
    _$isDateLoadingAtom.reportWrite(value, super.isDateLoading, () {
      super.isDateLoading = value;
    });
  }

  late final _$isAuthAtom = Atom(name: '_CommonState.isAuth', context: context);

  @override
  bool get isAuth {
    _$isAuthAtom.reportRead();
    return super.isAuth;
  }

  @override
  set isAuth(bool value) {
    _$isAuthAtom.reportWrite(value, super.isAuth, () {
      super.isAuth = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_CommonState.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$getSlotsAsyncAction =
      AsyncAction('_CommonState.getSlots', context: context);

  @override
  Future<void> getSlots() {
    return _$getSlotsAsyncAction.run(() => super.getSlots());
  }

  late final _$getKNOsAsyncAction =
      AsyncAction('_CommonState.getKNOs', context: context);

  @override
  Future<void> getKNOs() {
    return _$getKNOsAsyncAction.run(() => super.getKNOs());
  }

  late final _$filteringKNOAsyncAction =
      AsyncAction('_CommonState.filteringKNO', context: context);

  @override
  Future<void> filteringKNO(String text) {
    return _$filteringKNOAsyncAction.run(() => super.filteringKNO(text));
  }

  late final _$getAllConsAsyncAction =
      AsyncAction('_CommonState.getAllCons', context: context);

  @override
  Future<void> getAllCons() {
    return _$getAllConsAsyncAction.run(() => super.getAllCons());
  }

  late final _$_CommonStateActionController =
      ActionController(name: '_CommonState', context: context);

  @override
  void updateTab(int index) {
    final _$actionInfo = _$_CommonStateActionController.startAction(
        name: '_CommonState.updateTab');
    try {
      return super.updateTab(index);
    } finally {
      _$_CommonStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getCurrentWeek(DateTime date) {
    final _$actionInfo = _$_CommonStateActionController.startAction(
        name: '_CommonState.getCurrentWeek');
    try {
      return super.getCurrentWeek(date);
    } finally {
      _$_CommonStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
activeTabIndex: ${activeTabIndex},
user: ${user},
allConsultations: ${allConsultations},
currentKons: ${currentKons},
knos: ${knos},
knosFilter: ${knosFilter},
dates: ${dates},
allSlots: ${allSlots},
isDateLoading: ${isDateLoading},
isAuth: ${isAuth},
isLoading: ${isLoading},
activeKons: ${activeKons},
finishedKons: ${finishedKons},
hasSlots: ${hasSlots}
    ''';
  }
}

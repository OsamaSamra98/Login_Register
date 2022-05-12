abstract class TalentsAuthStates {}

class TalentsAuthInitialStates extends TalentsAuthStates {}

/// Sign Up
class TalentsSignUpLoadingStates extends TalentsAuthStates {}

class TalentsSignUpSuccessStates extends TalentsAuthStates {}

class TalentsSignUpErrorStates extends TalentsAuthStates {
  final String error;
  TalentsSignUpErrorStates({required this.error});
}

/// Sign In
class TalentsSignInLoadingStates extends TalentsAuthStates {}

class TalentsSignInSuccessStates extends TalentsAuthStates {}

class TalentsSignInErrorStates extends TalentsAuthStates {
  final String error;
  TalentsSignInErrorStates({required this.error});
}

/// Add Errors And Remove
class TalentsAddErrorInListStates extends TalentsAuthStates {}

class TalentsRemoveErrorFromListStates extends TalentsAuthStates {}

/// Select Gender
class TalentsSelectGenderStates extends TalentsAuthStates {}

/// Select Talents
class TalentsAddTalentsOnListStates extends TalentsAuthStates {}

class TalentsRemoveTalentsFromListStates extends TalentsAuthStates {}

/// Hidden Password
class TalentsHiddenPasswordStates extends TalentsAuthStates {}

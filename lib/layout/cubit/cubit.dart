import 'package:flutter_bloc/flutter_bloc.dart';
import 'states.dart';

class TalentsCubit extends Cubit<TalentsStates> {
  TalentsCubit() : super(TalentsInitialStates());
}

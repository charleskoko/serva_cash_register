import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:serva_cash_register/core/exceptions.dart';
import 'package:serva_cash_register/data/models/company.dart';
import 'package:serva_cash_register/data/repositories/initialization_repository.dart';

part 'states/initialization_state.dart';

class InitializationCubit extends Cubit<InitializationState> {
  final InitializationRepository _initializationRepository;
  InitializationCubit(this._initializationRepository)
      : super(InitializationInitial()) {
    checkInitialization();
  }

  void onChangeInitializationStatus() => (emit(state));

  void checkInitialization() async {
    try {
      final Company company = await _initializationRepository.getCompany();
      if (company == null) {
        emit(NotInitialized());
      } else {
        emit(Initialized(company));
      }
    } on FileSystemExceptionError {
      emit(NotInitialized());
    }
  }

  void initialize(Map<String, String> credential) async {
    emit(InitializationLoading());
    try {
      final List<Company> companies =
          await _initializationRepository.startInitialize(credential);
      emit(InitializationLoaded(companies));
    } on UnauthorizedError {
      emit(InitializedUnknownAccount());
      emit(InitializationInitial());
    } on NoServerConnectionError{
      emit(InitializedFailedInternet());
      emit(InitializationInitial());
    }
  }

  void companySelected(Company company, List<Company> companies) {
    emit(InitializationLoaded(companies, selectedCompany: company));
  }

  void saveCompany(Company selectedCompany) {
    emit(InitializationLoading());
    _initializationRepository.writeCompany(selectedCompany);
    emit(InitializedFirst());
  }
}

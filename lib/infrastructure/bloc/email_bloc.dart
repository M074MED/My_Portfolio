import '../api/email_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_event.dart';
part 'email_state.dart';
part 'email_bloc.freezed.dart';

class EmailBloc extends Bloc<EmailEvent, EmailState> {
  final EmailRepository _emailRepository;

  EmailBloc(this._emailRepository) : super(const EmailState.initial()) {
    on<SendEmail>((event, emit) async {
      emit(const EmailState.sendingEmail());

      final response = await _emailRepository.sendEmail(
        name: event.name,
        email: event.email,
        subject: event.subject,
        message: event.message,
      );

      response.fold(
        (failure) => emit(const EmailState.failure()),
        (data) => emit(const EmailState.emailSentSuccessFully()),
      );
    });
  }
}

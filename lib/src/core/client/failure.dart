abstract class Failure implements Exception {
  String? title;
  String? message;
  Failure({this.title, this.message});
}

class GeneralFailure extends Failure {
  GeneralFailure({String? message})
      : super(
          title: 'General Failure $message',
          message: message,
        );
}

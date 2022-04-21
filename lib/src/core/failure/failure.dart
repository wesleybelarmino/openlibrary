import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String title;
  final String message;

  const Failure({required this.title, required this.message});

  @override
  List<Object?> get props => [title, message];
}

const kAppFailure = AppFailure();
const kTimeOutFailure = TimeOutFailure();
const kServerFailure = ServerFailure();
const kConnectionFailure = ConnectionFailure();

class AppFailure extends Failure {
  const AppFailure()
      : super(
            title: "Algo deu errado",
            message: "Ocorreu um erro na aplicação, a ação não foi concluída");
}

class TimeOutFailure extends Failure {
  const TimeOutFailure()
      : super(
            title: "Instabilidade na conexão",
            message: "Ocorreu uma instabilidade e a ação não foi concluída");
}

class ServerFailure extends Failure {
  const ServerFailure()
      : super(
            title: "Erro ao se conectar",
            message:
                "Ocorreu um erro e não foi possível se conectar ao servidor");
}

class ConnectionFailure extends Failure {
  const ConnectionFailure()
      : super(
            title: "Sem conexão",
            message: "Não foi possível se conectar ao servidor");
}

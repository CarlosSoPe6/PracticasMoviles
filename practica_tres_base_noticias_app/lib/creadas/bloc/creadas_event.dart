part of 'creadas_bloc.dart';

abstract class CreadasEvent extends Equatable {
  const CreadasEvent();

  @override
  List<Object> get props => [];
}

class CreateNewEvent extends CreadasEvent {
  final Noticia noticia;
  CreateNewEvent({this.noticia});
}

class FetchNewsEvent extends CreadasEvent {}

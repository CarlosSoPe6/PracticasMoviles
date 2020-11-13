part of 'creadas_bloc.dart';

abstract class CreadasEvent extends Equatable {
  const CreadasEvent();

  @override
  List<Object> get props => [];
}

class CreateNewEvent extends CreadasEvent {
  final Noticia noticia;
  final bool camera;
  CreateNewEvent({this.noticia, this.camera});
}

class FetchNewsEvent extends CreadasEvent {}

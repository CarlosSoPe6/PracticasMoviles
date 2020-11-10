part of 'creadas_bloc.dart';

abstract class CreadasState extends Equatable {
  const CreadasState();

  @override
  List<Object> get props => [];
}

class CreadasInitial extends CreadasState {}

class CreatedNewState extends CreadasState {}

class FetchedNewsState extends CreadasState {
  final List<Noticia> noticias;
  FetchedNewsState({this.noticias});
}

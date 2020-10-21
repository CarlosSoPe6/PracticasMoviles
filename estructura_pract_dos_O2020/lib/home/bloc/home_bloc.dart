import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:pract_dos/consts.dart';
import 'package:pract_dos/models/todo_reminder.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  Box _box = Hive.box(HIVE_BOX_NAME);
  HomeBloc() : super(HomeInitialState());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is OnLoadRemindersEvent) {
      try {
        List<TodoRemainder> _existingReminders = _loadReminders();
        yield LoadedRemindersState(todosList: _existingReminders);
      } on DatabaseDoesNotExist catch (_) {
        yield NoRemindersState();
      } on EmptyDatabase catch (_) {
        yield NoRemindersState();
      }
    }
    if (event is OnAddElementEvent) {
      _saveTodoReminder(event.todoReminder);
      yield NewReminderState(todo: event.todoReminder);
    }
    if (event is OnReminderAddedEvent) {
      yield AwaitingEventsState();
    }
    if (event is OnRemoveElementEvent) {
      _removeTodoReminder(event.removedAtIndex);
    }
  }

  List<TodoRemainder> _loadReminders() {
    List<TodoRemainder> reminders = List();
    _box.values.forEach((element) {
      reminders.add(element);
    });
    if (reminders.length == 0) {
      throw EmptyDatabase();
    }
    return reminders;
  }

  void _saveTodoReminder(TodoRemainder todoReminder) async {
    int i = await _box.add(todoReminder);
    print(i);
  }

  void _removeTodoReminder(int removedAtIndex) async {
    await _box.deleteAt(removedAtIndex);
  }
}

class DatabaseDoesNotExist implements Exception {}

class EmptyDatabase implements Exception {}

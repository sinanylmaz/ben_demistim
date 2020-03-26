import 'dart:async';

import 'package:ben_demistim/bloc/bloc.dart';
import 'package:ben_demistim/model/entry.dart';

class EntryBloc implements Bloc{
  List<Entry> _entry=[];

  final _entryController=StreamController<List<Entry>>();
  StreamSink<List<Entry>> get _inEntrySink{
    return _entryController.sink;
  }
  Stream<List<Entry>> get entries =>_entryController.stream;

  EntryBloc(){

    _entry.add(Entry(1,"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut lab ore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",5,2,15,6,DateTime.now()));
    _entry.add(Entry(2," ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut lab ore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",1,2,5,2,DateTime.now()));
    _entry.add(Entry(3," dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut lab ore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",7,2,25,6,DateTime.now()));
    _entry.add(Entry(1," sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut lab ore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",6,2,35,16,DateTime.now()));
    _inEntrySink.add(_entry);
  }


  @override
  void dispose() {
    _entryController.close();
  }
}
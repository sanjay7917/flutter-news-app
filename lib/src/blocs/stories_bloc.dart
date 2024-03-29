import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';
import '../resources/repository.dart';
class StoriesBloc {
  final _repository = Repository();
  final _topIds = PublishSubject < List < int >> ();

  Observable < List < int >> get topIds => _topIds.stream;

  fetchTopIds() async {
    final ids = await _repository.fetchToopIds();
    _topIds.sink.add(ids);
  }

  dispose() {
    _topIds.close();
  }
}
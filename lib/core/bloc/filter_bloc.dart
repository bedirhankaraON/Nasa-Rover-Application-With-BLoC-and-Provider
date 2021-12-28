import 'package:nasa_application/core/services/exporter.dart';


part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  final Rover rover;
  FilterBloc({required this.rover}) : super(FilterLoading()) {
    on<FilterEvent>((event, emit) async {
      if (event is AddFilter) {
        try {
          emit(FilterLoading());
          final response = await NetworkExecuter.getImages(
              rover: rover,
              sol: event.sol,
              camera: event.camera.toString().split('.').last);
          emit(FilterResult(response));
        } on Exception catch (e) {
          emit(FilterError(e.toString()));
        }
      }
    });
  }
}

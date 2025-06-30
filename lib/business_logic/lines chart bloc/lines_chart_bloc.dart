import 'package:bloc/bloc.dart';
import 'package:salvest_app/data/services/lines%20chart%20services/lines_chart_repo.dart';
import 'lines_chart_event.dart';
import 'lines_chart_state.dart';

class LinesChartBloc extends Bloc<LinesChartEvent, LinesChartState> {
  final LinesChartRepo _repo;
  LinesChartBloc(this._repo) : super(LinesChartInitial()) {
    on<FetchLinesChartEvent>((event, emit) async {
      emit(LinesChartLoading());
      try {
        final resp = await _repo.fetchLinesChart(year: event.year);
        if (resp.data != null) {
          emit(LinesChartLoaded(resp.data!));
        } else {
          emit(LinesChartError('لا توجد بيانات'));
        }
      } catch (e) {
        emit(LinesChartError(e.toString()));
      }
    });
  }
}

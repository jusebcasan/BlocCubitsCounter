import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState()) {
    //La forma _onCounterIncresed sin argumento osea sin parentesis "()" tambien es la misma forma(event, emit) => _onCounterIncresed(event, emit)
    //esto solo se hace porque es la misma cantidad de argumentos que se envia que se recibe
    on<CounterIncresed>(_onCounterIncresed);
    on<CounterReset>(_counterReset);
  }

  void _onCounterIncresed(CounterIncresed event, Emitter<CounterState> emit) {
    emit(
      state.copyWidht(
        counter: state.counter + event.value,
        transactionCount: state.transactionCount + 1,
      ),
    );
  }

  void _counterReset(CounterReset event, Emitter<CounterState> emit) {
    emit(state.copyWidht(counter: 0));
  }
}

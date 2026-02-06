import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitsCounterScreen extends StatelessWidget {
  const CubitsCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  @override
  Widget build(BuildContext context) {
    // final counterState = context.watch<CounterCubit>().state;
    final counterChange = context.read<CounterCubit>();
    return Scaffold(
      appBar: AppBar(
        //otra forma de acceder al estado de un solo widget sin usar el: final counterState = context.watch<CounterCubit>().state;
        title: context.select((CounterCubit value) {
          return Text('Cubit Counter: ${value.state.transactionCount}');
        }),

        actions: [
          IconButton(
            onPressed: () {
              counterChange.reset();
            },
            icon: Icon(Icons.refresh_outlined),
          ),
        ],
      ),
      body: Center(
        //esta es una manera de entrar al state de un solo bloque, de un solo widget
        child: BlocBuilder<CounterCubit, CounterState>(
          //solo se actualiza cuando cambie el valor, para eso el buildWhen con la sintaxis
          // buildWhen: (previous, current) => current.counter != previous.counter,
          builder: (BuildContext context, state) {
            return Text('Counter value: ${state.counter}');
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            child: Text('+3'),
            onPressed: () => counterChange.increaseBy(3),
          ),
          SizedBox(height: 15),
          FloatingActionButton(
            heroTag: '2',
            child: Text('+2'),
            onPressed: () => counterChange.increaseBy(2),
          ),
          SizedBox(height: 15),
          FloatingActionButton(
            heroTag: '3',
            child: Text('+1'),
            onPressed: () => counterChange.increaseBy(1),
          ),
        ],
      ),
    );
  }
}

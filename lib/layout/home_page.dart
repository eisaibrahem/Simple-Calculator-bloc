import 'package:calculator/layout/cubit/cubit.dart';
import 'package:calculator/layout/cubit/states.dart';
import 'package:calculator/shared/components/components.dart';
import 'package:calculator/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

      return BlocProvider(
      create: (BuildContext context)=>CalcCubit(),
      
      child: BlocConsumer<CalcCubit,CalcStates>(
        listener: (context,state){},
        builder: (context,state){
          CalcCubit cubit=CalcCubit.get(context);

          return Scaffold(
            body: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.35,
                    decoration: const BoxDecoration(
                      gradient: defaultGradient,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(cubit.result,
                              style: TextStyle(
                                fontSize: cubit.resultFontSize,
                                color: Colors.white,

                              ),
                            ),
                          ),
                          const SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(cubit.equation,
                              style:TextStyle(
                                fontSize: cubit.equationFontSize,
                                color: Colors.white,

                              ) ,),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Table(
                        children: [
                          TableRow(
                              children: [
                                buildButton(text:'AC',function:(){ cubit.buttonPressed('AC');  },context: context,background: deepWhit,textcolor: Colors.pinkAccent),
                                buildButton(text:'+/_',function:(){ cubit.buttonPressed('(-)');},context:context,background: deepWhit ),
                                buildButton(text:'%',function:(){cubit.buttonPressed('%');     },context:context,background: deepWhit),
                                buildButton(text:'÷',function:(){ cubit.buttonPressed('÷');    },context:context,background: deepWhit),
                              ]
                          ),
                          TableRow(
                              children: [
                                buildButton(text: '7', function: () {cubit.buttonPressed('7');  },context: context ),
                                buildButton(text: '8', function: () {cubit.buttonPressed('8');  },context:context ),
                                buildButton(text: '9', function: () {cubit.buttonPressed('9');  },context:context),
                                buildButton(text: '×', function: () {cubit.buttonPressed('×');  },context:context,background: deepWhit),
                              ]
                          ),
                          TableRow(
                              children: [
                                buildButton(text: '4', function: () {cubit.buttonPressed('4');  },context: context ),
                                buildButton(text: '5', function: () {cubit.buttonPressed('5');  },context:context ),
                                buildButton(text: '6', function: () {cubit.buttonPressed('6');  },context:context),
                                buildButton(text: '-', function: () {cubit.buttonPressed('-');  },context:context,background: deepWhit),
                              ]
                          ),
                          TableRow(
                              children: [
                                buildButton(text: '1', function: () {cubit.buttonPressed('1');  },context: context ),
                                buildButton(text: '2', function: () {cubit.buttonPressed('2');  },context:context ),
                                buildButton(text: '3', function: () {cubit.buttonPressed('3');  },context:context),
                                buildButton(text: '+', function: () {cubit.buttonPressed('+');  },context:context,background: deepWhit),
                              ]
                          ),
                          TableRow(
                              children: [
                                buildButton(text: '0', function: () {cubit.buttonPressed('0');  },context: context ),
                                buildButton(text: '' , function: () {cubit.buttonPressed('');  },context:context ),
                                buildButton(text: ',', function: () {cubit.buttonPressed(',');  },context:context,background: deepWhit),
                                buildButton(text: '=', function: () {cubit.buttonPressed('=');  },context:context,gradient: defaultGradient,textcolor: Colors.white),
                              ]
                          ),

                        ],
                      )

                    ],
                  )
                ],
              ),
            ),
          );

        },

      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myfinance/config/app_config.dart';
import 'package:myfinance/core/presentation/widgets/button.dart';
import 'package:myfinance/core/presentation/widgets/input_field.dart';

import 'package:myfinance/core/presentation/widgets/input_field_on_tap.dart';
import 'package:myfinance/features/registration/presentation/bloc/registration/registration_bloc_bloc.dart';
import 'package:myfinance/services/bloc_observer.dart';

class RegistrationScreen extends StatefulWidget {
  static const routeName = "/registerScreen";
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late final Bloc _bloc;
  @override
  void initState() {
    _bloc = BlocProvider.of<RegistrationBlocBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7E56B3),
      body: _registrationStructre(),
    );
  }

  Widget _registrationStructre() {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.fill),
        ),
        child: SafeArea(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height / 30),
              child: SvgPicture.asset(
                'assets/icons/Logo.svg',
                width: MediaQuery.of(context).size.width / 2.5,
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 20,
                    vertical: MediaQuery.of(context).size.height / 30),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Register",
                      style: TextStyle(
                          color: darkGrey,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 30),
                    ),
                    InputField(
                      widgetWidth: MediaQuery.of(context).size.width,
                      header: "Name",
                      changeState: (value) {
                        _bloc.add(
                          ChangeName(name: value),
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 60),
                    ),
                    InputField(
                      widgetWidth: MediaQuery.of(context).size.width,
                      header: "Initial Saving",
                      keyboardType: TextInputType.number,
                      changeState: (value) {
                        try {
                          double change = double.parse(value);

                          _bloc.add(
                            ChangeInitialSaving(initialSaving: change),
                          );
                        } catch (e) {
                          print(e);
                        }
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 60),
                    ),
                    InputField(
                      widgetWidth: MediaQuery.of(context).size.width,
                      header: "Monthly Income",
                      keyboardType: TextInputType.number,
                      changeState: (value) {
                        try {
                          double monthly = double.parse(value);

                          _bloc.add(
                            ChangeMonthlyIncome(monthlyIncome: monthly),
                          );
                        } catch (e) {
                          print(e);
                        }
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 60),
                    ),
                    BlocBuilder<RegistrationBlocBloc, RegistrationBlocState>(
                      builder: (context, state) {
                        return InputFieldOnTap(
                          widgetWidth: MediaQuery.of(context).size.width,
                          header: "Automatic Add Salary",
                          icon: SvgPicture.asset(
                              "assets/icons/navigationArrow.svg"),
                          onClickEvent: () {
                            if (state.monthlyIncome != null) {}
                          },
                          displayName: state.monthlyIncome == null
                              ? 'Never'
                              : (state.savingOption as AutomaticSavingOption)
                                  .name,
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 60),
                    ),
                    BlocBuilder<RegistrationBlocBloc, RegistrationBlocState>(
                      builder: (context, state) {
                        return InputFieldOnTap(
                          widgetWidth: MediaQuery.of(context).size.width,
                          header: "Pay day",
                          onClickEvent: () {
                            if (state.monthlyIncome != null) {
                              // TODO : Change depending on automatic salary
                            }
                          },
                          displayName: state.monthlyIncome == null
                              ? 'Not applicable'
                              : state.salaryDate != null
                                  ? state.salaryDate.toString()
                                  : "Not applicable",
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 60),
                    ),
                    CustomButton(
                        widgetWidth: MediaQuery.of(context).size.width,
                        widgetHeight: MediaQuery.of(context).size.height,
                        buttonName: "Done",
                        onClickEvent: () {
                          print(_bloc.state.name);
                        }),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

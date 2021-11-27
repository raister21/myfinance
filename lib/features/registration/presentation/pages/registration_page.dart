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
  final bloc = RegistrationBlocBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7E56B3),
      body: SafeArea(
        child: _registrationStructre(),
      ),
    );
  }

  Widget _registrationStructre() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.fill),
      ),
      child: Column(children: [
        SvgPicture.asset('assets/icons/Logo.svg'),
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
                    bloc.add(
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
                  changeState: (value) {
                    bloc.add(
                      ChangeName(name: value),
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 60),
                ),
                InputFieldOnTap(
                  widgetWidth: MediaQuery.of(context).size.width,
                  header: "Automatic Add Salary",
                  icon: SvgPicture.asset("assets/icons/navigationArrow.svg"),
                  onClickEvent: () {},
                  displayName: 'Never',
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 60),
                ),
                InputFieldOnTap(
                  widgetWidth: MediaQuery.of(context).size.width,
                  header: "Pay day",
                  onClickEvent: () {},
                  // TODO : Change depending on automatic salary
                  displayName: 'Not applicable',
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 60),
                ),
                InputField(
                  widgetWidth: MediaQuery.of(context).size.width,
                  header: "Monthly Income",
                  keyboardType: const TextInputType.numberWithOptions(),
                  changeState: (value) {},
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
                      print(bloc.state.name);
                    }),
              ],
            ),
          ),
        )
      ]),
    );
  }
}

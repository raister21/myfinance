import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hive/hive.dart';
import 'package:myfinance/core/config/app_config.dart';
import 'package:myfinance/core/presentation/pages/main_screen.dart';

import 'package:myfinance/core/presentation/widgets/button.dart';
import 'package:myfinance/core/presentation/widgets/input_field.dart';

import 'package:myfinance/core/presentation/widgets/input_field_on_tap.dart';
import 'package:myfinance/core/utils/date_time_util.dart';

import 'package:myfinance/core/presentation/widgets/drop_down.dart';
import 'package:myfinance/features/registration/domain/entities/profile.dart';
import 'package:myfinance/features/registration/presentation/bloc/registration/profile/bloc/profile_bloc.dart';
import 'package:myfinance/services/hive_service.dart';

import '../../../../injection.dart';

class RegistrationScreen extends StatefulWidget {
  static const routeName = "/registerScreen";
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late final Bloc _bloc;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _initialSaving = TextEditingController();
  final TextEditingController _monthlyIncome = TextEditingController();

  final GlobalKey<InputFieldState> _nameKey = GlobalKey<InputFieldState>();
  // GlobalKey<FormFieldState> _initialSavingKey = GlobalKey<FormFieldState>();
  // GlobalKey<FormFieldState> _monthlyIncomeKey = GlobalKey<FormFieldState>();

  late DateTime _payDay;
  late AutomaticSavingOption _savingOption = AutomaticSavingOption.never;

  @override
  void initState() {
    _bloc = BlocProvider.of<ProfileBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileInitialized) {
          _bloc.add(
            InitializeApplicationEvent(),
          );

          int count = 0;
          Navigator.popUntil(context, (route) {
            return count++ == 3;
          });
          Navigator.pushNamed(context, MainScreen.routeName);
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF7E56B3),
        body: _registrationStructre(),
      ),
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
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height / 30),
                            ),
                            InputField(
                              key: _nameKey,
                              controller: _nameController,
                              widgetWidth: MediaQuery.of(context).size.width,
                              header: "Name",
                              requiredField: true,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height / 60),
                            ),
                            InputField(
                              widgetWidth: MediaQuery.of(context).size.width,
                              header: "Initial Saving",
                              keyboardType: TextInputType.number,
                              controller: _initialSaving,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height / 60),
                            ),
                            InputField(
                              widgetWidth: MediaQuery.of(context).size.width,
                              header: "Monthly Income",
                              keyboardType: TextInputType.number,
                              controller: _monthlyIncome,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height / 60),
                            ),
                            DropDown(
                              header: "Automatic Add Salary",
                              items: AutomaticSavingOption.values,
                              widgetWidth: MediaQuery.of(context).size.width,
                              displayText: _monthlyIncome.text.isEmpty
                                  ? 'Never'
                                  : _savingOption.name,
                              disabled: _monthlyIncome.text.isEmpty,
                              callBack: (value) {
                                setState(() {
                                  _savingOption = value;
                                });
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height / 60),
                            ),
                            InputFieldOnTap(
                              widgetWidth: MediaQuery.of(context).size.width,
                              header: "Pay day",
                              onClickEvent: () async {
                                DateTime pickedDate =
                                    await DateTimeUtil().pickDate(context);
                                setState(() {
                                  _payDay = pickedDate;
                                });
                              },
                              displayName: _monthlyIncome.text.isEmpty
                                  ? 'Not applicable'
                                  : _payDay.day.toString(),
                            ),
                          ],
                        ),
                      ),
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
                          bool? valid = _nameKey.currentState?.validate();
                          if (valid ?? false) {
                            _bloc.add(
                              SetProfileInformationEvent(
                                profile: Profile(name: _nameController.text),
                              ),
                            );
                          }
                          // _bloc.add(InitializeApplicationEvent());
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

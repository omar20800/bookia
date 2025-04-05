import 'package:bookia/core/constants/constants.dart';
import 'package:bookia/core/utils/appcolour.dart';
import 'package:bookia/core/utils/input_style.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/core/widgets/dialogs.dart';
import 'package:bookia/core/widgets/input_field.dart';
import 'package:bookia/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:bookia/features/checkout/presentation/cubit/checkout_states.dart';
import 'package:bookia/features/checkout/presentation/screens/checkout_result_screen.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key, required this.total});
  final String total;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final SingleValueDropDownController _governorateController =
      SingleValueDropDownController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CheckoutCubit>(
      create: (context) => CheckoutCubit(),
      child: Form(
        key: _formKey,
        child: BlocConsumer<CheckoutCubit, CheckoutStates>(
          listener: (context, state) {
            if (state is CheckoutSuccessState) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => CheckoutSuccessScreen(
                        goverbId: _governorateController.dropDownValue!.value,
                        name: _nameController.text,
                        phone: _phoneController.text,
                        address: _addressController.text,
                        email: _emailController.text,
                      ),
                ),
                (route) => false,
              );
            } else if (state is CheckoutErrorState) {
              showErrorToast(context, 'Something went wrong');
            } else if (state is CheckoutLoadingState) {
              showLoadingDialog(context);
            }
          },
          builder: (context, state) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
                title: Text('Checkout', style: getHeaderTextStyle()),
                centerTitle: true,
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 25,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    InputField(
                      controller: _nameController,
                      hint: 'Full Name',
                      keyboardType: TextInputType.name,
                      ispassword: false,
                    ),
                    const SizedBox(height: 12),
                    InputField(
                      controller: _emailController,
                      hint: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      ispassword: false,
                    ),
                    const SizedBox(height: 12),
                    InputField(
                      controller: _addressController,
                      hint: 'Address',
                      keyboardType: TextInputType.streetAddress,
                      ispassword: false,
                    ),
                    const SizedBox(height: 12),
                    InputField(
                      controller: _phoneController,
                      hint: 'Phone',
                      keyboardType: TextInputType.phone,
                      ispassword: false,
                    ),
                    const SizedBox(height: 12),
                    DropDownTextField(
                      controller: _governorateController,
                      validator:
                          (value) =>
                              value!.isEmpty ? 'This field is required' : null,
                      dropDownIconProperty: IconProperty(
                        icon: Icons.keyboard_arrow_down,
                      ),
                      dropDownList: AppConstants.governorates,
                      readOnly: true,
                      textFieldDecoration: getInputStyle(hint: 'Governorate'),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total:',
                          style: getBodyTextStyle(color: AppColours.grayColor),
                        ),
                        Text('$total \$', style: getBodyTextStyle()),
                      ],
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      text: 'Submit Order',
                      fontsize: 20,
                      onpressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<CheckoutCubit>().checkout();
                        }
                      },
                      bcolor: AppColours.primaryColor,
                      tcolor: AppColours.backgroundColor,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

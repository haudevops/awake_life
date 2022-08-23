import 'package:awake_life/base/base.dart';
import 'package:awake_life/page/page_export.dart';
import 'package:awake_life/res/colors.dart';
import 'package:awake_life/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends BasePage {
  LoginPage({Key? key}) : super(bloc: LoginBloc());
  static const routeName = '/LoginPage';

  @override
  BasePageState<BasePage<BaseBloc>> getState() => LoginPageState();
}

class LoginPageState extends BasePageState<LoginPage> {
  final FocusNode _focusNodePhoneNumber = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final _formKeyPhone = GlobalKey<FormState>();
  final _formKeyPass = GlobalKey<FormState>();
  final RegExp regExpPhoneNumber = RegExp(r'(^(?:[+0]9)?[0-9]{10,14}$)');
  bool _passwordVisible = false;

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Colors.blueAccent.shade400, Colors.greenAccent.shade200],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  void onCreate() {
    // TODO: implement onCreate
  }

  @override
  void onDestroy() {
    _passController.clear();
    _phoneController.clear();
    _focusNodePhoneNumber.unfocus();
    _focusNodePassword.unfocus();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amberAccent[50],
        width: ScreenUtil.getInstance().screenWidth,
        height: ScreenUtil.getInstance().screenHeight,
        child: ListView(
          shrinkWrap: true,
          padding:
              EdgeInsets.only(top: ScreenUtil.getInstance().getAdapterSize(80)),
          children: [
            SizedBox(
              width: ScreenUtil.getInstance().screenWidth,
              height: 150,
              child:
                  Lottie.asset('assets/img/animate_bg.json', fit: BoxFit.fill),
            ),
            _processLoginWidget(),
          ],
        ),
      ),
    );
  }

  Widget _processLoginWidget() {
    return Padding(
      padding: EdgeInsets.only(
          left: ScreenUtil.getInstance().getAdapterSize(16),
          right: ScreenUtil.getInstance().getAdapterSize(16),
          top: ScreenUtil.getInstance().getAdapterSize(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Login',
              style: TextStyle(
                  fontSize: ScreenUtil.getInstance().getAdapterSize(20))),
          _itemPadding(25),
          Text('Phone Number',
              style: TextStyle(
                  fontSize: ScreenUtil.getInstance().getAdapterSize(16),
                  color: AppColor.colorTextGray)),
          _itemPadding(12),
          _itemInput(
              hintText: 'Enter your phone',
              autoFocus: false,
              focusNode: _focusNodePhoneNumber,
              obscureText: false,
              globalKey: _formKeyPhone,
              onSubmit: (value) {
                _focusNodePhoneNumber.unfocus();
                _focusNodePassword.requestFocus();
              },
              controller: _phoneController,
              keyboardType: TextInputType.number,
              onChange: (value) {},
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Phone number can not be empty';
                } else if (!regExpPhoneNumber.hasMatch(value)) {
                  return 'Invalid phone number';
                }
                return null;
              }),
          _itemPadding(20),
          Text('Password',
              style: TextStyle(
                  fontSize: ScreenUtil.getInstance().getAdapterSize(16),
                  color: AppColor.colorTextGray)),
          _itemPadding(12),
          _itemInput(
              hintText: 'Enter password',
              autoFocus: false,
              focusNode: _focusNodePassword,
              obscureText: !_passwordVisible,
              onSubmit: (value) {
                if (_formKeyPhone.currentState!.validate() &&
                    _formKeyPass.currentState!.validate()) {}
              },
              controller: _passController,
              globalKey: _formKeyPass,
              suffixIcon: IconButton(
                icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),
              onChange: (value) {},
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Password can not be empty';
                }
                return null;
              }),
          _itemPadding(25),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius:  1.0)
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [0.0, 1.0],
                    colors: [
                      Colors.blueAccent.shade400,
                      Colors.greenAccent.shade200,
                    ],
                  ),
                  color: Colors.deepPurple.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all(Size(
                        ScreenUtil.getInstance().getAdapterSize(90),
                        ScreenUtil.getInstance().getAdapterSize(40))),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    elevation: MaterialStateProperty.all(3),
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
                    child: Icon(Icons.power_settings_new),
                  ),
                ),
              ),
            ),
          ),
          _itemPadding(18),
          Center(
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, NavigationPage.routeName);
              },
              onDoubleTap: (){},
              child: Text(
                'Skip this step',
                style: TextStyle(
                    fontSize: ScreenUtil.getInstance().getAdapterSize(14),
                    foreground: Paint()..shader = linearGradient),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _itemPadding(double size) {
    return SizedBox(height: ScreenUtil.getInstance().getAdapterSize(size));
  }

  Widget _itemInput(
      {required String hintText,
      required bool autoFocus,
      required FocusNode focusNode,
      required ValueChanged<String?> onSubmit,
      required ValueChanged<String?> onChange,
      required TextEditingController controller,
      required bool obscureText,
      required GlobalKey globalKey,
      required FormFieldValidator<String> validator,
      TextInputType? keyboardType,
      Widget? suffixIcon}) {
    return Form(
      key: globalKey,
      child: TextFormField(
        autofocus: autoFocus,
        focusNode: focusNode,
        keyboardType: keyboardType,
        onFieldSubmitted: onSubmit,
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(color: Colors.black),
        onChanged: onChange,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Color(0x33101010), width: 1),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Color(0x33101010), width: 1),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(width: 1, color: Colors.red),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            suffixIcon: suffixIcon),
        validator: validator,
      ),
    );
  }
}

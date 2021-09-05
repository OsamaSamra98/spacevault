import 'package:flutter/material.dart';
import 'package:project_spacevault/change_notifiers/Account_change_notifier.dart';
import 'package:project_spacevault/models/accounts.dart';
import 'package:project_spacevault/utlis/SizeConfig.dart';
import 'package:project_spacevault/utlis/helpers.dart';
import 'package:project_spacevault/utlis/newPasswordTextField.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class updatePassword_Screen extends StatefulWidget {
  final Account account ;


  updatePassword_Screen(this.account);

  @override
  _updatePassword_ScreenState createState() => _updatePassword_ScreenState();
}

class _updatePassword_ScreenState extends State<updatePassword_Screen> with Helpers {
  late TextEditingController _titleEditingController;
  late TextEditingController _loginEditingController;
  late TextEditingController _passwordEditingController;
  late TextEditingController _websiteEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleEditingController = TextEditingController(text: widget.account.title);
    _loginEditingController = TextEditingController(text: widget.account.loginAccount);
    _passwordEditingController = TextEditingController(text: widget.account.password);
    _websiteEditingController = TextEditingController(text: widget.account.website);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _websiteEditingController.dispose();
    _loginEditingController.dispose();
    _passwordEditingController.dispose();
    _websiteEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            child: RotatedBox(
              quarterTurns: 0,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: null,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            }),
        title:Text(
          AppLocalizations.of(context)!.editAccount,
          style:
          TextStyle(fontSize: SizeConfig.scaleTextFont(20), color: Colors.white),
        ),
      ),
      backgroundColor: Color(0XFF151718),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: SizeConfig.scaleWidth(20), right: SizeConfig.scaleWidth(20),top: SizeConfig.scaleHeight(72)),
                  child: Container(
                    height: SizeConfig.scaleHeight(640),
                    decoration: BoxDecoration(
                        color: Color(0XFF242627),
                        borderRadius: BorderRadius.circular(40)),
                    child: Container(
                      child: Stack(children: [
                        Column(
                          children: [
                            SizedBox(height: SizeConfig.scaleHeight(70)),
                            Column(
                              children: [
                                newPasswordTextField(
                                  label: AppLocalizations.of(context)!.title,
                                  controller: _titleEditingController,
                                ),
                                newPasswordTextField(
                                  label: AppLocalizations.of(context)!.loginAccount,
                                  controller: _loginEditingController,
                                ),
                                newPasswordTextField(
                                  label: AppLocalizations.of(context)!.password,
                                  controller: _passwordEditingController,
                                ),
                                newPasswordTextField(
                                  label: AppLocalizations.of(context)!.website,
                                  controller: _websiteEditingController,
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(left: SizeConfig.scaleWidth(30),right: SizeConfig.scaleWidth(30)),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      performSave();
                                    },
                                    child: Text(
                                      AppLocalizations.of(context)!.save,
                                      style: TextStyle(color: Colors.black, letterSpacing: 2),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        primary: Color(0XFF72D5FF),
                                        minimumSize: Size(double.infinity, 60),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30))),
                                  ),
                                ),

                              ],
                            )
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
                bottom: SizeConfig.scaleHeight(600),
                left: SizeConfig.scaleWidth(147),
                right: SizeConfig.scaleWidth(147),
                child:Container(
                    width: SizeConfig.scaleWidth(80), height: SizeConfig.scaleHeight(80),

                    child: Image.asset('images/${account.title}.png',fit: BoxFit.contain,)),
            ),
    ],
        ),
      ),
    );
  }

  Future performSave() async {
    if (checkData()) {
      await saveAccount();
    }
  }

  bool checkData() {
    if (_titleEditingController.text.isNotEmpty &&
        _loginEditingController.text.isNotEmpty &&
        _passwordEditingController.text.isNotEmpty &&
        _websiteEditingController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(context, AppLocalizations.of(context)!.enterRequireddata, error: true);

    return false;
  }

  Future saveAccount() async {
    bool inserted =
        await Provider.of<AccountChangeNotifier>(context, listen: false).update(account);
    if (inserted) {
      showSnackBar(context, AppLocalizations.of(context)!.accountsaved);
    } else {
      showSnackBar(context, AppLocalizations.of(context)!.failedtoSave, error: true);
    }
  }

  Account get account {
    Account account = widget.account;
    account.title = _titleEditingController.text;
    account.loginAccount = _loginEditingController.text;
    account.password = _passwordEditingController.text;
    account.website = _websiteEditingController.text;
    return account;
  }


}

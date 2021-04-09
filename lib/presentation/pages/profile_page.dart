import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../aplication/auth/auth_bloc.dart';
import '../../aplication/auth/sign_in/sign_form_bloc.dart';
import '../../aplication/profile_bloc/profile_form_bloc.dart';
import '../../core/localization/localizations.dart';
import '../widgets/profile_page_widgets/profile_field_widget.dart';
import '../widgets/profile_page_widgets/profile_item_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage();
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isReadOnly = true;
  final FocusNode _node = FocusNode();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String pageName = ModalRoute.of(context).settings.arguments;

    return BlocConsumer<ProfileFormBloc, ProfileFormState>(
      listenWhen: (p, c) => p.props != c.props,
      listener: (context, state) {
        if (state is ProfileFormError) {
          _node.unfocus();
          Flushbar(
           // flushbarPosition: FlushbarPosition.TOP,
            duration: const Duration(seconds: 3),
            message: 'Service Error',
          ).show(context);
          context
              .read<ProfileFormBloc>()
              .add(FirstNameChanged(state.profile.firstName));
        }
      },
      builder: (context, state) {
        final profile = state.profile;
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              pageName,
              style: const TextStyle(fontSize: 18),
            ),
            backgroundColor: Colors.green,
            elevation: 0,
            actions: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 3000),
                child: IconButton(
                  icon: Icon(isReadOnly ? Icons.edit : Icons.save),
                  onPressed: () {
                    setState(() {
                      isReadOnly = !isReadOnly;
                    });
                    if (isReadOnly) {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        _formKey.currentState.context
                            .read<ProfileFormBloc>()
                            .add(SaveProfileData(profile));
                      }
                    } else {
                      _node.requestFocus();
                    }
                  },
                ),
              )
            ],
          ),
          body: Container(
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Container(
                  color: Colors.white,
                  child: Stack(
                    children: [
                      Container(
                        child: ListView(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * .858,
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 10, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      NewWidget(
                                          profile: profile,
                                          isEdit: !isReadOnly),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                child: Form(
                                                  key: _formKey,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        AppLocalizations.of(
                                                                context)
                                                            .translate(
                                                                'firstname'),
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Container(
                                                        child: TextFormField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .name,
                                                          initialValue:
                                                              profile.firstName,
                                                          focusNode: _node,
                                                          decoration:
                                                              const InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                          ),
                                                          onChanged: (val) {
                                                            context
                                                                .read<
                                                                    ProfileFormBloc>()
                                                                .add(
                                                                    FirstNameChanged(
                                                                        val));
                                                          },
                                                          readOnly: isReadOnly,
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 20.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const Divider(),
                                              Container(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      AppLocalizations.of(
                                                              context)
                                                          .translate(
                                                              'lastname'),
                                                      style: const TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                    Container(
                                                      child: TextFormField(
                                                        keyboardType:
                                                            TextInputType.name,
                                                        initialValue:
                                                            profile.lastName,
                                                        decoration:
                                                            const InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none),
                                                        onChanged: (val) {
                                                          context
                                                              .read<
                                                                  ProfileFormBloc>()
                                                              .add(
                                                                  LastNameChanged(
                                                                      val));
                                                        },
                                                        readOnly: isReadOnly,
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 20.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Email',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        Container(
                                          child: TextFormField(
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            initialValue: profile.email,
                                            decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                focusColor: Colors.red),
                                            onChanged: (val) {
                                              context
                                                  .read<ProfileFormBloc>()
                                                  .add(EmailChanged(val));
                                            },
                                            readOnly: isReadOnly,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Divider(),
                                  ProfileFieldWidget(
                                    labelText: AppLocalizations.of(context)
                                        .translate('phone'),
                                    isEdit: !isReadOnly,
                                  ),
                                  const Divider(),
                                  const Expanded(
                                    child: SizedBox(),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          context
                                              .read<SignFormBloc>()
                                              .add(SignOutEvent());
                                          context
                                              .read<AuthBloc>()
                                              .add(SignOut());
                                        },
                                        child: Text(AppLocalizations.of(context)
                                            .translate('logout')),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
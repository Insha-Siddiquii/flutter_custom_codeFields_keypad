import 'package:flutter/material.dart';

import 'key_pad_widget.dart';

class CustomFormFields extends StatefulWidget {
  const CustomFormFields({Key? key}) : super(key: key);

  @override
  State<CustomFormFields> createState() => _CustomFormFieldsState();
}

class _CustomFormFieldsState extends State<CustomFormFields> {
  TextEditingController fieldOneCtrl = TextEditingController();
  TextEditingController fieldTwoCtrl = TextEditingController();
  TextEditingController fieldThreeCtrl = TextEditingController();
  TextEditingController fieldFourCtrl = TextEditingController();
  final _form = GlobalKey<FormState>();
  final FocusNode _focusNodeOne = FocusNode();
  final FocusNode _focusNodeTwo = FocusNode();
  final FocusNode _focusNodeThree = FocusNode();
  final FocusNode _focusNodeFourth = FocusNode();
  final List<Color> _focusColor = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white
  ];
  bool otpFailed = false;

  @override
  void initState() {
    super.initState();

    _focusNodeOne.addListener(() {
      if (_focusNodeOne.hasFocus) {
        setState(() {
          _focusColor[0] = const Color(0xffe6f5ff);
        });
      } else {
        setState(() {
          _focusColor[0] = Colors.white;
        });
      }
    });
    _focusNodeTwo.addListener(() {
      if (_focusNodeTwo.hasFocus) {
        setState(() {
          _focusColor[1] = const Color(0xffe6f5ff);
        });
      } else {
        setState(() {
          _focusColor[1] = Colors.white;
        });
      }
    });
    _focusNodeThree.addListener(() {
      if (_focusNodeThree.hasFocus) {
        setState(() {
          _focusColor[2] = const Color(0xffe6f5ff);
        });
      } else {
        setState(() {
          _focusColor[2] = Colors.white;
        });
      }
    });
    _focusNodeFourth.addListener(() {
      if (_focusNodeFourth.hasFocus) {
        setState(() {
          _focusColor[3] = const Color(0xffe6f5ff);
        });
      } else {
        setState(() {
          _focusColor[3] = Colors.white;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focusNodeOne.dispose();
    _focusNodeTwo.dispose();
    _focusNodeThree.dispose();
    _focusNodeFourth.dispose();
  }

  _fillTheField(String value) {
    if (fieldOneCtrl.text.isEmpty && !_focusNodeOne.hasFocus) {
      _focusNodeOne.requestFocus();
      fieldOneCtrl.text = value;
      _focusNodeTwo.requestFocus();
    } else if (_focusNodeOne.hasFocus) {
      fieldOneCtrl.text = value;
      _focusNodeTwo.requestFocus();
    } else if (_focusNodeTwo.hasFocus) {
      fieldTwoCtrl.text = value;
      _focusNodeThree.requestFocus();
    } else if (_focusNodeThree.hasFocus) {
      fieldThreeCtrl.text = value;
      _focusNodeFourth.requestFocus();
    } else {
      fieldFourCtrl.text = value;
      _focusNodeFourth.unfocus();
    }
  }

  _removeTheFieldDigit() {
    if (_focusNodeOne.hasFocus) {
      fieldOneCtrl.text = "";
    } else if (_focusNodeTwo.hasFocus) {
      fieldTwoCtrl.text = "";
    } else if (_focusNodeThree.hasFocus) {
      fieldThreeCtrl.text = "";
    } else {
      fieldFourCtrl.text = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Form(
          key: _form,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 70,
                  width: 70,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: fieldOneCtrl,
                    textAlign: TextAlign.center,
                    focusNode: _focusNodeOne,
                    maxLength: 1,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: fieldOneCtrl.text.length == 1 &&
                              _focusNodeOne.hasFocus
                          ? Colors.blue
                          : Colors.black,
                    ),
                    decoration: InputDecoration(
                      counterText: "",
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      enabled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(
                          color: otpFailed ? Colors.red : Colors.black,
                        ),
                      ),
                      filled: true,
                      fillColor: _focusColor[0],
                    ),
                    onChanged: (value) {
                      if (value.length == 1) {
                        _focusNodeTwo.requestFocus();
                      }
                    },
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  height: 70,
                  width: 70,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: fieldTwoCtrl,
                    textAlign: TextAlign.center,
                    focusNode: _focusNodeTwo,
                    maxLength: 1,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: fieldTwoCtrl.text.length == 1 &&
                              _focusNodeTwo.hasFocus
                          ? Colors.blue
                          : Colors.black,
                    ),
                    decoration: InputDecoration(
                      counterText: "",
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      enabled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(
                          color: otpFailed ? Colors.red : Colors.black,
                        ),
                      ),
                      filled: true,
                      fillColor: _focusColor[1],
                    ),
                    onChanged: (value) {
                      if (value.length == 1) {
                        _focusNodeThree.requestFocus();
                      }
                    },
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  height: 70,
                  width: 70,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: fieldThreeCtrl,
                    textAlign: TextAlign.center,
                    focusNode: _focusNodeThree,
                    maxLength: 1,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: fieldThreeCtrl.text.length == 1 &&
                              _focusNodeThree.hasFocus
                          ? Colors.blue
                          : Colors.black,
                    ),
                    decoration: InputDecoration(
                      counterText: "",
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      enabled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(
                          color: otpFailed ? Colors.red : Colors.black,
                        ),
                      ),
                      filled: true,
                      fillColor: _focusColor[2],
                    ),
                    onChanged: (value) {
                      if (value.length == 1) {
                        _focusNodeFourth.requestFocus();
                      }
                    },
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  height: 70,
                  width: 70,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: fieldFourCtrl,
                    textAlign: TextAlign.center,
                    focusNode: _focusNodeFourth,
                    maxLength: 1,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: fieldFourCtrl.text.length == 1 &&
                              _focusNodeFourth.hasFocus
                          ? Colors.blue
                          : Colors.black,
                    ),
                    decoration: InputDecoration(
                      counterText: "",
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      enabled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(
                          color: otpFailed ? Colors.red : Colors.black,
                        ),
                      ),
                      filled: true,
                      fillColor: _focusColor[3],
                    ),
                    onChanged: (value) {
                      if (value.length == 1) {
                        _focusNodeFourth.unfocus();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Wrap(
            spacing: 80,
            runSpacing: 20,
            children: [
              KeyPadWidget(
                digit: "1",
                onTap: (value) {
                  _fillTheField(value);
                },
              ),
              KeyPadWidget(
                digit: "2",
                onTap: (value) {
                  _fillTheField(value);
                },
              ),
              KeyPadWidget(
                digit: "3",
                onTap: (value) {
                  _fillTheField(value);
                },
              ),
              KeyPadWidget(
                digit: "4",
                onTap: (value) {
                  _fillTheField(value);
                },
              ),
              KeyPadWidget(
                digit: "5",
                onTap: (value) {
                  _fillTheField(value);
                },
              ),
              KeyPadWidget(
                digit: "6",
                onTap: (value) {
                  _fillTheField(value);
                },
              ),
              KeyPadWidget(
                digit: "7",
                onTap: (value) {
                  _fillTheField(value);
                },
              ),
              KeyPadWidget(
                digit: "8",
                onTap: (value) {
                  _fillTheField(value);
                },
              ),
              KeyPadWidget(
                digit: "9",
                onTap: (value) {
                  _fillTheField(value);
                },
              ),
              Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
              ),
              KeyPadWidget(
                digit: "0",
                onTap: (value) {
                  _fillTheField(value);
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.backspace_outlined,
                  size: 32,
                  color: Color.fromARGB(255, 114, 111, 111),
                ),
                onPressed: () {
                  _removeTheFieldDigit();
                },
              )
            ],
          ),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          style:
              ElevatedButton.styleFrom(fixedSize: Size(size.width * 0.85, 60)),
          onPressed: () {
            setState(() {
              otpFailed = true;
            });
          },
          child: const Text(
            'Recover Password',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}

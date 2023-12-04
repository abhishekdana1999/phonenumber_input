import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phonenumber_input/src/countrycode_selector.dart';

class PhoneNumberInput extends StatefulWidget {
  const PhoneNumberInput({super.key, 
    required this.labelText,
    this.padding,
    this.labelStyle,
    this.countryCodeStyle,
    this.isDarkMode = false,
    this.onCountryCodeChanged,
    this.onPhoneNumberChanged,
  });

  final String labelText;
  final EdgeInsetsGeometry? padding;
  final TextStyle? labelStyle;
  final TextStyle? countryCodeStyle;
  final bool isDarkMode; 
  final Function(String)? onCountryCodeChanged;
  final Function(String)? onPhoneNumberChanged;

  @override
  State<PhoneNumberInput> createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {

  Map<String,dynamic> selectedCountry = {"name": "India", "flag": "🇮🇳", "code": "IN", "dial_code": "+91"};

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.labelText , style: widget.labelStyle ?? TextStyle(
            color: widget.isDarkMode ? Colors.white : const Color.fromRGBO(46, 46, 46, 1),
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4),
                      bottomLeft: Radius.circular(4),
                    ),
                  ),
                  child: InkWell(
                    onTap: ()  async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CountryCodeSelector(
                            darkModeOn: widget.isDarkMode,
                          ),
                        ),
                      ); 
                      if(result != null) {
                        setState(() {
                          selectedCountry = result;
                          widget.onCountryCodeChanged?.call(selectedCountry['dial_code']);
                        });
                      }
                    },
                    child: Center(
                      child: Text("${selectedCountry['code']} ${selectedCountry['dial_code']}" , style: widget.countryCodeStyle ?? TextStyle(
                        color: widget.isDarkMode ? Colors.white : const Color.fromRGBO(46, 46, 46, 1),
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Color.fromRGBO(224, 224, 224, 1)),
                      bottom: BorderSide(color: Color.fromRGBO(224, 224, 224, 1)),
                      right: BorderSide(color: Color.fromRGBO(224, 224, 224, 1)),
                    ),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(4),
                      bottomRight: Radius.circular(4),
                    ),
                  ),
                  child: TextFormField(
                      keyboardType: TextInputType.phone,
                      style: TextStyle(
                        color: widget.isDarkMode ? Colors.white : const Color.fromRGBO(46, 46, 46, 1),
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                      onChanged: (value) => widget.onPhoneNumberChanged?.call(value),
                      decoration:  const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Phone Number",
                        hintStyle:  TextStyle(
                          color:  Color.fromRGBO(224, 224, 224, 1),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      ),
                    )
                ),
              ),
            ],
          )
        ],
      )
    );
  }
}

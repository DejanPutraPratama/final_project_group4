import 'package:final_project_group4/navbar/navbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:final_project_group4/model/ewalletmodel.dart';
import 'package:flutter/services.dart';
import 'package:final_project_group4/services/redeem_service.dart';
import 'waitingredeem.dart';

class RedeemPaymentPage extends StatefulWidget {
  final EWallet ewallet;
  final int userPoints;
  final String userId;

  const RedeemPaymentPage(
      {super.key,
      required this.ewallet,
      required this.userPoints,
      required this.userId});

  @override
  State<RedeemPaymentPage> createState() => _RedeemPaymentPageState();
}

class _RedeemPaymentPageState extends State<RedeemPaymentPage> {
  bool _isChecked = false;
  final _phoneNumberController = TextEditingController();
  final _amountController = TextEditingController();
  String? _errorMessage;
  final RedeemService _redeemService = RedeemService();

  final NavbarController navbarController = Get.find<NavbarController>();

  @override
  void initState() {
    super.initState();
    _phoneNumberController.addListener(_validateFields);
    _amountController.addListener(_validateFields);
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  Future<void> _redeemPoints() async {
    int amount = int.tryParse(_amountController.text) ?? 0;

    if (amount < 10000) {
      setState(() {
        _errorMessage = 'The minimum amount to redeem is 10,000.';
      });
    } else if (amount > widget.userPoints) {
      setState(() {
        _errorMessage = 'The amount cannot exceed your available points.';
      });
    } else {
      setState(() {
        _errorMessage = null;
      });

      try {
        await _redeemService.redeemPoints(
          userId: widget.userId,
          phoneNumber: _phoneNumberController.text,
          paymentMethod: widget.ewallet.name,
          amount: amount,
        );

        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const WaitingRedeem()),
        );
      } catch (e) {
        setState(() {
          _errorMessage = 'Failed to submit redeem request. Please try again.';
        });
      }
    }
  }

  void _validateFields() {
    setState(() {});
  }

  bool get _isButtonEnabled {
    return _isChecked &&
        _phoneNumberController.text.isNotEmpty &&
        _amountController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            navbarController.showBottomNav();
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
        title: Text(
          'Redeem',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF5E3023),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Selected E-Wallet: ',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF5E3023),
                            ),
                          ),
                        ),
                        Text(
                          widget.ewallet.name,
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Divider(height: 1, thickness: 1, color: Colors.grey),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Phone Number',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: _phoneNumberController,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey[400]!,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.phone,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Amount',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: _amountController,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey[400]!,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: _isChecked,
                          onChanged: (value) {
                            setState(() {
                              _isChecked = value ?? false;
                            });
                          },
                        ),
                        const Expanded(
                          child: Text(
                            'By ticking, you confirm that all the data you inputted is correct. If any data is found to be false, it is outside our responsibility.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: _isButtonEnabled ? _redeemPoints : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF55883B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      child: const Text(
                        'Redeem Points',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    if (_errorMessage != null) ...[
                      const SizedBox(height: 20),
                      Text(
                        _errorMessage!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

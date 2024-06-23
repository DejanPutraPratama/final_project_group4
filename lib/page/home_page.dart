import 'package:final_project_group4/utils/custom_colors.dart';
import 'package:final_project_group4/widget/custom_widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final CustomWidgets customWidgets = CustomWidgets();
    final CustomColors customColors = CustomColors();
    double deviceWidth = MediaQuery.sizeOf(context).width;
    double deviceHeight = MediaQuery.sizeOf(context).height;
    String? selectedItem;

    void dropdownCallback(String? selectedValue) {
      if (selectedValue is String) {
        selectedItem = selectedValue;
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: deviceWidth,
              height: 200,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(230, 240, 220, 1),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: deviceWidth * 0.2,
                    top: deviceHeight * 0.1,
                    child: customWidgets.lightGreenCircle(
                        deviceWidth, deviceHeight),
                  ),
                  Positioned(
                    left: -10,
                    top: deviceHeight * 0.15,
                    child: customWidgets.greenCircle(deviceWidth, deviceHeight),
                  ),
                  Positioned(
                    width: deviceWidth,
                    height: 250,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Welcome, John Doe",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: customColors.redText),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Better environment, better tommorow\n-Unknown-",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: customColors.redText),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            customWidgets.greyBox(
                deviceWidth * 0.9,
                75,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Your Balance Point",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("100000 pts",
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                )),
            customWidgets.greyBox(
                deviceWidth * 0.9,
                180,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Destination Landfill",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    customWidgets.greyBox(
                      deviceWidth * 0.8,
                      50,
                      DropdownButtonFormField<String>(
                          value: selectedItem,
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                          isExpanded: true,
                          hint: const Text('Please select location'),
                          icon: const Icon(Icons.keyboard_arrow_down_rounded),
                          items: const [
                            DropdownMenuItem<String>(
                              value: 'Jakarta',
                              child: Text('Jakarta'),
                            ),
                            DropdownMenuItem<String>(
                              value: 'Serang',
                              child: Text("Serang"),
                            ),
                            DropdownMenuItem<String>(
                              value: 'Tangerang',
                              child: Text("Tangerang"),
                            ),
                            DropdownMenuItem<String>(
                              value: 'Yogyakarta',
                              child: Text("Yogyakarta"),
                            )
                          ],
                          onChanged: dropdownCallback),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Feel like to dispose today?',
                          style: TextStyle(fontSize: 12),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 20),
                                elevation: 0,
                                backgroundColor: customColors.darkGreen,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: const Text(
                              'Donate Now',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ))
                      ],
                    )
                  ],
                )),
            customWidgets.greyBox(
                deviceWidth * 0.9,
                300,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Instruction',
                      style: TextStyle(
                          color: customColors.redText,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 250,
                      child: GridView.count(
                        childAspectRatio: 1.0,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                'assets/trash.png',
                                height: 75,
                              ),
                              const Text(
                                'Sort your waste',
                                style: TextStyle(
                                    fontSize: 8, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(
                                'assets/location.png',
                                scale: 2,
                                height: 75,
                              ),
                              const Text('Send to nearest landfill',
                                  style: TextStyle(
                                      fontSize: 8, fontWeight: FontWeight.bold))
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(
                                'assets/verified.png',
                                scale: 2,
                                height: 50,
                              ),
                              const Text('Wait for verification and get points',
                                  style: TextStyle(
                                      fontSize: 8, fontWeight: FontWeight.bold))
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(
                                'assets/money.png',
                                scale: 2,
                                height: 50,
                              ),
                              const Text('Excange points to e-wallet',
                                  style: TextStyle(
                                      fontSize: 8, fontWeight: FontWeight.bold))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            customWidgets.greyBox(
                deviceWidth * 0.9,
                200,
                Row(
                  children: [
                    Image.asset(
                      'assets/person.png',
                      scale: 1.5,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: deviceWidth * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Congratulation! you have already sort and dispose the waste with total of',
                            style: TextStyle(
                                color: customColors.redText,
                                fontWeight: FontWeight.bold),
                          ),
                          RichText(
                              text: const TextSpan(children: [
                            TextSpan(
                                text: '15',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 36,
                                    fontWeight: FontWeight.w900)),
                            TextSpan(
                                text: 'kg',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold))
                          ]))
                        ],
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}

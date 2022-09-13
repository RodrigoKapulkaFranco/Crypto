import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  bool visible = true;

  final userMoneyBitcoin = 6557;
  final userMoneyEthereum = 7996;
  final userMoneylitecoin = 245;

  final bitcoinValue = 113996.3;
  final ethereumValue = 8906.66;
  final litecoinValue = 315.52;

  final numberFormat = NumberFormat.currency(
    locale: "pt_BR",
    decimalDigits: 2,
    name: "R\$",
  );

  @override
  Widget build(BuildContext context) {
    final userTotalMoney =
        userMoneyBitcoin + userMoneyEthereum + userMoneylitecoin;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 5.0,
              top: 32.0,
              bottom: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Cripto",
                          style: TextStyle(
                            color: Color.fromRGBO(224, 43, 87, 1),
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            visible = !visible;
                            setState(() {});
                          },
                          icon: visible
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Visibility(
                      visible: visible,
                      replacement: ImageFiltered(
                        imageFilter: ImageFilter.blur(
                          sigmaX: 15,
                          sigmaY: 15,
                        ),
                        child: Text(
                          numberFormat.format(userTotalMoney),
                          style: const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      child: Text(
                        numberFormat.format(userTotalMoney),
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Text(
                      "Valor total de moedas",
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: [
              const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset("images/BTC.png"),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Visibility(
                          visible: visible,
                          replacement: ImageFiltered(
                            imageFilter: ImageFilter.blur(
                              sigmaX: 15,
                              sigmaY: 15,
                            ),
                            child: Text(
                              numberFormat.format(userMoneyBitcoin),
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          child: Text(
                            numberFormat.format(userMoneyBitcoin),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "${(userMoneyBitcoin / bitcoinValue).toStringAsFixed(2)} BTC",
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                title: const Text(
                  "BTC",
                  // "ETH",
                  style: TextStyle(fontSize: 25),
                ),
                subtitle: const Text(
                  "Bitcoin",
                  // "Ethereum",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 15,
                  ),
                ),
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset("images/ETH.png"),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Visibility(
                          visible: visible,
                          replacement: ImageFiltered(
                            imageFilter: ImageFilter.blur(
                              sigmaX: 15,
                              sigmaY: 15,
                            ),
                            child: Text(
                              numberFormat.format(userMoneyEthereum),
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          child: Text(
                            numberFormat.format(userMoneyEthereum),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "${(userMoneyEthereum / ethereumValue).toStringAsFixed(2)} ETH",
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                title: const Text(
                  "ETH",
                  style: TextStyle(fontSize: 25),
                ),
                subtitle: const Text(
                  "Ethereum",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 15,
                  ),
                ),
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset("images/LTC.png"),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Visibility(
                          visible: visible,
                          replacement: ImageFiltered(
                            imageFilter: ImageFilter.blur(
                              sigmaX: 15,
                              sigmaY: 15,
                            ),
                            child: Text(
                              numberFormat.format(userMoneylitecoin),
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          child: Text(
                            numberFormat.format(userMoneylitecoin),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "${(userMoneylitecoin / litecoinValue).toStringAsFixed(2)} LTC",
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                title: const Text(
                  "LTC",
                  style: TextStyle(fontSize: 25),
                ),
                subtitle: const Text(
                  "Litecoin",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

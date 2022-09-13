import 'dart:ui';

import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  bool visible = true;

  final userAmountBitcoin = Decimal.parse('0.65');
  final userAmountEthereum = Decimal.parse('0.94');
  final userAmountlitecoin = Decimal.parse('0.82');

  // Valores de 13/09/222
  final bitcoinValue = Decimal.parse('109521.93');
  final ethereumValue = Decimal.parse('8316.04');
  final litecoinValue = Decimal.parse('328,57');

  final numberFormat = NumberFormat.currency(
    locale: "pt_BR",
    decimalDigits: 2,
    name: "R\$",
  );

  @override
  Widget build(BuildContext context) {
    final userMoneyBitcoin = userAmountBitcoin * bitcoinValue;
    final userMoneyEthereum = userAmountEthereum * ethereumValue;
    final userMoneylitecoin = userAmountlitecoin * litecoinValue;
    final userTotalMoney =
        userMoneyBitcoin + userMoneyEthereum + userAmountlitecoin;
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
                          numberFormat.format(DecimalIntl(userTotalMoney)),
                          style: const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      child: Text(
                        numberFormat.format(DecimalIntl(userTotalMoney)),
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
                              numberFormat
                                  .format(DecimalIntl(userMoneyBitcoin)),
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          child: Text(
                            numberFormat.format(DecimalIntl(userMoneyBitcoin)),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "${userAmountBitcoin.toStringAsFixed(2)} BTC",
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
                              numberFormat
                                  .format(DecimalIntl(userMoneyEthereum)),
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          child: Text(
                            numberFormat.format(DecimalIntl(userMoneyEthereum)),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "${userAmountEthereum.toStringAsFixed(2)} ETH",
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
                              numberFormat
                                  .format(DecimalIntl(userMoneylitecoin)),
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          child: Text(
                            numberFormat.format(DecimalIntl(userMoneylitecoin)),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "${userAmountlitecoin.toStringAsFixed(2)} LTC",
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

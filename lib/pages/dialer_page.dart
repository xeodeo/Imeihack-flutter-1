import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

class DialerPage extends StatefulWidget {
  const DialerPage({super.key});

  @override
  State<DialerPage> createState() => _DialerPageState();
}

class _DialerPageState extends State<DialerPage> {
  String numeroMarcado = '';
  final String codigoSecreto = '*#06#';

  void agregarNumero(String valor) {
    setState(() {
      numeroMarcado += valor;
    });

    if (numeroMarcado == codigoSecreto) {
      Future.delayed(const Duration(milliseconds: 200), () {
        mostrarModalImei();
      });
    }
  }

  void borrarUltimo() {
    if (numeroMarcado.isNotEmpty) {
      setState(() {
        numeroMarcado = numeroMarcado.substring(0, numeroMarcado.length - 1);
      });
    }
  }

  void mostrarModalImei() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1A1A1A),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'IMEI(MEID) and S/N',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),

// IMEI1
                Text('IMEI1',
                    style: TextStyle(color: Colors.white54, fontSize: 14)),
                const SizedBox(height: 4),
                Text('867157050263375 / 01',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                const SizedBox(height: 12),
                Image.asset(
                  'assets/images/imei_barcode1.png',
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),

                const SizedBox(height: 24),

                Text('IMEI2',
                    style: TextStyle(color: Colors.white54, fontSize: 14)),
                const SizedBox(height: 4),
                Text('867157050268374 / 01',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                const SizedBox(height: 12),
                Image.asset(
                  'assets/images/imei_barcode2.png',
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),

                const SizedBox(height: 24),

                Text('S/N',
                    style: TextStyle(color: Colors.white54, fontSize: 14)),
                const SizedBox(height: 4),
                Text('320325104158',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                const SizedBox(height: 12),
                Image.asset(
                  'assets/images/imei_barcode3.png',
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),

                // EID
                // Text('EID',
                //     style: TextStyle(color: Colors.white54, fontSize: 14)),
                // const SizedBox(height: 4),
                // Text('89033023456789012345678901234567',
                //     style: TextStyle(color: Colors.white, fontSize: 16)),
                // const SizedBox(height: 12),
                // BarcodeWidget(
                //   barcode: Barcode.code128(),
                //   data: '89033023456789012345678901234567',
                //   width: double.infinity,
                //   height: 80,
                //   drawText: false,
                //   color: Colors.black,
                //   backgroundColor: Colors.white,
                // ),

                // const SizedBox(height: 24),

                // S/N
                // Text('S/N',
                //     style: TextStyle(color: Colors.white54, fontSize: 14)),
                // const SizedBox(height: 4),
                // Text('R58N35ABC123',
                //     style: TextStyle(color: Colors.white, fontSize: 16)),
                // const SizedBox(height: 12),
                // BarcodeWidget(
                //   barcode: Barcode.code128(),
                //   data: 'R58N35ABC123',
                //   width: double.infinity,
                //   height: 80,
                //   drawText: false,
                //   color: Colors.black,
                //   backgroundColor: Colors.white,
                // ),

                const SizedBox(height: 32),

                Center(
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(
                      'Aceptar',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildDialButton(String numero, [String? letras]) {
    return Expanded(
      child: InkWell(
        onTap: () => agregarNumero(numero),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: Column(
            children: [
              Text(numero,
                  style: const TextStyle(fontSize: 32, color: Colors.white)),
              if (letras != null)
                Text(letras,
                    style: const TextStyle(
                        fontSize: 12, color: Colors.white70, height: 1.5)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDialRow(List<Map<String, String?>> teclas) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: teclas
          .map((tecla) => buildDialButton(tecla['num']!, tecla['letras']))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final lila = const Color(0xFFC3A6E0);
    final escribiendo = numeroMarcado.isNotEmpty;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(''),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.search, color: Color(0xFFC3A6E0)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.more_vert, color: Color(0xFFC3A6E0)),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (numeroMarcado.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Center(
                        child: Text(
                          numeroMarcado,
                          style: const TextStyle(
                              fontSize: 36, color: Colors.white),
                        ),
                      ),
                    ),
                  const SizedBox(height: 8),
                  buildDialRow([
                    {'num': '1', 'letras': 'QO'},
                    {'num': '2', 'letras': 'ABC'},
                    {'num': '3', 'letras': 'DEF'},
                  ]),
                  buildDialRow([
                    {'num': '4', 'letras': 'GHI'},
                    {'num': '5', 'letras': 'JKL'},
                    {'num': '6', 'letras': 'MNO'},
                  ]),
                  buildDialRow([
                    {'num': '7', 'letras': 'PQRS'},
                    {'num': '8', 'letras': 'TUV'},
                    {'num': '9', 'letras': 'WXYZ'},
                  ]),
                  buildDialRow([
                    {'num': '*', 'letras': null},
                    {'num': '0', 'letras': '+'},
                    {'num': '#', 'letras': null},
                  ]),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(width: 60),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: lila,
                        child: IconButton(
                          icon: const Icon(Icons.call, color: Colors.white),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        child: escribiendo
                            ? IconButton(
                                onPressed: borrarUltimo,
                                icon: const Icon(Icons.backspace_outlined),
                                iconSize: 28,
                                color: Colors.white,
                              )
                            : null,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
          if (!escribiendo)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Text("Teclado",
                          style: TextStyle(
                              color: Color(0xFFC3A6E0),
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                      Container(
                        width: 30,
                        height: 2,
                        color: const Color(0xFFC3A6E0),
                        margin: const EdgeInsets.only(top: 4),
                      )
                    ],
                  ),
                  const Text("Recientes",
                      style: TextStyle(color: Colors.white70, fontSize: 14)),
                  const Text("Contactos",
                      style: TextStyle(color: Colors.white70, fontSize: 14)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:shopgo/config/routes/app_route.gr.dart';
import 'package:shopgo/src/services/firebase/auth/singup_service.dart';
import 'package:auto_route/auto_route.dart';
import 'TermsAndConditionsPage.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  _RegisterScreenState();

  bool showProgress = false;
  bool visible = false;
  bool acceptedTerms = false;

  final _formkey = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpassController = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobile = TextEditingController();
  bool _isObscure = true;
  bool _isObscure2 = true;

  File? file;
  var options = [
    'Usuario',
    'Motorista',
  ];
  var _currentItemSelected = "Usuario";
  var rool = "Usuario";

  var optionsPlan = [
    'basic',
    'premium',
  ];
  var _currentItemSelectedPlan = "basic";
  var plan = "basic";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 28, 75, 30),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: const Color.fromARGB(255, 28, 75, 30),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(12),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 80,
                        ),
                        const Text(
                          "Registrarse Ahora",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 40,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        TextFormField(
                          controller: emailController,
                          maxLength: 20, //Establecer el limite de caracteres
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Email',
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          validator: (value) {
                            // ignore: prefer_is_empty
                            if (value!.length == 0) {
                              return "El correo electrónico no puede estar vacío.";
                            }
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Por favor introduzca una dirección de correo electrónico válida");
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: _isObscure,
                          controller: passwordController,
                          maxLength: 10, //Establecer el limite de caracteres
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                }),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Password',
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 15.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          validator: (value) {
                            RegExp regex = RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return "La contraseña no puede estar vacía.";
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Por favor ingrese una contraseña válida min. 6 caracteres.");
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: _isObscure2,
                          controller: confirmpassController,
                          maxLength: 10, //Establecer el limite de caracteres
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure2
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _isObscure2 = !_isObscure2;
                                  });
                                }),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Confirm Password',
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 15.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          validator: (value) {
                            if (confirmpassController.text !=
                                passwordController.text) {
                              return "La contraseña no coincidió.";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Tipo de usuario : ",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            DropdownButton<String>(
                              dropdownColor:
                                  const Color.fromARGB(255, 28, 75, 30),
                              isDense: true,
                              isExpanded: false,
                              iconEnabledColor: Colors.white,
                              focusColor: Colors.white,
                              items: options.map((String dropDownStringItem) {
                                return DropdownMenuItem<String>(
                                  value: dropDownStringItem,
                                  child: Text(
                                    dropDownStringItem,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValueSelected) {
                                setState(() {
                                  _currentItemSelected = newValueSelected!;
                                  rool = newValueSelected;
                                });
                              },
                              value: _currentItemSelected,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Plan : ",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            DropdownButton<String>(
                              dropdownColor:
                                  const Color.fromARGB(255, 28, 75, 30),
                              isDense: true,
                              isExpanded: false,
                              iconEnabledColor: Colors.white,
                              focusColor: Colors.white,
                              items:
                                  optionsPlan.map((String dropDownStringItem) {
                                return DropdownMenuItem<String>(
                                  value: dropDownStringItem,
                                  child: Text(
                                    dropDownStringItem,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValueSelected) {
                                setState(() {
                                  _currentItemSelectedPlan = newValueSelected!;
                                  plan = newValueSelected;
                                });
                              },
                              value: _currentItemSelectedPlan,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          // Variable para rastrear si se aceptaron los términos y condiciones

                          children: [
                            MaterialButton(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              elevation: 5.0,
                              height: 40,
                              onPressed: () {
                                //Navigator.pushReplacement(
                                //context, MaterialPageRoute(builder: (context) => const LoginPage()));
                                const CircularProgressIndicator();
                                AutoRouter.of(context).push(const LoginRoute());
                              },
                              color: Colors.white,
                              child: const Text(
                                "Entrar",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            MaterialButton(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              elevation: 5.0,
                              height: 40,
                              onPressed: () {
                                if (acceptedTerms) {
                                  // Verifica si se aceptaron los términos y condiciones
                                  setState(() {
                                    showProgress = true;
                                  });
                                  signUp(
                                      emailController.text,
                                      passwordController.text,
                                      rool,
                                      plan,
                                      emailController.text,
                                      context,
                                      _formkey);
                                  AutoRouter.of(context)
                                      .push(const LoginRoute());
                                } else {
                                  //Si los terminos y condiciones no fueron aceptados muestran el dialogo...
                                  showTermsDialog(context);
                                }
                              },
                              color: Colors.white,
                              child: const Text(
                                "Registrarse",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Shop go",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.yellowAccent[400],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showTermsDialog(BuildContext context) {
    //bool acceptedTerms = false; // Estado para rastrear si se aceptaron los términos

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text('Términos y Condiciones'),
              content: Container(
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const SizedBox(height: 8),
                    // Text(
                    //   'Aquí van los términos y condiciones...',
                    //   style: TextStyle(fontSize: 16),
                    // ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Checkbox(
                          value: acceptedTerms,
                          onChanged: (bool? value) {
                            setState(() {
                              acceptedTerms = value ?? false;
                            });
                          },
                        ),
                        GestureDetector(
                          onTap: () {
                            _showTermsAndConditionsDialog(context);
                          },
                          child: const Text(
                            'Acepto los términos y condiciones',
                            style: TextStyle(
                              color: Colors.blue, // Cambia el color del texto
                              decoration: TextDecoration
                                  .underline, // Subraya el texto para indicar un enlace
                            ),
                          ),
                        ),
                        //const Text('Acepto los términos y condiciones'),
                      ],
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    if (acceptedTerms) {
                      // Si se aceptaron los términos, realiza la acción correspondiente
                      // Por ejemplo, puedes llamar a una función signUp aquí
                      Navigator.of(context).pop();
                    } else {
                      // Si los términos no se aceptaron, puedes mostrar un mensaje o realizar alguna acción adicional
                    }
                  },
                  child: const Text('Aceptar'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Cierra el diálogo
                  },
                  child: const Text('Cancelar'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showTermsAndConditionsDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Términos y Condiciones'),
            content: Container(
              width: double.maxFinite,
              child: Markdown(
                data: '''
              ## TÉRMINOS Y CONDICIONES DE USO DE LA APLICACIÓN "ShoGo"

* Partes

En el presente documento, se establecen los términos y condiciones de uso de la
aplicación “ShopGo”), propiedad de “Nation of Code Center SRL”.

*Licencia

La empresa otorga al Usuario una licencia no exclusiva, no transferible y no
sublicenciable para utilizar la Aplicación, de acuerdo con los términos y condiciones
establecidos en el presente documento.

La licencia otorgada al Usuario es de tipo uso personal, lo que significa que el
Usuario puede utilizar la Aplicación para los fines establecidos en el presente
documento,
pero
no puede realizar ninguna modificación,
reproducción,
distribución, o creación de obras derivadas de la Aplicación.

* Uso de la Aplicación

El Usuario se compromete a utilizar la Aplicación de forma lícita y conforme a los
términos y condiciones establecidos en el presente documento. El Usuario no podrá
utilizar la Aplicación para ningún fin ilegal, dañino, o que infrinja los derechos de
terceros.

El Usuario se compromete a no utilizar la Aplicación para realizar ninguna actividad
que pueda dañar, sobrecargar, o inutilizar la Aplicación o los sistemas informáticos
de la empresa.

*Propiedad intelectual

La propiedad intelectual de la Aplicación, incluyendo el software, los datos, y los
contenidos, es propiedad exclusiva de la empresa. El Usuario no podrá realizar
ninguna acción que pueda vulnerar los derechos de propiedad intelectual de la
empresa.

* Responsabilidad
La empresa no garantiza que la Aplicación esté libre de errores o fallas. El Usuario
se compromete a utilizar la Aplicación bajo su propio riesgo.
La empresa no será responsable por cualquier daño o pérdida que el Usuario pueda
sufrir como resultado del uso de la Aplicación, incluyendo daños directos, indirectos,
incidentales, especiales, o consecuentes.

*Modificaciones

La empresa se reserva el derecho de modificar los términos y condiciones de uso
de la Aplicación en cualquier momento. El Usuario será notificado de cualquier
modificación a través de la Aplicación.

*Vigencia

Los términos y condiciones de uso de la Aplicación entrarán en vigor en la fecha en
que el Usuario descargue o utilice la Aplicación por primera vez. Los términos y
condiciones seguirán vigentes hasta que sean rescindidos por cualquiera de las
partes.

El Usuario podrá rescindir los términos y condiciones de uso de la Aplicación en
cualquier momento, desinstalando la Aplicación de su dispositivo. El Desarrollador
podrá rescindir los términos y condiciones de uso de la Aplicación en cualquiermomento, sin previo aviso, si el Usuario incumple cualquiera de las disposiciones
del presente documento.

* Ley aplicable

Los términos y condiciones de uso de la Aplicación se regirán por las leyes de la
República Mexicana. Cualquier controversia o diferencia que surja en relación con
los términos y condiciones de uso de la Aplicación será resuelta por los tribunales
competentes de la Ciudad de México.

* Notificaciones

Todas las notificaciones y comunicaciones que deban realizarse en virtud de los
términos y condiciones de uso de la Aplicación se realizarán por escrito, y se
considerarán debidamente realizadas cuando sean entregadas en mano, enviadas
por correo certificado con acuse de recibo, o enviadas por correo electrónico a las
direcciones indicadas en el presente documento.

*Disposiciones generales

Si alguna disposición de los términos y condiciones de uso de la Aplicación es
declarada inválida o inaplicable por un tribunal competente, las demás disposiciones
seguirán vigentes y serán interpretadas de manera que reflejen la intención original
de las partes.

Los términos y condiciones de uso de la Aplicación constituyen el acuerdo completo
entre el Desarrollador y el Usuario con respecto al uso de la Aplicación, y sustituyen
a cualquier acuerdo o representación anterior o contemporánea, ya sea oral o
escrita.

En el presente documento, se ha indicado el tipo de licencia como uso personal. El
tipo de licencia determina los derechos que el Usuario tiene sobre la Aplicación.
            ''',
                styleSheet: MarkdownStyleSheet(
                  textAlign: WrapAlignment.start,
                  h1: const TextStyle(fontSize: 24),
                  p: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Cierra el diálogo
                },
                child: const Text('Aceptar'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Cierra el diálogo
                },
                child: const Text('Cancelar'),
              ),
            ],
          );
        });
  }
}

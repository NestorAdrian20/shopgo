import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

@RoutePage()
class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Licencias')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext contex) {
                  return AlertDialog(
                    title: Text('Licencias'),
                    content: Container(
                      width: double.maxFinite,
                      child: Markdown(
                        data:
                            '''
Politica de Privacidad
======================

Última actualización: 22 de noviembre de 2023

Nombre del responsable: Nation of Code Center

Nombre de la aplicación: ShopGo

Esta Política de Privacidad describe Nuestras políticas y procedimientos sobre la recopilación,
uso y divulgación de Su información cuando utiliza el Servicio y le informa
sobre sus derechos de privacidad y cómo la ley lo protege.

Utilizamos sus datos personales para proporcionar y mejorar el Servicio. Al utilizar el
Servicio, usted acepta la recopilación y el uso de información de acuerdo con
esta Política de Privacidad.

Datos personales que serán sometidos a tratamiento:
------------------------------
* Correo electrónico

* Nombre completo

* Contraseña

* Datos personales (dirección, teléfono, etc.)

* Ubicación GPS

* Datos de la tarjeta bancaria
------------------------------
Permisos especiales

*Acceso a la ubicación en tiempo real: Este permiso es necesario para que
la app pueda rastrear la ubicación de los repartidores y los pedidos. Sin este
permiso, la app no podría funcionar correctamente.

*Acceso a la cuenta de Google: Este permiso es necesario para que los
usuarios puedan iniciar sesión en la app con su cuenta de Google. Esto
permite a la app verificar la identidad de los usuarios y almacenar sus datos
de forma segura.

*Acceso a los datos bancarios: Este permiso es necesario para que los
usuarios puedan pagar los pedidos con sus tarjetas de crédito o débito. Sin
este permiso, los usuarios no podrían realizar pagos en la app.
Estos permisos son necesarios para que la app funcione correctamente y ofrezca a
los usuarios las funciones que esperan. Sin embargo, también conllevan algunos
riesgos potenciales, como el acceso a la ubicación, información personal y datos
bancarios.

Finalidades del tratamiento:
----------------------------

* Prestar el servicio de moto-mandaditos

* Realizar una buena administración del servicio

* Enviarle notificaciones sobre el estado de su pedido

* Realizar promociones y ofertas personalizadas

Derechos de los titulares:
--------------------------

* Acceso: El titular tiene derecho a conocer los datos personales que se tienen
sobre él.

* Rectificación: El titular tiene derecho a rectificar los datos personales que
sean inexactos o incompletos.

* Cancelación: El titular tiene derecho a cancelar sus datos personales, cuando
no sean necesarios para las finalidades para las que se recopilaron.

* Oposición: El titular tiene derecho a oponerse al tratamiento de sus datos
personales.

Transferencias de datos personales:
-----------------------------------

Se realizarán transferencias de datos personales a terceros, a una aplicación para
hacer administración de los procesos que se realizan. Estas transferencias se
realizarán para las finalidades descritas en el presente aviso de privacidad.

Consentimiento:
---------------

El usuario acepta el tratamiento de sus datos personales conforme a lo establecido
en el presente aviso de privacidad al registrarse en la aplicación.

Medidas de seguridad:
---------------------

Nation of Code Center ha implementado las medidas de seguridad técnicas y
organizativas necesarias para proteger los datos personales de los usuarios. Estas
medidas incluyen, entre otras:

* Protección de contraseñas: Las contraseñas de los usuarios se almacenan
de forma segura y cifrada.

* Cifrado de datos: Los datos personales de los usuarios se cifran tanto en
tránsito como en reposo.

* Control de acceso: El acceso a los datos personales está restringido a las
personas autorizadas.

Procedimientos en caso de vulneración de la seguridad de los datos:
-------------------------------------------------------------------

En caso de que se produzca una vulneración de la seguridad de los datos, Nation
of Code Center tomará las siguientes medidas:

* Investigar la causa de la vulneración.

* Notificar la vulneración a las autoridades competentes, si es necesario.

* Implementar las medidas necesarias para corregir la vulneración.

* Notificar la vulneración a los usuarios afectados.

Contacto:
---------

Para cualquier pregunta o comentario sobre el presente aviso de privacidad, puede
comunicarse con nosotros a través de nccsrl01mail.com o +52 916 130 0872.

''',
                        styleSheet: MarkdownStyleSheet(
                          textAlign: WrapAlignment.start,
                          h1: TextStyle(fontSize: 24),
                          p: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Cerrar'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('Mostrar licencias'),
          ),
        ));
  }
}

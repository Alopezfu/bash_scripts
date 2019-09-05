# SendMePublicIP

Para utilizar esta heramienta es necesario instalar **ssmtp** y **curl**:
- sudo apt install ssmtp curl

- Remplazamos todo el contendio de **/etc/ssmtp/ssmtp.conf** por...
  - hostname=HostName
  - root=tu@email.com
  - mailhub=smtp.server.com:587
  - AuthUser=tu@email.com
  - AuthPass=TuPassword
  - UseTLS=YES
  - UseSTARTTLS=YES
    
- Remplazamos el conenido actual del fichero ip por nuestra **ip** publica, solo esta vez.

- Por ultimo editamos el script "SendMeIp" y en la linea 7 aplicalos los valores desador como por ejemplo el asunto el mensaje y el corro de a quien le queremos enviar el correo.

Nota: En caso de error al ejecutar el script...

 - sed -i -e 's/\r$//' SendMePublicIP


ENJOY!! 👍😁

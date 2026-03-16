BlocCubitsCounter

✨ App Flutter que implementa dos contadores: uno con Cubit y otro con Bloc para manejo de estado.

Este proyecto es un ejemplo sencillo para comparar Cubit y Bloc usando la librería flutter_bloc en Flutter. Cubit es ideal para casos simples de estado, mientras que Bloc sigue un patrón más formal con eventos y estados separados.

🚀 Características

✔️ Contador usando Cubit
✔️ Contador usando Bloc
✔️ Gestión de estado con la librería oficial flutter_bloc
✔️ Ejemplo para aprender y comparar ambas implementaciones

📌 ¿Qué es Cubit y Bloc?

Cubit es una forma simplificada de hacer gestión de estado usando funciones para emitir nuevos estados.
Bloc implementa un patrón más robusto donde se manejan events y states, ideal para lógicas más complejas.

🛠 Instalación

1. Clona el repositorio: git clone https://github.com/jusebcasan/BlocCubitsCounter.git
2. Instala dependencias: cd BlocCubitsCounter
flutter pub get
3. Ejecuta en tu dispositivo o emulador: flutter run

📱 Uso
🧮 Cubit Counter:
Inicia el contador en 0.
Presiona los botones de + y - para incrementar o decrementar el valor.

🔁 Bloc Counter:
Similar al Cubit, pero con manejo de eventos y estados separados.

🧠 ¿Qué aprenderás con este proyecto?
Este proyecto te permite entender diferencias prácticas entre:
Cubit vs Bloc
Cómo usar BlocProvider y BlocBuilder
Cómo separar lógica de negocio de la UI en Flutter

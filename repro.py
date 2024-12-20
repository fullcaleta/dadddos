import socket
import pyaudio
import numpy as np  # Para manipular los datos de audio

# Configuración de la dirección IP y el puerto para recibir audio
host = '0.0.0.0'  # Escucha en todas las interfaces de red
port = 8080

# Configuración de PyAudio
chunk_size = 2048  # Tamaño del búfer ajustado
sample_format = pyaudio.paInt16
channels = 2
rate = 42100

# Factor de amplificación (ajustable)
amplification_factor = 55.0  # Amplificación al 100%

# Inicialización de PyAudio
audio = pyaudio.PyAudio()

# Configuración del socket UDP
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.bind((host, port))

print("Esperando conexión...")

# Inicialización del flujo de reproducción de audio
stream = audio.open(format=sample_format,
                    channels=channels,
                    rate=rate,
                    output=True,
                    frames_per_buffer=chunk_size)

print("Reproduciendo audio...")

try:
    while True:
        data, addr = sock.recvfrom(8192)  # Búfer aumentado para evitar errores de límite
        
        # Convertir los datos de audio a un array numpy para manipularlos
        audio_data = np.frombuffer(data, dtype=np.int16)
        
        # Amplificar los datos de audio
        audio_data = np.clip(audio_data * amplification_factor, -32768, 32767).astype(np.int16)
        
        # Reproducir los datos de audio amplificados
        stream.write(audio_data.tobytes())
except KeyboardInterrupt:
    print("Recepción interrumpida por el usuario.")
finally:
    # Cierre del flujo de reproducción y del socket
    stream.stop_stream()
    stream.close()
    audio.terminate()
    sock.close()

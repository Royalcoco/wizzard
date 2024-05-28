import os
import zipfile
import random

import qrcode
import pyotp
import base64

import random


import random


import zipfile
import os


import random
import zipfile
import os
import qrcode
import pyotp
import base64
import random

# Générer un fichier de 1100 points de données
data = [random.randint(0, 1000) for _ in range(1100)]
filename = "data_points.txt"
with open(filename, "w") as file:
    for point in data:
        file.write(f"{point}\n")

# Compresser le fichier
zip_filename = "data_points.zip"
with zipfile.ZipFile(zip_filename, "w") as zipf:
    zipf.write(filename)

# Nettoyage du fichier original
os.remove(filename)

def decompress_file(zip_filename):
    with zipfile.ZipFile(zip_filename, 'r') as zip_ref:
        zip_ref.extractall()

decompress_file(zip_filename)

# Lire le fichier décompressé
data = []
with open(filename, "r") as file:
    for line in file:
        data.append(int(line.strip()))
        
print(data)
os.remove(filename)
os.remove(zip_filename)

# Générer un QR code pour la première couche de sécurité
def generate_qr_code(data, filename):
    qr = qrcode.QRCode(
        version=1,
        error_correction=qrcode.constants.ERROR_CORRECT_L,
        box_size=10,
        border=4,
    )
    qr.add_data(data)
    qr.make(fit=True)

    img = qr.make_image(fill='black', back_color='white')
    img.save(filename)

# Utiliser pyotp pour la double authentification
def generate_totp_secret():
    return pyotp.random_base32()

def generate_totp_qr(secret, user, service_name):
    totp_uri = pyotp.totp.TOTP(secret).provisioning_uri(name=user, issuer_name=service_name)
    qr_img = qrcode.make(totp_uri)
    qr_img.save("totp_qr.png")

# Exemple d'utilisation
totp_secret = generate_totp_secret()
generate_qr_code("Secure Data Transmission", "secure_qr.png")
generate_totp_qr(totp_secret, "user@example.com", "SecureService")

# Pour vérifier le code TOTP
totp = pyotp.TOTP(totp_secret)
print("Current OTP:", totp.now())


# Générer des points de données aléatoires
data_points = [random.randint(0, 1000) for _ in range(1100)]

# Convertir les points de données en code binaire
binary_signal = ''.join(format(point, '016b') for point in data_points)
print(f"Binary Signal: {binary_signal[:64]}...")  # Afficher une partie du signal binaire pour la vérification
 def binary_to_digits(binary_signal):
    # Diviser le signal binaire en blocs de 4 bits pour conversion en chiffres hexadécimaux
    hex_digits = [hex(int(binary_signal[i:i+4], 2))[2:] for i in range(0, len(binary_signal), 4)]
    digit_sequence = ''.join(hex_digits)
    return digit_sequence

digit_sequence = binary_to_digits(binary_signal)
print(f"Digit Sequence: {digit_sequence[:64]}...")  # Afficher une partie de la séquence de chiffres pour la vérification

# Créer un dictionnaire pour mapper les chiffres à des mots dans un langage artificiel
artificial_language = {
    '0': 'aba', '1': 'bca', '2': 'dac', '3': 'edf', 
    '4': 'gih', '5': 'jik', '6': 'kil', '7': 'lmn', 
    '8': 'nop', '9': 'poq', 'a': 'qrs', 'b': 'stu', 
    'c': 'tuv', 'd': 'uvw', 'e': 'wxy', 'f': 'xyz'
}

def encode_to_artificial_language(digit_sequence):
    words = [artificial_language[digit] for digit in digit_sequence]
    return ' '.join(words)

encoded_message = encode_to_artificial_language(digit_sequence)
print(f"Encoded Message: {encoded_message[:64]}...")  # Afficher une partie du message codé pour la vérification

# Inverser le dictionnaire pour le décodage
inverse_artificial_language = {v: k for k, v in artificial_language.items()}

def decode_from_artificial_language(encoded_message):
    words = encoded_message.split()
    digit_sequence = ''.join(inverse_artificial_language[word] for word in words)
    return digit_sequence

def digits_to_binary(digit_sequence):
    # Convertir les chiffres hexadécimaux en signal binaire
    binary_signal = ''.join(format(int(digit, 16), '04b') for digit in digit_sequence)
    return binary_signal

# Décoder le message et retransmettre en code binaire
decoded_digit_sequence = decode_from_artificial_language(encoded_message)
retrieved_binary_signal = digits_to_binary(decoded_digit_sequence)
print(f"Retrieved Binary Signal: {retrieved_binary_signal[:64]}...")  # Afficher une partie du signal binaire retrouvé pour la vérification

# Générer des points de données aléatoires
data_points = [random.randint(0, 1000) for _ in range(1100)]

# Convertir les points de données en code binaire
binary_signal = ''.join(format(point, '016b') for point in data_points)
print(f"Binary Signal: {binary_signal[:64]}...")  # Afficher une partie du signal binaire pour la vérification

def binary_to_digits(binary_signal):
    # Diviser le signal binaire en blocs de 4 bits pour conversion en chiffres hexadécimaux
    hex_digits = [hex(int(binary_signal[i:i+4], 2))[2:] for i in range(0, len(binary_signal), 4)]
    digit_sequence = ''.join(hex_digits)
    return digit_sequence

digit_sequence = binary_to_digits(binary_signal)
print(f"Digit Sequence: {digit_sequence[:64]}...")  # Afficher une partie de la séquence de chiffres pour la vérification

# Créer un dictionnaire pour mapper les chiffres à des mots dans un langage artificiel
artificial_language = {
    '0': 'aba', '1': 'bca', '2': 'dac', '3': 'edf', 
    '4': 'gih', '5': 'jik', '6': 'kil', '7': 'lmn', 
    '8': 'nop', '9': 'poq', 'a': 'qrs', 'b': 'stu', 
    'c': 'tuv', 'd': 'uvw', 'e': 'wxy', 'f': 'xyz'
}

def encode_to_artificial_language(digit_sequence):
    words = [artificial_language[digit] for digit in digit_sequence]
    return ' '.join(words)

encoded_message = encode_to_artificial_language(digit_sequence)
print(f"Encoded Message: {encoded_message[:64]}...")  # Afficher une partie du message codé pour la vérification

# Inverser le dictionnaire pour le décodage
inverse_artificial_language = {v: k for k, v in artificial_language.items()}

def decode_from_artificial_language(encoded_message):
    words = encoded_message.split()
    digit_sequence = ''.join(inverse_artificial_language[word] for word in words)
    return digit_sequence

def digits_to_binary(digit_sequence):
    # Convertir les chiffres hexadécimaux en signal binaire
    binary_signal = ''.join(format(int(digit, 16), '04b') for digit in digit_sequence)
    return binary_signal

# Décoder le message et retransmettre en code binaire
decoded_digit_sequence = decode_from_artificial_language(encoded_message)
retrieved_binary_signal = digits_to_binary(decoded_digit_sequence)
print(f"Retrieved Binary Signal: {retrieved_binary_signal[:64]}...")  # Afficher une partie du signal binaire retrouvé pour la vérification

def receive_and_decrypt_message(encrypted_message):
    # Simuler la décryption du message reçu
    decrypted_message = decode_from_artificial_language(encrypted_message)
    return decrypted_message

def simulate_ping_transmission(binary_signal, chunk_size=64):
    # Diviser le signal binaire en morceaux de taille définie (chunk_size)
    chunks = [binary_signal[i:i+chunk_size] for i in range(0, len(binary_signal), chunk_size)]
    return chunks

binary_chunks = simulate_ping_transmission(binary_signal)
print(f"First Binary Chunk: {binary_chunks[0]}")

def reconstitute_message(chunks):
    full_binary_message = ''.join(chunks)
    return binary_to_digits(full_binary_message)

digit_sequence = reconstitute_message(binary_chunks)
print(f"Reconstituted Digit Sequence: {digit_sequence[:64]}...")  # Afficher une partie de la séquence reconstituée

# Fonction pour décompresser un fichier zip
def decompress_zip(zip_filename, extract_to):
    with zipfile.ZipFile(zip_filename, 'r') as zip_ref:
        zip_ref.extractall(extract_to)

# Fonction pour recompresser un dossier en fichier zip
def compress_to_zip(folder_path, zip_filename):
    with zipfile.ZipFile(zip_filename, 'w') as zipf:
        for foldername, subfolders, filenames in os.walk(folder_path):
            for filename in filenames:
                file_path = os.path.join(foldername, filename)
                zipf.write(file_path, os.path.relpath(file_path, folder_path))

# Décompresser le dossier, analyser et recompresser
decompress_zip('data_points.zip', 'decompressed_data')
# Analyse simple: afficher le contenu du fichier décompressé
with open('decompressed_data/data_points.txt', 'r') as file:
    print(file.read())

# Recompresser le dossier
compress_to_zip('decompressed_data', 'recompressed_data_points.zip')

def main():
    encrypted_message = input("Enter the encrypted message received by ping: ")
    decrypted_message = receive_and_decrypt_message(encrypted_message)
    print(f"Decrypted Message: {decrypted_message}")
    
    # Simuler la réception des messages par ping et les déminer
    binary_chunks = simulate_ping_transmission(binary_signal)
    digit_sequence = reconstitute_message(binary_chunks)
    print(f"Reconstituted Digit Sequence: {digit_sequence[:64]}...")

    # Décompresser, analyser et recompresser
    decompress_zip('data_points.zip', 'decompressed_data')
    with open('decompressed_data/data_points.txt', 'r') as file:
        print(file.read())
    compress_to_zip('decompressed_data', 'recompressed_data_points.zip')

if __name__ == "__main__":
    main()

# Générer des points de données aléatoires
data_points = [random.randint(0, 1000) for _ in range(1100)]

# Convertir les points de données en code binaire
binary_signal = ''.join(format(point, '016b') for point in data_points)
print(f"Binary Signal: {binary_signal[:64]}...")  # Afficher une partie du signal binaire pour la vérification

def binary_to_digits(binary_signal):
    # Diviser le signal binaire en blocs de 4 bits pour conversion en chiffres hexadécimaux
    hex_digits = [hex(int(binary_signal[i:i+4], 2))[2:] for i in range(0, len(binary_signal), 4)]
    digit_sequence = ''.join(hex_digits)
    return digit_sequence

digit_sequence = binary_to_digits(binary_signal)
print(f"Digit Sequence: {digit_sequence[:64]}...")  # Afficher une partie de la séquence de chiffres pour la vérification

# Créer un dictionnaire pour mapper les chiffres à des mots dans un langage artificiel
artificial_language = {
    '0': 'aba', '1': 'bca', '2': 'dac', '3': 'edf', 
    '4': 'gih', '5': 'jik', '6': 'kil', '7': 'lmn', 
    '8': 'nop', '9': 'poq', 'a': 'qrs', 'b': 'stu', 
    'c': 'tuv', 'd': 'uvw', 'e': 'wxy', 'f': 'xyz'
}

def encode_to_artificial_language(digit_sequence):
    words = [artificial_language[digit] for digit in digit_sequence]
    return ' '.join(words)

encoded_message = encode_to_artificial_language(digit_sequence)
print(f"Encoded Message: {encoded_message[:64]}...")  # Afficher une partie du message codé pour la vérification

# Inverser le dictionnaire pour le décodage
inverse_artificial_language = {v: k for k, v in artificial_language.items()}

def decode_from_artificial_language(encoded_message):
    words = encoded_message.split()
    digit_sequence = ''.join(inverse_artificial_language[word] for word in words)
    return digit_sequence

def digits_to_binary(digit_sequence):
    # Convertir les chiffres hexadécimaux en signal binaire
    binary_signal = ''.join(format(int(digit, 16), '04b') for digit in digit_sequence)
    return binary_signal

def receive_and_decrypt_message(encrypted_message):
    # Simuler la décryption du message reçu
    decrypted_message = decode_from_artificial_language(encrypted_message)
    return decrypted_message

def simulate_ping_transmission(binary_signal, chunk_size=64):
    # Diviser le signal binaire en morceaux de taille définie (chunk_size)
    chunks = [binary_signal[i:i+chunk_size] for i in range(0, len(binary_signal), chunk_size)]
    return chunks

def reconstitute_message(chunks):
    full_binary_message = ''.join(chunks)
    return binary_to_digits(full_binary_message)

# Fonction pour décompresser un fichier zip
def decompress_zip(zip_filename, extract_to):
    with zipfile.ZipFile(zip_filename, 'r') as zip_ref:
        zip_ref.extractall(extract_to)

# Fonction pour recompresser un dossier en fichier zip
def compress_to_zip(folder_path, zip_filename):
    with zipfile.ZipFile(zip_filename, 'w') as zipf:
        for foldername, subfolders, filenames in os.walk(folder_path):
            for filename in filenames:
                file_path = os.path.join(foldername, filename)
                zipf.write(file_path, os.path.relpath(file_path, folder_path))

def main():
    encrypted_message = input("Enter the encrypted message received by ping: ")
    decrypted_message = receive_and_decrypt_message(encrypted_message)
    print(f"Decrypted Message: {decrypted_message}")
    
    # Simuler la réception des messages par ping et les déminer
    binary_chunks = simulate_ping_transmission(binary_signal)
    digit_sequence = reconstitute_message(binary_chunks)
    print(f"Reconstituted Digit Sequence: {digit_sequence[:64]}...")

    # Décompresser, analyser et recompresser
    decompress_zip('data_points.zip', 'decompressed_data')
    with open('decompressed_data/data_points.txt', 'r') as file:
        print(file.read())
    compress_to_zip('decompressed_data', 'recompressed_data_points.zip')

if __name__ == "__main__":
    main()

# Générer des points de données aléatoires
data_points = [random.randint(0, 1000) for _ in range(1100)]

# Convertir les points de données en code binaire
binary_signal = ''.join(format(point, '016b') for point in data_points)
print(f"Binary Signal: {binary_signal[:64]}...")  # Afficher une partie du signal binaire pour la vérification du signal a la valeur de 0.01

def binary_to_digits(binary_signal):
    

import json
import os
from googletrans import Translator

# Set up the translator
translator = Translator()

# Define the paths to your ARB files
base_path = "lib/core/assets/l10n/"
arb_files = {
    "en": os.path.join(base_path, "app_en.arb"),
    "uz": os.path.join(base_path, "app_uz.arb"),
    "ru": os.path.join(base_path, "app_ru.arb"),
}

# Function to load the existing ARB content
def load_arb_file(file_path):
    try:
        if os.path.exists(file_path):
            with open(file_path, "r", encoding="utf-8") as file:
                return json.load(file)
        return {}
    except json.JSONDecodeError as e:
        print(f"Error reading {file_path}: {e}")
        return {}

# Function to save the ARB content
def save_arb_file(file_path, data):
    try:
        with open(file_path, "w", encoding="utf-8") as file:
            json.dump(data, file, ensure_ascii=False, indent=4)
    except Exception as e:
        print(f"Error writing to {file_path}: {e}")

# Main function
def add_translation():
    while True:
        sentence = input("Enter the sentence: ")
        lang = input("Enter the language of the sentence (en, uz, ru): ").strip().lower()

        if lang not in arb_files:
            print("Invalid language code. Please enter 'en', 'uz', or 'ru'.")
            continue

        # Translate the sentence to the other languages
        translations = {
            "en": sentence if lang == "en" else translator.translate(sentence, src=lang, dest="en").text,
            "uz": sentence if lang == "uz" else translator.translate(sentence, src=lang, dest="uz").text,
            "ru": sentence if lang == "ru" else translator.translate(sentence, src=lang, dest="ru").text,
        }

        # Load, update, and save each ARB file
        for key, file_path in arb_files.items():
            arb_data = load_arb_file(file_path)
            arb_key = "".join(word.capitalize() for word in translations["en"].split())  # Generate a camelCase key
            arb_key = arb_key[0].lower() + arb_key[1:]  # Ensure first letter is lowercase
            arb_data[arb_key] = translations[key]
            print(arb_key)
            save_arb_file(file_path, arb_data)

        print("Translation added to ARB files successfully!")

# Start adding translations
add_translation()


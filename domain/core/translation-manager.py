import json
import os
from pathlib import Path
import subprocess
import re
from deep_translator import GoogleTranslator

class TranslationManager:
    def __init__(self, translations_dir='/Users/azizbek/StudioProjects/eco_sfera/domain/core/assets/translations'):
        self.translations_dir = Path(translations_dir)
        self.translations_dir.mkdir(parents=True, exist_ok=True)
        self.language_codes = {
            'en': 'en',
            'ru': 'ru',
            'uz': 'uz'
        }
        # Create initial JSON files if they don't exist
        self.initialize_json_files()

    def initialize_json_files(self):
        for lang_code in self.language_codes:
            file_path = self.translations_dir / f'{lang_code}.json'
            if not file_path.exists():
                self.save_json(lang_code, {})

    def format_key(self, key):
        # Split the key by spaces, hyphens, or underscores
        words = re.split('[ _-]', key)
        # Convert to camelCase
        return words[0].lower() + ''.join(word.capitalize() for word in words[1:])

    def load_json(self, lang_code):
        file_path = self.translations_dir / f'{lang_code}.json'
        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                content = f.read()
                if not content:  # If file is empty
                    return {}
                return json.loads(content)
        except json.JSONDecodeError:
            return {}
        except FileNotFoundError:
            return {}

    def save_json(self, lang_code, data):
        file_path = self.translations_dir / f'{lang_code}.json'
        # Ensure the data is properly formatted
        formatted_json = json.dumps(data, ensure_ascii=False, indent=4)
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write(formatted_json)

    def translate_text(self, text, target_lang):
        if target_lang == 'en':
            return text
        try:
            translator = GoogleTranslator(source='en', target=target_lang)
            translated = translator.translate(text)
            return translated
        except Exception as e:
            print(f"Translation error for {target_lang}: {str(e)}")
            return text

    def run_flutter_commands(self):
        try:
            print("\nRunning Flutter localization commands...")

            # Second command using dart run
            subprocess.run([
                'dart', 'run', 'easy_localization:generate',
                '--source-dir', 'assets/translations'
            ], check=True)
            print("Second command completed successfully")

            # First command using dart run
            subprocess.run([
                'dart', 'run', 'easy_localization:generate',
                '-S', 'assets/translations',
                '-f', 'keys',
                '-o', 'locale_keys.g.dart'
            ], check=True)
            print("First command completed successfully")


            print("Flutter localization files generated successfully!")

        except subprocess.CalledProcessError as e:
            print(f"Error running Flutter commands: {str(e)}")
        except Exception as e:
            print(f"Unexpected error: {str(e)}")

    def add_translation(self, key, english_text):
        # Format the key to camelCase
        formatted_key = self.format_key(key)

        # Process each language
        for lang_code in self.language_codes:
            # Load existing translations
            translations = self.load_json(lang_code)

            # Add new translation
            if lang_code == 'en':
                translations[formatted_key] = english_text
            else:
                translated_text = self.translate_text(english_text, lang_code)
                translations[formatted_key] = translated_text

            # Sort translations by key
            sorted_translations = dict(sorted(translations.items()))

            # Save updated translations
            self.save_json(lang_code, sorted_translations)
            print(f"Added translation for {lang_code}: {translations[formatted_key]}")

        # Run Flutter commands after adding translations
        self.run_flutter_commands()

def main():
    # Initialize translation manager
    manager = TranslationManager()

    while True:
        # Get input from user
        print("\nEnter a key and English text (format: key:text), or 'q' to quit:")
        user_input = input().strip()

        if user_input.lower() == 'q':
            break

        try:
            key, text = user_input.split(':', 1)
            key = key.strip()
            text = text.strip()

            # Add translation
            manager.add_translation(key, text)
            print(f"\nTranslation added successfully for key: {key}")

        except ValueError:
            print("Invalid input format. Please use 'key:text' format.")
        except Exception as e:
            print(f"Error: {str(e)}")

if __name__ == "__main__":
    main()
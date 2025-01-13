import os
from pathlib import Path
import re

class FileStructure:
    def __init__(self):
        self.provider_path = Path("data/network/lib/src/provider")
        self.repository_path = Path("domain/repository/lib/src/repository")
        self.usecase_path = Path("domain/use_case/lib/src")
        self.di_path = Path("domain/use_case/lib/src/di/init.dart")

class DIManager:
    @staticmethod
    def find_class_end(content, class_name):
        """Find the end position of a class in the content."""
        class_start = content.find(f"abstract class {class_name}")
        if class_start == -1:
            return -1
        
        brace_count = 0
        in_class = False
        
        for i in range(class_start, len(content)):
            if content[i] == '{':
                brace_count += 1
                in_class = True
            elif content[i] == '}':
                brace_count -= 1
                if in_class and brace_count == 0:
                    return i
        
        return -1

    @staticmethod
    def update_di_file(file_path, new_content):
        if not Path(file_path).exists():
            print(f"DI file {file_path} not found!")
            return False

        with open(file_path, 'r') as f:
            content = f.read()
            
        # Find UseCaseModule class end
        class_end = DIManager.find_class_end(content, "UseCaseModule")
        if class_end == -1:
            print("UseCaseModule class not found!")
            return False
            
        # Insert new content before the last closing brace
        updated_content = (
            content[:class_end] + 
            "\n" + new_content + "\n" +
            content[class_end:]
        )
        
        with open(file_path, 'w') as f:
            f.write(updated_content)
        return True

class CodeGenerator:
    def __init__(self):
        self.structure = FileStructure()
        self.di_manager = DIManager()

    def get_provider_files(self):
        if not self.structure.provider_path.exists():
            print("Provider directory not found!")
            return []
        return [f for f in self.structure.provider_path.glob("*.dart") if f.is_file()]

    def get_user_inputs(self):
        print("\n=== Function Configuration ===")
        function_name = input("Enter function name: ").strip()
        
        needs_input = input("Does this function need input parameters? (y/n): ").lower() == 'y'
        input_param = ""
        input_param_name = ""
        if needs_input:
            input_param = input("Enter input parameter type (e.g., UserDto): ").strip()
            input_param_name = input("Enter input parameter name (e.g., userDto): ").strip()
        
        return_type = input("Enter return type (e.g., bool, UserInfo): ").strip()
        http_method = input("Enter HTTP method (get/post/put/delete): ").lower()
        endpoint_path = input("Enter endpoint path (e.g., UserEndpoint.profile): ").strip()
        
        return {
            "function_name": function_name,
            "input_param": input_param,
            "input_param_name": input_param_name,
            "return_type": return_type,
            "http_method": http_method,
            "endpoint_path": endpoint_path
        }

    def generate_provider_content(self, inputs):
        # Abstract Provider
        param_str = f"{inputs['input_param']} {inputs['input_param_name']}" if inputs['input_param'] else ""
        abstract_provider = f"""  Future<ApiResponse<{inputs['return_type']}>> {inputs['function_name']}({param_str});"""

        # Implementation Provider
        data_param = f", data: {inputs['input_param_name']}.toJson()" if inputs['input_param'] else ""
        impl_provider = f"""  @override
  Future<ApiResponse<{inputs['return_type']}>> {inputs['function_name']}({param_str}) {{
    return apiCall(
        apiClient.{inputs['http_method']}({inputs['endpoint_path']}{data_param}),
        dataFromJson: (json) {{
          return json != null;
        }}
    );
  }}"""

        return abstract_provider, impl_provider

    def generate_repository_content(self, inputs, provider_name):
        # Abstract Repository
        param_str = f"{inputs['input_param']} {inputs['input_param_name']}" if inputs['input_param'] else ""
        abstract_repo = f"""  Future<Result<{inputs['return_type']}>> {inputs['function_name']}({param_str});"""

        # Implementation Repository
        to_dto = f"{inputs['input_param_name']}.toDto()" if inputs['input_param'] else ""
        impl_repo = f"""  @override
  Future<Result<{inputs['return_type']}>> {inputs['function_name']}({param_str}) async {{
    final response = await {provider_name.lower()}.{inputs['function_name']}({to_dto});

    try {{
      if (!response.success || response.data == null) {{
        return Result.error(
          ResultError(
            message: response.error?.message ?? 'Something went wrong',
            reason: response.error?.reason ?? 'Something went wrong',
          ),
        );
      }}

      return Result.completed(response.data);
    }} catch(e) {{
      return Result.error(
        ResultError(
          message: 'Operation failed',
          reason: e.toString(),
        ),
      );
    }}
  }}"""

        return abstract_repo, impl_repo

    def generate_usecase_content(self, inputs, repo_name):
        class_name = inputs['function_name']
        if class_name[0].islower():
            class_name = class_name[0].upper() + class_name[1:]

        param_str = f"{inputs['input_param']} {inputs['input_param_name']}" if inputs['input_param'] else ""
        param_pass = inputs['input_param_name'] if inputs['input_param'] else ""

        # Abstract UseCase
        abstract_usecase = f"""import 'package:core/core.dart';
import 'package:model/model.dart';

abstract class {class_name} {{
  Future<Result<{inputs['return_type']}>> {inputs['http_method']}({param_str});
}}"""

        # Implementation UseCase
        impl_usecase = f"""import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:repository/repository.dart';
import '../{inputs['function_name'].lower()}_use_case.dart';

class {class_name}Impl extends {class_name} {{
  {class_name}Impl({{required this.{repo_name.lower()}}});

  final {repo_name} {repo_name.lower()};

  @override
  Future<Result<{inputs['return_type']}>> {inputs['http_method']}({param_str}) {{
    return {repo_name.lower()}.{inputs['function_name']}({param_pass});
  }}
}}"""

        return abstract_usecase, impl_usecase

    def generate_di_entry(self, inputs, repo_name):
        class_name = inputs['function_name']
        if class_name[0].islower():
            class_name = class_name[0].upper() + class_name[1:]

        return f"""  {class_name} provide{class_name}({repo_name} {repo_name.lower()}){{
    return {class_name}Impl({repo_name.lower()}: {repo_name.lower()});
  }}"""

    def update_file(self, file_path, new_content, is_new_file=False):
        if is_new_file:
            os.makedirs(os.path.dirname(file_path), exist_ok=True)
            with open(file_path, 'w') as f:
                f.write(new_content)
            return True

        if not Path(file_path).exists():
            print(f"File {file_path} not found!")
            return False

        with open(file_path, 'r') as f:
            content = f.read()
            updated_content = content.rsplit("}", 1)[0] + "\n" + new_content + "\n}"

        with open(file_path, 'w') as f:
            f.write(updated_content)
        return True

    def run(self):
        print("=== Flutter Layer Generator ===")
        
        # Get provider files
        provider_files = self.get_provider_files()
        if not provider_files:
            print("No provider files found!")
            return

        print("\nAvailable provider files:")
        for i, file in enumerate(provider_files):
            print(f"{i + 1}. {file.name}")

        try:
            file_index = int(input("\nSelect provider file (enter number): ")) - 1
            if file_index < 0 or file_index >= len(provider_files):
                print("Invalid selection!")
                return
        except ValueError:
            print("Please enter a valid number!")
            return

        selected_file = provider_files[file_index]
        provider_name = selected_file.stem.title().replace("_", "")
        repo_name = selected_file.stem.replace("_provider", "_repo").title().replace("_", "")

        # Get function details
        inputs = self.get_user_inputs()

        print("\n=== Generating Files ===")

        # 1. Update Provider files
        print("Updating Provider files...")
        abstract_provider, impl_provider = self.generate_provider_content(inputs)
        
        self.update_file(selected_file, abstract_provider)
        self.update_file(
            selected_file.parent / 'impl' / f'{selected_file.stem}_impl.dart',
            impl_provider
        )

        # 2. Update Repository files
        print("Updating Repository files...")
        abstract_repo, impl_repo = self.generate_repository_content(inputs, provider_name)
        
        repo_file = self.structure.repository_path / f"{selected_file.stem.replace('_provider', '_repo')}.dart"
        self.update_file(repo_file, abstract_repo)
        self.update_file(
            repo_file.parent / 'impl' / f'{repo_file.stem}_impl.dart',
            impl_repo
        )

        # 3. Create UseCase files
        print("Creating UseCase files...")
        abstract_usecase, impl_usecase = self.generate_usecase_content(inputs, repo_name)
        
        usecase_file = self.structure.usecase_path / f"{inputs['function_name'].lower()}_use_case.dart"
        self.update_file(usecase_file, abstract_usecase, True)
        
        impl_file = self.structure.usecase_path / 'impl' / f"{inputs['function_name'].lower()}_use_case_impl.dart"
        self.update_file(impl_file, impl_usecase, True)

        # 4. Update DI file
        print("Updating DI file...")
        di_entry = self.generate_di_entry(inputs, repo_name)
        self.di_manager.update_di_file(self.structure.di_path, di_entry)

        print("\n=== Generation Complete ===")
        print("Files generated and updated successfully!")

if __name__ == "__main__":
    generator = CodeGenerator()
    generator.run()
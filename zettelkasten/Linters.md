## Setup running linter before the git commit
To run linters before each Git commit, you can use a Git hook. A Git hook is a script that is automatically executed at a specific point in the Git workflow, such as before or after committing.

To set up a Git hook to run linters before committing, you can follow these steps:

1.  In your project repository, navigate to the `.git/hooks` folder.
    
2.  Create a file named `pre-commit` in the `hooks` folder. This file will contain the script that will be executed before each commit.
    
3.  In the `pre-commit` file, add the following contents:
```cmd
#!/bin/sh

# Run linters on all files to be committed
FILES=$(git diff --cached --name-only)
multilinter $FILES

# Check if any linting errors were found
if [ $? -ne 0 ]; then
    echo "Linting errors were found. Please fix them before committing."
    exit 1
fi
```
This script will run the `multilinter` command on all of the files that are to be committed, and check the exit code to see if any linting errors were found. If any errors were found, the script will print a message and exit with an error code, which will prevent the commit from completing.

4.  Save the `pre-commit` file and make it executable by running the following command:
```cmd 
chmod +x pre-commit
```
5.  You can now try committing some changes to your project, and the `pre-commit` hook will automatically run the linters on the files to be committed, and prevent the commit if any linting errors are found.

By setting up a Git hook to run linters before committing, you can ensure that your code is always lint-free and of high quality. This can help to prevent errors and improve the overall maintainability of your project.

## Linter for both c++ and python
To set up MultiLinter for C++ and Python support in a project folder on Linux, you can follow these steps:

Install the Clang-Tidy and Pylint linters on your Linux system. You can do this by running the following commands:

```cmd

# Install Clang-Tidy
apt-get install clang-tidy

# Install Pylint
pip install pylint

# Install the MultiLinter tool by running the following command:
pip install multilinter
```

Navigate to your project folder in the terminal and run the `multilinter` command to lint your code. You can specify the linters you want to use with the `-l` option, as in the following example:
```cmd
multilinter -l clang-tidy,pylint
```
This will run both Clang-Tidy and Pylint on your code and display any linting errors or warnings.

If you want to customize the options for each linter, you can create a configuration file for MultiLinter. For example, you can create a file named `.multilinter.toml` in your project folder, and add the following contents:

```toml
[clang-tidy]
extra_args = ["-checks=*,-clang-analyzer-alpha.*"]

[pylint]
extra_args = ["--disable=W,C,R"]
```
This will configure Clang-Tidy to run all checks except for the alpha checks, and Pylint to disable certain warning and error messages.

You can then run the multilinter command again, and it will use the settings from your configuration file.
By following these steps, you can set up MultiLinter to lint your C++ and Python code in a project folder on Linux.
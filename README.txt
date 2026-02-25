Abstract

	Minimalistic ChatGPT CLI implemented in plain shell.


1. Requirements

	Following dependencies are required to use this tool:

		- sh
		- curl
		- jq
		- cat

	Environment variable that contains your
	OPENAI API key MUST be set:

		$ OPENAI_API_KEY="your_api_key_here"


2. Installation

	$ sudo make install


3. Uninstallation

	$ sudo make uninstall


4. Usage

	Use the `gpt` command followed by your prompt in quotes:

		$ gpt "your prompt here"

	You can also omit the quotes if you are lazy,
	remember to not break the command with special characters:

		$ gpt your prompt here

	You can pipe input to `gpt` and add additional
	prompt in arguments to provide instructions
	on how to process the piped input:

		$ echo "some input" | gpt your prompt here


5. Examples

	Command-line

		$ gpt Explain TLS in one sentence.

	Command-line  (piped without args)

		$ echo "What is the capital of France?" | gpt

	Command-line (piped)

		$ ps aux | gpt Find suspicious processes and explain why.

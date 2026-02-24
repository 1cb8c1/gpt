# gpt

Minimalistic ChatGPT CLI implemented in plain shell using curl and jq.

### Requirements

- sh
- curl
- jq
- OPENAI_API_KEY

### Install

`sudo make install`

### Uninstall

`sudo make uninstall`

### Setup

`export OPENAI_API_KEY="your_api_key_here"`

### Usage

`gpt "your prompt here"`

You can also omit the quotes if you are lazy and your prompt
won't break the command-line parsing:

`gpt your prompt here`


`echo "some input" | gpt your prompt here`

### Examples

Command-line
`gpt Explain TLS in one sentence.`

Command-line  (piped without args)
`echo "What is the capital of France?" | gpt`

Command-line (piped)
`ps aux | gpt Find suspicious processes and explain why.`

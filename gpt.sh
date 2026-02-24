#!/bin/sh

if [ -z "$OPENAI_API_KEY" ]; then
	echo "[Error] OPENAI_API_KEY is not set." >&2
	exit 1
fi

CONTEXT=$(cat <<EOF
You are being called from CLI.
Provide as concise and accurate answer as possible.
Please answer in plain text, without any formatting,
unless the question explicitly asks for it.
The out you create, will be used as a direct output in the terminal,
so do not include any explanations, comments, or additional information,
unless explicitly asked for.
When USER_PROMPT_STDIN is provided, it is usually output from another command,
while USER_PROMPT_ARGS is usually a question/task or additional context.
EOF
)

if [ ! -t 0 ]; then
	USER_PROMPT_STDIN=$(cat -)
else
	USER_PROMPT_STDIN=""
fi

if [ "$#" -gt 0 ]; then
	USER_PROMPT_ARGS="$*"
else
	USER_PROMPT_ARGS=""
fi

if [ -z "$USER_PROMPT_STDIN" ] && [ -z "$USER_PROMPT_ARGS" ]; then
	echo "[Error] No input provided." >&2
	exit 1
fi

PROMPT=$(cat <<EOF | jq -Rs .
context: $CONTEXT
user_prompt_stdin: $USER_PROMPT_STDIN
user_prompt_args: $USER_PROMPT_ARGS
EOF
)

curl -s -X POST 'https://api.openai.com/v1/responses' \
	--header "Authorization: Bearer $OPENAI_API_KEY" \
	--header 'Content-type: application/json' \
	-d @"-"<<EOF | jq -r '.output[0].content[0].text'
{
  	"model": "gpt-5.2",
  	"input": $PROMPT
}
EOF

exit 0

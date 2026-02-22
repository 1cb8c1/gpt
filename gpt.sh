#!/bin/sh

if [ -z "$OPENAI_API_KEY" ]; then
	echo "[Error] OPENAI_API_KEY is not set." >&2
	exit 1
fi

CONTEXT=$(cat <<EOF
You are being called from CLI.
Provide as concise and accurate answer as possible.
I repeat, keep it as short as possible, quick and snappy answers.
Please answer in plain text, without any formatting,
unless the question explicitly asks for it.
EOF
)

if [ "$#" -gt 0 ]; then
	USER_PROMPT="$*"
else
	USER_PROMPT=$(cat)
fi

PROMPT=$(cat <<EOF | jq -Rs .
context: $CONTEXT
user_prompt: $USER_PROMPT
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

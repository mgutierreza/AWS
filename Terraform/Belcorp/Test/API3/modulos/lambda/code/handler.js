import { TranslateClient, TranslateTextCommand } from "@aws-sdk/client-translate";
const client = new TranslateClient({});

export const handler = async (event) => {
    // Fetch the quote
    const response = await fetch("http://api.quotable.io/quotes/random");
    const [quote] = await response.json();

    // Translate the quote
    const command = new TranslateTextCommand({
        Text: quote.content,
        SourceLanguageCode: "en",
        TargetLanguageCode: "es",
    });

    const { TranslatedText } = await client.send(command);

    return {
        statusCode: 200,
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            cita: TranslatedText,
            autor: quote.author,
        }),
    };
};
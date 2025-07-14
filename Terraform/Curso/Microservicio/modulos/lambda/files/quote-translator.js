// El código mejorado que proporcioné anteriormente
import { TranslateClient, TranslateTextCommand } from "@aws-sdk/client-translate";
import fetch from 'node-fetch';

const translateClient = new TranslateClient({ region: process.env.AWS_REGION || 'us-west-2'});

export const handler = async (event) => {
    try {
        if (!event || typeof event !== 'object') {
            throw new Error('Evento de entrada no válido');
        }

        const quoteResponse = await fetch("https://api.quotable.io/quotes/random", {
            timeout: 5000
        });
        
        if (!quoteResponse.ok) {
            throw new Error(`Error al obtener cita: ${quoteResponse.statusText}`);
        }

        const [quote] = await quoteResponse.json();
        
        if (!quote?.content || !quote?.author) {
            throw new Error('La cita recibida no tiene el formato esperado');
        }

        let translatedText;
        try {
            const command = new TranslateTextCommand({
                Text: quote.content,
                SourceLanguageCode: "en",
                TargetLanguageCode: "es",
            });
            const result = await translateClient.send(command);
            translatedText = result.TranslatedText;
        } catch (translateError) {
            console.error('Error en traducción:', translateError);
            translatedText = quote.content;
        }

        return {
            statusCode: 200,
            headers: {
                'Content-Type': 'application/json',
                'Access-Control-Allow-Origin': '*'
            },
            body: JSON.stringify({
                cita: translatedText,
                autor: quote.author,
                original: quote.content,
                success: true
            }),
        };
    } catch (error) {
        console.error('Error general:', error);
        return {
            statusCode: error.statusCode || 500,
            headers: {
                'Content-Type': 'application/json',
                'Access-Control-Allow-Origin': '*'
            },
            body: JSON.stringify({
                error: error.message,
                success: false,
                stack: process.env.NODE_ENV === 'development' ? error.stack : undefined
            }),
        };
    }
};
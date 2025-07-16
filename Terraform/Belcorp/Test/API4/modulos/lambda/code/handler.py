import os
import json
import boto3
from urllib.request import urlopen

translate = boto3.client('translate')

def lambda_handler(event, context):
    try:
        # Fetch the quote
        with urlopen("http://api.quotable.io/quotes/random") as response:
            quotes = json.loads(response.read())
            quote = quotes[0]

        # Translate the quote
        result = translate.translate_text(
            Text=quote['content'],
            SourceLanguageCode='en',
            TargetLanguageCode='es'
        )

        return {
            'statusCode': 200,
            'headers': {
                'Content-Type': 'application/json'
            },
            'body': json.dumps({
                'cita': result['TranslatedText'],
                'autor': quote['author']
            })
        }
    except Exception as e:
        return {
            'statusCode': 500,
            'body': json.dumps({
                'error': str(e)
            })
        }
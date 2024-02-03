from fastapi import FastAPI, HTTPException
from vaderSentiment.vaderSentiment import SentimentIntensityAnalyzer

app = FastAPI(
    title="Github.com/signorrayan",
    version="1.0",
    )

model = SentimentIntensityAnalyzer()

users = {
    'signor': 'rayan',
    'mohammadreza': 'sarayloo'
}

permissions = {
    'mohammadreza': ['v1', 'v2'],
    'signor': ['v1']
}



# Root endpoint documentation
@app.get('/')
async def root():
    return {"message": "This is a FastAPI-based API to test microservices. github.com/signorrayan"}


def authenticate_user(username, password):
    authenticated_user = False
    if username in users.keys():
        if users[username] == password:
            authenticated_user = True
    return authenticated_user


def authorize_user(username, version):
    authorized_user = False
    if username in permissions.keys():
        if version in permissions[username]:
            authorized_user = True
    return authorized_user


@app.get('/status')
async def return_status():
    '''
    returns 1 if the app is up
    '''
    return 1


@app.get('/permissions')
async def return_permission(username: str = 'username', password: str = 'password'):
    if authenticate_user(username=username, password=password):
        return {'username': username, 'permissions': permissions[username]}
    else:
        raise HTTPException(status_code=403, detail='Authentication failed')


@app.get('/v1/sentiment')
async def return_sentiment_v1(username: str = 'username', password: str = 'password', sentence: str = 'hello world'):
    version = 'v1'
    if not authenticate_user(username=username, password=password):
        raise HTTPException(status_code=403, detail='Authentication failed')
    if not authorize_user(username=username, version=version):
        raise HTTPException(status_code=403, detail='This service is not included in your plan.')

    polarity_score = model.polarity_scores(text=sentence)
    sentiment = polarity_score['compound']

    return {
        'username': username,
        'version': version,
        'sentence': sentence,
        'score': sentiment
    }


@app.get('/v2/sentiment')
async def return_sentiment_v1(username: str = 'username', password: str = 'password', sentence: str = 'hello world'):
    version = 'v2'
    if not authenticate_user(username=username, password=password):
        raise HTTPException(status_code=403, detail='Authentication failed')
    if not authorize_user(username=username, version=version):
        raise HTTPException(status_code=403, detail='This service is not included in your plan.')

    polarity_score = model.polarity_scores(text=sentence)
    sentiment = polarity_score['compound']

    return {
        'username': username,
        'version': version,
        'sentence': sentence,
        'score': sentiment
    }
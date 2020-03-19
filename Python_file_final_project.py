import pandas as pd
import numpy as np
import re
import datetime
import warnings
warnings.filterwarnings('ignore')
from pymongo import MongoClient

def hashtag(x):
    value = re.findall( '#', x)
    return len(value)

def special(x):
    value = re.findall( '@', x)
    return len(value)

def f(x):
    if (x > 4) and (x <= 8):
        return 'Early Morning'
    elif (x > 8) and (x <= 12 ):
        return 'Morning'
    elif (x > 12) and (x <= 16):
        return'Noon'
    elif (x > 16) and (x <= 20) :
        return 'Eve'
    elif (x > 20) and (x <= 24):
        return'Night'
    elif (x <= 4):
        return'Late Night'


connection_string = 'mongodb+srv://chaba:ironhack01@cluster0-0i68o.azure.mongodb.net/test?'
client = MongoClient(connection_string)
database = client.get_database('test')
records = database['instaposts']

data=pd.DataFrame(records.find())
post=data[['owner_id','text','comment_count','like_count','video_view_count','is_video','date']]
post=post.fillna(0)
post['text']=post['text'].astype(str)

post['link_count']=list(map(special, post['text']))
post['hashtag_count']=list(map(hashtag, post['text']))
post['hashtag']=list(post.text.str.findall(r'#[A-z]+'))
post['links']=list(post.text.str.findall(r'@[A-z]+'))
post['hashtag']=post['hashtag'].astype(str).str.strip('[]')
post['hashtag']=post['hashtag'].astype(str).str.strip("''")
post['links']=post['links'].astype(str).str.strip('[]')
post['text'] = list(map(lambda x: re.sub('[?|!|\'|"|,|\n|\|.]','',x),post['text']))
post['date']=post['date'].astype(int)
post['like_count']=post['like_count'].astype(int)
post['comment_count']=post['comment_count'].astype(int)
post['video_view_count']=post['video_view_count'].astype(int)
post['day_post']=list(map(lambda x: datetime.datetime.fromtimestamp(x).strftime('%Y-%m-%d'),post['date']))
post['time_post']=list(map(lambda x: datetime.datetime.fromtimestamp(x).strftime('%H'),post['date']))
post['time_post']=post['time_post'].astype(int)
post=post.drop(['date'], axis=1)
post['day_post'] = pd.to_datetime(post['day_post'], errors='coerce')
post['day_post']=post['day_post'].dt.day_name()
post['time_post']=post['time_post'].apply(f)

database1 = client.get_database('test')
records1 = database['instaprofiles']
data1=pd.DataFrame(records1.find())
profile=data1[['username','id','business_category_name','biography','is_verified']

#insta= profile.merge(post, left_on='id', right_on='owner_id',suffixes=('_left', '_right'))

#insta =insta.drop(['owner_id'], axis=1)
#insta['is_verified']=insta['is_verified'].astype(int)
#insta['is_video']=insta['is_video'].astype(int)

#instagram.head(1)


#average_hashtag = round(instagram['hashtag_count'].mean())
#print('Average hashtag per publication:',average_hashtag)

#average_link = round(instagram['link_count'].mean())
#print('Average external link per publication:',average_link)

#max_likes=round(instagram['like_count'].max())
#print('Maximum likes per publication:' , max_likes)

#max_comment=round(instagram['comment_count'].max())
#print('Maximun comments per publication:' ,max_comment)

#time_post=pd.DataFrame(instagram['time_post'].value_counts())

#time_post['%_post_time']=list(map(lambda x: (x / (sum(time_post['time_post'])))*100,time_post['time_post']))

#time_post.head(5)

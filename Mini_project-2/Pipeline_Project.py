
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import numpy as np
import pymysql
from sqlalchemy import create_engine

def acquire():
    engine = create_engine('mysql+pymysql://root:Florida2020@localhost/el_proyecto')
    import pymysql.cursors
    connection = pymysql.connect(host='127.0.0.1',
                                 user='root',
                                 password='Florida2020',
                                 db='el_proyecto',
                                 charset='utf8mb4',
                                 cursorclass=pymysql.cursors.DictCursor)
    data = pd.read_csv('C:/Users/leandro/Desktop/Databases/endorsements-2020.csv')
    return data

def export_data_sql():
    data.to_sql(con=engine, name='endorsement-2020', if_exists='replace', index=False)
    return data

def import_pre_clean_data():
    data1 = pd.read_sql_query('SELECT * FROM `endorsement-2020`', connection)
    return data1

def drop_columns(): # Drop Columns with null values greater 50% of total rows
    column_dropper = data1.isnull().sum() / len(data1['City']) * 100
    column_check = data1["Date"].count() / len(data1['Date']) * 100
    if column_check > column_dropper:
        del data1['Date']
    else:
        return data1["Date"]

def wrangle(df):
    # Check Dataframe structure
    data_shape = data1.shape

    # Rename remaining columns
    data1.rename(columns={'date': 'Date', 'position': 'Gov_Position', 'city': 'City', 'state':'State ', 'endorser': 'Endorser',
                          'endorsee': 'Endorsee_Candidate', 'endorser party': 'Endorser_Party',
                          'source': 'Data_Source', 'category': 'Gov_Category', 'points': 'Points'}, inplace=True)

    # Fill Null spaces for columns with values less
    data1['Data_Source'].fillna('Unknown')

    # Capitalize string in
    data1['Gov_Position'] = data1['Gov_Position'].str.capitalize()
    return data1

def visualize(df):

    endorsee_results=data1.groupby('Endorsee_Candidate')['Points'].sum().plot(kind='bar',legend="Reverse")
    state_results=data1.groupby('state')['Points'].sum().plot(kind='bar', legend="Reverse")
    gov_category=data1.groupby('Gov_Category')['Points'].sum().plot(kind='bar', legend="Reverse")
    return endorsee_results,state_results,gov_category

def save_viz(endoree_results,state_results,gov_category):
    fig1 = endoree_results.get_figure()
    fig1.savefig(title + '.png')
    fig2 = state_results.get_figure()
    fig2.savefig(title + '.png')
    fig3 = gov_category.get_figure()
    fig3.savefig(title + '.png')

def save_data(data1):
    data1.to_sql('endorsement-2020-modified', engine, if_exists='replace', index=False)

if __name__ == '__main__':
    data = acquire()
    filtered = wrangle(data)
    results = analyze(filtered)
    barchart = visualize(results)
    save_viz(ndoree_results,state_results,gov_category)
    save_data(data1)
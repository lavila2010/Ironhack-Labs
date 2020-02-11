
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import numpy as np
import pymysql
from sqlalchemy import create_engine

def main ():

    def acquire():       # data from SQL
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

    def acquire_export_data_sql():
        data.to_sql(con=engine, name='endorsement-2020', if_exists='replace', index=False)
        return data

    def acquire_import_pre_clean_data():
        data1 = pd.read_sql_query('SELECT * FROM `endorsement-2020`', connection)
        return data1

    def wrangle_drop_columns(df): # Drop Columns with null values greater 50% of total rows
        column_dropper = data1.isnull().sum() / len(data1['City']) * 100
        check = column_dropper.to_dict()

        if column_check > column_dropper:
            del data1['Date']
        else:
            return data1["Date"]
            # data_Pending #
    def wrangle_rename_columns (df): # Rename remaining columns
        renamed_columns= data_pending.rename(columns={'date': 'Date', 'position': 'Gov_Position', 'city': 'City', 'state':'State ', 'endorser': 'Endorser',
                          'endorsee': 'Endorsee_Candidate', 'endorser party': 'Endorser_Party',
                          'source': 'Data_Source', 'category': 'Gov_Category', 'points': 'Points'}, inplace=True)
        return renamed_columns

    def wrangle_fill_null(df): # Fill Null spaces for columns with values less
        clean_data_frame= renamed_columns['Data_Source'].fillna('Unknown')
        return clean_data_frame

    def visualize(df):
        endorsee_results=clean_data_frame.groupby('Endorsee_Candidate')['Points'].sum().plot(kind='bar',legend="Reverse")
        state_results=clean_data_frame.groupby('state')['Points'].sum().plot(kind='bar', legend="Reverse")
        gov_category=clean_data_frame.groupby('Gov_Category')['Points'].sum().plot(kind='bar', legend="Reverse")
        return endorsee_results,state_results,gov_category

    def save_viz(endorsee_results,state_results,gov_category):
        fig1 = endorsee_results.get_figure()
        fig1.savefig(title + '.png')
        fig2 = state_results.get_figure()
        fig2.savefig(title + '.png')
        fig3 = gov_category.get_figure()
        fig3.savefig(title + '.png')

    def save_data(clean_data_frame):
        clean_data_frame.to_sql('endorsement-2020-modified', engine, if_exists='replace', index=False)

if __name__ == '__main__':
    get_data = acquire()
    data_to_sql=acquire_data_sql()
    data_clean_sql= acquire_import_pre_clean_data()
    wrangle_drop = wrangle_drop_columns(data1)
    wrangle_rename = wrangle_rename_columns(data_pending)
    wrangle_fill= wrangle_fill_null(renamed_columns)
    visualization = visualize(clean_data_frame)
    save_viz(ndoree_results,state_results,gov_category)
    data_storage = save_data(data1)
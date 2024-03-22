```python
import pandas as pd
from sqlalchemy import create_engine
from AxpoValuationLogic.data_import import prep_client_contract
import psycopg2


conn = psycopg2.connect(host="localhost", port=5432, dbname='testing', user='simpleUser', password='1234')

def recreate_db():
    with open('ValuationSchema.sql') as file:
        schema = file.read()
    with conn:
        with conn.cursor() as curr:
            curr.execute(schema)
            conn.commit()


qry2 = """
Select * from clientcontract
"""


def run_query_and_ret_result():
    with conn:
        with conn.cursor() as curr:
            engine = create_engine(
                'postgresql+psycopg2://simpleUser:1234@localhost:5432/testing')

            df = pd.read_csv(r"C:\Users\kwatras\Projects\AxpoValuation\AxpoValuationLogic\tests\mock_data\clients_proper.csv")
            df = prep_client_contract(df)
            df.to_sql("clientcontract", engine, if_exists='append', index=False)
            # df.to_sql("clientcontract", engine, if_exists='append', index=False)
            # curr.execute(qry1)
            curr.execute(qry2)
            x = curr.fetchall()
            print(len(x))


if __name__ == '__main__':
    recreate_db()
    # run_query_and_ret_result()
```


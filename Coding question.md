# Coding question

In an article [here](https://www.removepaywall.com/search?url=https://carloarg02.medium.com/my-favorite-coding-question-to-give-candidates-17ea4758880c). I found some coding question:

> Let’s say we have a website and we keep track of what pages customers are viewing, for things like business metrics.
> 
> Every time somebody comes to the website, we write a record to a log file consisting of Timestamp, PageId, CustomerId. At the end of the day we have a big log file with many entries in that format. And for every day we have a new file.
> 
> Now, given two log files (log file from day 1 and log file from day 2) we want to generate a list of ‘loyal customers’ that meet the criteria of: 
> 	a. they came on both days, and 
> 	b. they visited at least two unique pages.

The question is not particularly difficult, but it does require a little bit of
thinking and knowledge of code complexity and data structures. You can easily
get the customers that came on both days, you can easily get the customers that
visited at least two unique pages, but getting the _intersection_ of those two
_efficiently_ requires a little more work.


## Ask Clarifying Questions

Great candidates must ask clarifying questions before jumping into coding. I’m hoping to see some intuition from my candidates as I’ve actually expressed the problem in an **ambiguous** way.

0. _Did I mean 2 unique pages_ **_per day_** _or_ **_overall_**_?_

0. Is the visit to a website **a** and **b** on the same day and visit to **a** on the next enough?

here yes, because there is a b-a pair.

0. but if he/she _visited the website **a** on day 1 and **b** on day 2 is it still the same?_

again, yes because there are 2 websites overall that were visited and they were
not the same.

0. but, if he/she _visited website **a** and **b** on day 1 and none on day 2_ then does it count?

No because the condition "a" is not met.

0. **what scale are we talking about here?** _Does the data fit in memory?_ Can I load the contents of one of these files in memory? Can I load the contents of both?

For purpose of short interview - just assume it will work in memory. 
What would he/she use if the file will not fit in the memory?

0. Maybe the files have data from different days?

For this one let's have a guarantee that the file contains only one day records.

0. Maybe the files, will scale to 3, 4 or more files?

In the scope of the interview - it is ok to make solution just for 2 and describe with words how to scale it up to more

0. Can we pre-process the file?

It is possible to sort the files in $O(n\text{ log}(n))$ but then just use the
2-pointer algorithm in $O(n)$ time and $O(1)$ space.
We sort each file by customer_id and page_id.
Last approach shows deep algorithmic + data processing knowledge.

Lastly, another clarifying question that is important is **how much does
Performance vs Memory vs Maintainability matter?**

There’s a naive solution that is O(n²) in running time, but only uses O(1) of
memory. There’s a better solution that has running time of O(n) but uses O(n) of
memory. And there’s an in-between solution that does some pre-processing in O(n
log n) with O(k) of memory, then the main algorithm is O(n) with O(1) of memory.
Each one has pros and cons.
**Some of the heuristics you may use for improving performance or memory usage
may make the code harder to read and evolve later on.** On more senior
candidates, I’m hoping to have a spirited chat about these.

## Solution and thoughts

It is ok to **start** with naive solution that is **2 loops with an if statement**. (**$O(n^2)$**)
But, there **has to be** an "but this is a **terrible approach** and has to be improved"
Also, this is a clear data processing: function programming would be nice as well as types definitions.
Additionally, this is an I/O bound task so it would make sense to see that there
is **at least possibility of** making it a **multi-threaded algorithm**.

### My current solution:
Linear space and time.

approx. 30 min to write with no code suggestions (no LSP) so probably like 20
with code suggestions from AI + LSP.
Technically, this is not finished, cuz this is script not function and there are
no tests.
In the 15 min left, rewrite this to be a function and make some tests, you can
use AI for tests as well as internet for any docs/forum help you need.

```python
text1 = """  
timestamp,page_id,customer_id  
01-01-2024,1,1  
01-01-2024,2,1  
01-01-2024,1,3  
01-01-2024,1,4  
01-01-2024,1,4  
01-01-2024,1,4  
01-01-2024,1,5  
01-01-2024,1,5  
01-01-2024,1,6  
01-01-2024,2,7  
01-01-2024,3,7  
"""  
text2 = """  
timestamp,page_id,customer_id  
02-01-2024,1,2  
01-01-2024,1,3  
02-01-2024,1,4  
02-01-2024,1,4  
02-01-2024,1,4  
02-01-2024,1,5  
02-01-2024,1,5  
02-01-2024,2,6  
02-01-2024,2,7  
02-01-2024,3,7  
"""  
  
  
from typing import Iterable, Optional  
from dataclasses import dataclass  
from datetime import date, datetime  
  
  
@dataclass  
class Record:  
    timestamp: date  
    page_id: int  
    customer_id: int  
  
  
def identity(x):  
    return x  
  
  
def make_record_from_line(line: str) -> Optional[Record]:  
    try:  
        timestamp, page_id, customer_id = line.split(',')  
    except Exception:  
        return None  
    try:  
        FORMAT = '%d-%m-%Y'  
        timestamp = datetime.strptime(timestamp, FORMAT).date()  
    except Exception:  
        return None  
    try:  
        page_id = int(page_id)  
    except Exception:  
        return None  
    try:  
        customer_id = int(customer_id)  
    except Exception:  
        return None  
    record = Record(timestamp, page_id, customer_id)  
    return record  
  
  
def make_records_from_file(file_text: str) -> Iterable[Record]:  
    lines = file_text.split('\n')  
    non_empty_lines = filter(identity, lines)  
    records = map(make_record_from_line, non_empty_lines)  
    no_error_records = filter(identity, records)  
    return no_error_records  
  
  
def get_customer_id(record: Record):  
    return record.customer_id  
  
  
def get_page_id(record: Record):  
    return record.page_id  
  
  
def make_dict_visited(records: Iterable[Record], result_dict: dict = None) -> dict:  
    result = {} if not result_dict else result_dict  
    for record in records:  
        if get_customer_id(record) not in result:  
            result[get_customer_id(record)] = {get_page_id(record)}  
        else:  
            result[get_customer_id(record)].add(get_page_id(record))  
    return result  
  
  
records1 = list(make_records_from_file(text1))  
records2 = list(make_records_from_file(text2))  
  
customers_day1 = set(map(get_customer_id, records1))  
customers_day2 = set(map(get_customer_id, records2))  
customers_both_days = customers_day1.intersection(customers_day2)  
  
pages_visited = make_dict_visited(records1)  
pages_visited = make_dict_visited(records2, pages_visited)  
  
  
def filter_dict_2_size_item(dict_pass: dict) -> dict:  
    result = {key: val for key, val in dict_pass.items() if len(val) >= 2}  
    return result  
  
  
def make_dict_by_keys(dict_pass: dict, keys: set) -> dict:  
    result = {key: dict_pass[key] for key in dict_pass if key in keys}  
    return result  
  
  
visited_sites_by_user_in_both = make_dict_by_keys(pages_visited, customers_both_days)  
filtered_by_2_unique = filter_dict_2_size_item(visited_sites_by_user_in_both)  
  
loyal_customers = list(filtered_by_2_unique.keys())  
  
print(loyal_customers)
```

### Thoughts

...
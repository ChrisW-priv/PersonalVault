---
title: Timeseries data in Python
description: Instruction on how to make a proper Timeseries in python
date: 2025-03-27
tags:
  - python
categories:
  - zettelkasten
---

## Creating a Timezone-Aware Series

Pandas provides `pd.date_range()` to generate time series data with a specified timezone.  

```python
import pandas as pd

# Create a time series in Europe/Warsaw timezone
times = pd.date_range(
    start="2025-03-30 00:00", 
    periods=6, 
    freq="h", 
    tz="Europe/Warsaw"
)

print(times)
# Result:
# DatetimeIndex(['2025-03-30 00:00:00+01:00', '2025-03-30 01:00:00+01:00',
#                '2025-03-30 03:00:00+02:00', '2025-03-30 04:00:00+02:00',
#                '2025-03-30 05:00:00+02:00', '2025-03-30 06:00:00+02:00'],
#               dtype='datetime64[ns, Europe/Warsaw]', freq='h')
times = pd.date_range(
    start="2025-10-26 00:00", 
    periods=6, 
    freq="h", 
    tz="Europe/Warsaw"
)

print(times)
# Result:
# DatetimeIndex(['2025-10-26 00:00:00+02:00', '2025-10-26 01:00:00+02:00',
#                '2025-10-26 02:00:00+02:00', '2025-10-26 02:00:00+01:00',
#                '2025-10-26 03:00:00+01:00', '2025-10-26 04:00:00+01:00'],
#               dtype='datetime64[ns, Europe/Warsaw]', freq='h')
```

Notice the sudden shift of time due to DST in Warsaw at that time.

## Understanding DST Jump

[Warsaw DST 2025 change](https://www.timeanddate.com/time/change/poland?year=2025)

- In **Europe/Warsaw**, year **2025**, DST starts on **March 30**, ends at **October 26**
- On March, the clock jumps **from 02:00 to 03:00**, skipping **02:00 local time**.
- On October the clock jumps **from 03:00 to 02:00**, causing repeat of **02:00 local time**.

Example Output:  

```
2025-03-30 00:00:00+01:00
2025-03-30 01:00:00+01:00
2025-03-30 03:00:00+02:00  <- 02:00 is skipped!
2025-03-30 04:00:00+02:00
2025-03-30 05:00:00+02:00
2025-03-30 06:00:00+02:00
```

## Converting to UTC

To ensure consistency, convert to **Coordinated Universal Time (UTC)** with `.tz_convert("UTC")`.  

```python
# Convert to UTC
utc_times = times.tz_convert("UTC")
print(utc_times)
# Result
# DatetimeIndex(['2025-03-29 23:00:00+00:00', '2025-03-30 00:00:00+00:00',
#                '2025-03-30 01:00:00+00:00', '2025-03-30 02:00:00+00:00',
#                '2025-03-30 03:00:00+00:00', '2025-03-30 04:00:00+00:00'],
#               dtype='datetime64[ns, UTC]', freq='h')

```

**UTC Output (No DST Effects in UTC)**:  

```
2025-03-29 23:00:00+00:00
2025-03-30 00:00:00+00:00
2025-03-30 01:00:00+00:00
2025-03-30 02:00:00+00:00
2025-03-30 03:00:00+00:00
2025-03-30 04:00:00+00:00
```

🔹 **No missing hours!** Since UTC has no daylight saving, it simply shifts all times accordingly.  

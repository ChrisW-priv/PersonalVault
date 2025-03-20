---
title: Timezones in Python
description: Set of guidelines to making timezone aware program in Python
date: 2025-03-20
tags: 
categories:
  - zettelkasten
---


**Q: What does `datetime.datetime.now()` return by default?**

**A:** It returns a **naive** `datetime` object in the system's **local timezone**, with no timezone info attached.

```python
import datetime
dt = datetime.datetime.now()
# naive local datetime
```

**Q: How do I get the current UTC datetime as a timezone-aware object?**

**A:** Use `datetime.now()` with `datetime.timezone.utc` to get an **aware UTC datetime**.

```python
import datetime
now_utc = datetime.datetime.now(datetime.timezone.utc)
```

**Q: How do I get the current datetime in Poland/Warsaw timezone?**

**A:** Use the `zoneinfo` module (Python 3.9+):

```python
import datetime
import zoneinfo

now_warsaw = datetime.datetime.now(zoneinfo.ZoneInfo("Europe/Warsaw"))
```

**Q: Why use `zoneinfo` instead of `pytz`?**

**A:**  
- `zoneinfo` is part of Python's **standard library (3.9+)** – no need to install `pytz`.
- Cleaner API – **no need for `.localize()`** or `.normalize()` like with `pytz`.
- Fully **PEP 615-compliant** and preferred for new code.

**Q: But can I still use `pytz` if needed?**

**A:** Yes, especially if you need to support **Python <3.9** or work with **legacy code**.

```python
import pytz
now_warsaw = datetime.datetime.now(pytz.timezone("Europe/Warsaw"))
```

**Q: Will specifying a timezone override my system's timezone?**

**A:**   **Yes!**   When you use `datetime.now(tz=...)`, it will **ignore the system timezone** and return the correct time in the provided timezone (e.g., UTC or Warsaw), adjusting for DST as needed.

**Q: How do I convert from UTC to Warsaw time?**

```python
# UTC -> Warsaw (zoneinfo way)
utc_dt = datetime.datetime.now(datetime.timezone.utc)
warsaw_dt = utc_dt.astimezone(zoneinfo.ZoneInfo("Europe/Warsaw"))
```

## ✅ **Recommended Modern Approach (Python 3.9+)**

- Use `zoneinfo.ZoneInfo("...")` for timezone handling.
- Only use `pytz` for legacy projects or older Python versions.

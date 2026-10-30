with open(r"C:\Users\kartv\Downloads\websitemakes\guns_page.html", "r", encoding="utf-8") as f:
    html = f.read()

import re, json

idx = html.find(r'\"username\":\"vishwa_31\"')
if idx != -1:
    start = html.rfind(r'{\"_id\":', 0, idx)
    end = html.find(r'\"premium\":false', idx) + len(r'\"premium\":false')
    raw = html[start:end] + '}'
    clean = raw.replace(r'\"', '"').replace(r'\\', '\\')
    with open(r"C:\Users\kartv\Downloads\websitemakes\profile_clean.json", "w", encoding="utf-8") as out:
        out.write(clean)
    print("SAVED! Length:", len(clean))
    print(clean[:3000])
else:
    print("NOT FOUND")

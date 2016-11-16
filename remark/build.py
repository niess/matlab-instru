#!/usr/bin/env python
import locale
locale.setlocale(locale.LC_TIME,'')
import time

def make_slides(title, template, content, output):
    with open(template, "r") as f:
        template = f.read()
    text = template.replace("{{title}}", title)
    with open(content, "r") as f:
        content = f.read()
    now = time.strftime('%A %d/%m/%Y')
    content = content.replace("{{now}}", now)
    text = text.replace("{{content}}", content)
    with open(output, "w+") as f:
        f.write(text)

if __name__ == "__main__":
    template = "remark/template.html"
    make_slides("Initiation &#224; Matlab (1)", template, "docs/session1.md",
        "docs/session1.html")
    make_slides("Initiation &#224; Matlab (1)", template, "docs/reponses1.md",
        "docs/reponses1.html")

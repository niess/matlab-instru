#!/usr/bin/env python

def make_slides(title, template, body, output):
    with open(template, "r") as f:
        template = f.read()
    text = template.replace("[TITLE]", title)
    with open(body, "r") as f:
        body = f.read()
    text = text.replace("[BODY]", body)
    with open(output, "w+") as f:
        f.write(text)

if __name__ == "__main__":
    template = "remark/template.html"
    make_slides("Initiation &#224; Matlab (1)", template, "docs/session1.md",
        "docs/session1.html")
    make_slides("Initiation &#224; Matlab (1)", template, "docs/reponses1.md",
        "docs/reponses1.html")

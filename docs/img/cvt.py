import base64

def cvtImg(fn, out):
    with open(fn, 'rb') as f:
        base = base64.b64encode(f.read())

    with open(out, 'w') as f:
        f.write(base)


cvtImg('img0.png', 'img.b')

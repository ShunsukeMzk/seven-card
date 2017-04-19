from bottle import route, run, view, request, redirect, url, static_file
import os
import glob

from card import Card
import action

@route('/<filepath:path>', name='static_file')
def static(filepath):
    return static_file(filepath, root="./")


@route('/')
@view('index')
def init():

    master_card = Card()

    first_cards = master_card.child_cards()

    # -- 画像リスト取得 --
    # パス内の全ての"指定パス+ファイル名"と"指定パス+ディレクトリ名"を要素とするリストを返す
    files = glob.glob('./selectImages/*.*')  # ワイルドカードが使用可能

    selectImages = [os.path.basename(file) for file in files]

    return dict(first_cards=first_cards, selectImages=selectImages, url=url)


@route('/list/<card_no>', method="POST")
@view('list')
def list(card_no):

    # 親カードの情報を取得する
    parent_card = Card(card_no)

    # 親カードに紐づく子カードの情報を取得する
    child_cards = parent_card.child_cards()

    return dict(parent_card=parent_card, child_cards=child_cards, url=url)



@route('/create', method="POST")
def create():

    new_card = Card()

    if len(request.forms.get("name")) != 0:
        new_card.name = request.forms.get("name")

    if len(request.forms.get("description")) != 0:
        new_card.description = request.forms.get("description")

    if request.forms.get("parentNo") != "--":
        new_card.parent_no = request.forms.get("parentNo")

    # TODO 画像選択フォームを使うかどうか・・・
    if "image" in request.files:
        image = request.files["image"]

        image_name, file_ext = os.path.splitext(image.filename)
        image.save(os.path.join('./selectImages', image_name + file_ext))

        new_card.image = image_name + file_ext

    if len(request.forms.get("selectImage")) != 0:
        new_card.image = request.forms.get("selectImage")

    new_card.create()

    redirect('/')


@route('/drop/<card_no>', method="POST")
def drop(card_no):

    Card(card_no).drop()

    redirect('/')



run(host='0.0.0.0', port=8080, debug=True)

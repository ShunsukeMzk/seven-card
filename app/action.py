# -*- coding: utf-8 -*-
from bottle import route, run, template, view, request, redirect, url, static_file
import os
import shutil
import mysql.connector

import glob

from card import Card

from robobrowser import RoboBrowser
import random

@route('/action/scrape/<card_no>', method="POST")
def scrape(card_no):

    serch_card = Card(card_no)

    # -- スクレイピング --
    browser = RoboBrowser(parser='html.parser')

    browser.open('https://www.google.co.jp/')

    form = browser.get_form(action='/search')
    form['q'] = serch_card.name

    browser.submit_form(form, list(form.submit_fields.values())[0])

    new_card = Card()
    new_card.name = serch_card.name
    # 画像はとりあえずランダムに設定
    new_card.image = random.choice([os.path.basename(file) for file in glob.glob('./selectImages/*.*')])
    new_card.description = "検索結果：" + serch_card.name

    new_card.create()

    for a in browser.select('h3 > a'):

        new_child_card = Card()
        new_child_card.name = a.text[0:32].encode("utf-8")
        new_child_card.image = random.choice([os.path.basename(file) for file in glob.glob('./selectImages/*.*')])
        new_child_card.description = a.get('href')
        new_child_card.parent_no = new_card.no

        new_child_card.create()


    redirect('/')

import os
import shutil
import mysql.connector

# hostアドレスはdocker ps,docker inspect [コンテナID]で調べて変更
connect_value = {}
connect_value['host'] = '172.17.0.3'
connect_value['db'] = 'cards'
connect_value['user'] = 'python'
connect_value['passwd'] = 'python'
connect_value['charset'] = 'utf8'

'''
connect_value['host'] = 'localhost'
connect_value['db'] = 'cards'
connect_value['user'] = 'root'
connect_value['passwd'] = ''
connect_value['charset'] = 'utf8'
'''

class Card:

    def __init__(self, card_no=0, attr=0, image="_err.jpg", name="No Name", description="・・・・・・", parent_no=0):
        connector = mysql.connector.connect(**connect_value)
        cursor = connector.cursor()

        self.no = card_no
        self.attr = attr
        self.name = name
        self.image = image
        self.description = description
        self.parent_no = parent_no

        if card_no != 0:
            sql = u"select * from cards where no = %s"
            cursor.execute(sql, (card_no,))

            fetch_card = (cursor.fetchall())[0]

            self.attr = fetch_card[1]
            self.name = fetch_card[2]
            self.image = fetch_card[3]
            self.description = fetch_card[4]
            self.parent_no = fetch_card[5]

        cursor.close()
        connector.close()


    def child_cards(self):
        connector = mysql.connector.connect(**connect_value)
        cursor = connector.cursor()

        parent_no = self.no

        sql = u"select * from cards where parent_no = %s order by no"
        cursor.execute(sql, (parent_no,))

        child_cards = cursor.fetchall()

        cursor.close()
        connector.close()

        return_child_cards = []
        for child_card in child_cards:
            card = Card()

            card.no = child_card[0]
            card.attr = child_card[1]
            card.name = child_card[2]
            card.image = child_card[3]
            card.description = child_card[4]
            card.parent_no = child_card[5]

            return_child_cards.append(card)

        return return_child_cards


    def drop(self):
        connector = mysql.connector.connect(**connect_value)
        cursor = connector.cursor()

        if self.no != 0:
            # 親カードを削除
            sql = u"delete from cards where no = %s"
            cursor.execute(sql, (self.no, ))

            # 子カードも削除
            sql = u"delete from cards where parent_no = %s"
            cursor.execute(sql, (self.no,))

            # ファイルが存在してれば消す いろんな拡張しに対応する必要あり
            for ext in [".jpg", ".jpeg", ".JPG", ".JPEG", ".png", ".PNG", ".gif", ".GIF"]:
                if os.path.isfile(os.path.join("./images/", self.no + ext)):
                    os.remove(os.path.join("./images/", self.no + ext))

            print("-- deleted No:" + self.no + " --")

            connector.commit()

        cursor.close()
        connector.close()


    def create(self):
        connector = mysql.connector.connect(**connect_value)
        cursor = connector.cursor()

        # 取得できる内容でインサート
        sql = u"insert into cards (name, image, description, parent_no)values(%s, %s, %s, %s)"
        cursor.execute(sql, (self.name, self.image, self.description, self.parent_no))

        # インサートした際のindexを取得する
        sql = u"select last_insert_id() from cards limit 1"
        cursor.execute(sql)

        ins_no = (cursor.fetchall())[0][0]
        self.no = ins_no

        # 取得したindexで画像ファイルをコピー
        image_name, file_ext = os.path.splitext(self.image)
        shutil.copyfile("./selectImages/" + self.image, "./images/" + str(ins_no) + file_ext)
        self.image = str(ins_no) + file_ext

        # 最初にインサートした内容を取得したindexで更新
        # TODO imageカラムをなくす
        sql = u"update cards set image = %s where no = %s"
        cursor.execute(sql, (self.image, self.no))

        connector.commit()

        print("-- inserted No:" + str(ins_no) + " --")

        cursor.close()
        connector.close()

        return self
